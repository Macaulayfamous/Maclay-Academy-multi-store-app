import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:macstore/vendor/screens/vendor_main_screen.dart';
import 'package:macstore/views/screens/widgets/button_widget.dart';
import 'package:macstore/views/screens/widgets/custom_text_Field.dart';

class CreateStoreScreen extends StatefulWidget {
  @override
  State<CreateStoreScreen> createState() => _CreateStoreScreenState();
}

class _CreateStoreScreenState extends State<CreateStoreScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _selectedCategory;
  late String description;
  bool _isLoading = false;

  List<String> _categoryList = [];
  Uint8List? _image;

  _getCategories() {
    return _firestore
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _categoryList.add(doc['categoryName']);
        });
      });
    });
  }

  @override
  void initState() {
    _getCategories();
    super.initState();
  }

  _uploadProfileImageToStorage(Uint8List? image) async {
    Reference ref =
        _storage.ref().child('storeImage').child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image!);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No Image Selected');
    }
  }

  selectGalleryImage() async {
    Uint8List im = await pickProfileImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  Widget buildDropdownField(String labelText) {
    return DropdownButtonFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'enter category';
        } else {
          return null;
        }
      },
      value: _selectedCategory,
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            _selectedCategory = value;
          });
        }
      },
      items: _categoryList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        labelText: labelText,
      ),
    );
  }

  uploadData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      String storeImageUrl = await _uploadProfileImageToStorage(_image);
      await _firestore
          .collection('vendors')
          .doc(_auth.currentUser!.uid)
          .update({
        'storeImage': storeImageUrl,
        'categoryName': _selectedCategory,
        'description': description,
      }).whenComplete(() {
        Get.to(vendorMainScreen());
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Your Store\n Reach Your Customers',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.6,
                  ),
                ),
                Text(
                  'We Will Help You Sell Your Products',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.7,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Add Store Image',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                TextFormField(
                  onTap: () {
                    selectGalleryImage();
                  },
                  decoration: InputDecoration(
                      prefixIcon: _image != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    9,
                                  ),
                                  child: Image.memory(
                                    _image!,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            )
                          : Icon(
                              CupertinoIcons.photo,
                            ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: _image != null
                          ? "Store Logo Selected"
                          : 'Select Your Store Logo',
                      suffixIcon: Icon(
                        CupertinoIcons.down_arrow,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'About Your Bussiness',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                CustomTextField(
                  label: 'write about your shop',
                  prefixIcon: Icon(
                    Icons.store,
                  ),
                  text: 'write about your shop',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter about your shop';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    description = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Area of Specialization',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                buildDropdownField('category'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidgets(
              buttonChange: () async {
                uploadData();
              },
              isLoading: _isLoading ? true : false,
              buttonTitle: 'Create Store')
        ],
      ),
    );
  }
}
