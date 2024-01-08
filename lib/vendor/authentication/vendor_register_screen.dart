import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macstore/vendor/authentication/Create_store_screen.dart';
import 'package:macstore/vendor/controllers/vendor_controller.dart';
import 'package:macstore/views/screens/widgets/button_widget.dart';
import 'package:macstore/views/screens/widgets/custom_text_Field.dart';

class VendorRegisterScreen extends StatefulWidget {
  @override
  State<VendorRegisterScreen> createState() => _VendorRegisterScreenState();
}

class _VendorRegisterScreenState extends State<VendorRegisterScreen> {
  final VendorController _vendorController = VendorController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late String comapanyName;

  late String companyNumber;

  late String address;

  late String companyId;

  late String email;

  late String password;

  registerUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String res = await _vendorController.createNewUser(
          email, comapanyName, companyNumber, password, address, companyId);

      setState(() {
        _isLoading = false;
      });

      if (res == 'success') {
        Get.to(CreateStoreScreen());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('congratulations account has been created for you..')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('something went wrong'),
          ),
        );
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create Your Bussiness Account',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'To Make Your Bussiness Bigger',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset(
                    'assets/images/Illustration.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Company Name',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  CustomTextField(
                    label: 'enter your company name',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/user.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    text: 'enter your company name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter company name';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      comapanyName = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Company Number',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  CustomTextField(
                    label: 'enter your company number',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/phone.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    text: 'enter your company number',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter company number';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      companyNumber = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Address',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  CustomTextField(
                    label: 'enter your address',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/location.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    text: 'enter your addres',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter company address';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      address = value;
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Company Id',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  CustomTextField(
                    label: 'enter your company id',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/card.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    text: 'enter your company id',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter company id';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      companyId = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  CustomTextField(
                    label: 'enter your email',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/icons/email.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    text: 'enter your email ',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter email ';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  CustomTextField(
                    label: 'enter your password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/icons/password.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    text: 'enter your password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter password ';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidgets(
            buttonChange: () {
              registerUser();
            },
            isLoading: _isLoading ? true : false,
            buttonTitle: 'Sign up',
          ),
        ],
      ),
    );
  }
}
