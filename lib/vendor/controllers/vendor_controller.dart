import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
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
      // Check the user role before navigating to the screen
     
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
    String res = 'some error occurred';

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

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

 Future<Map<String, dynamic>> loginVendorUser(String email, String password) async {
  Map<String, dynamic> res = {'status': 'error', 'role': ''};

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    DocumentSnapshot userDoc = await _firestore
        .collection('vendors') // Assuming vendors are stored in a 'vendors' collection
        .doc(userCredential.user!.uid)
        .get();

    if (userDoc.exists) {
      res = {
        'status': 'success',
        'role': 'vendor', // Set the role as 'buyer' for vendors
      };
    } else {
      res['status'] = 'Invalid user role or user not found.';
    }
  } catch (e) {
    res['status'] = e.toString();
  }

  return res;
}

}
