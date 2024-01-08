import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:macstore/vendor/authentication/Create_store_screen.dart';
import 'package:macstore/vendor/authentication/vendor_register_screen.dart';

class VendorController extends GetxController {
  static VendorController instance = Get.find();
  late Rx<User?> _user;
  User get user => _user.value!;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.off(() => VendorRegisterScreen());
    } else {
      Get.off(() => CreateStoreScreen());
    }
  }

  Future<String> createNewUser(
    String email,
    String companyName,
    String companyNumber,
    String password,
    String address,
    String companyId,
  ) async {
    String res = 'some erorr occured';

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // String downloadUrl = await _uploadImageToStorage(image);

      await _firestore.collection('vendors').doc(userCredential.user!.uid).set({
        'companyName': companyName,
        'storeImage': '',
        'email': email,
        'storeId': userCredential.user!.uid,
        'companyNumber ': companyNumber,
        'address': address,
        'companyId': companyId,
        'categoryName': '',
        'description': '',
      });

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  ///FUNCTION TO LOGIN THE CREATED USER

  Future<String> loginVendorUserUser(String email, String password) async {
    String res = 'some error occured';

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
