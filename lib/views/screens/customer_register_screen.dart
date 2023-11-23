// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:macstore/views/screens/widgets/button_widget.dart';
// import 'package:macstore/views/screens/widgets/custom_text_Field.dart';

// class CustomerRegisterScreen extends StatefulWidget {
//   CustomerRegisterScreen({Key? key}) : super(key: key);

//   @override
//   State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
// }

// class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white.withOpacity(0.99),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Create Your Account',
//                   style: GoogleFonts.getFont(
//                     'Lato',
//                     color: Color(0xFF0D120E),
//                     fontSize: 23,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 0.2,
//                     height: 1.6,
//                   ),
//                 ),
//                 Text(
//                   'To Explore the world exclusives',
//                   style: GoogleFonts.getFont(
//                     'Lato',
//                     color: Color(0xFF0D120E),
//                     fontSize: 14,
//                     letterSpacing: 0.2,
//                     height: 1.6,
//                   ),
//                 ),

//                 Image.asset(
//                   'assets/images/Illustration.png',
//                   width: 200,
//                   height: 200,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   text: 'Email',
//                   label: 'enter your email',
//                   prefixIcon: Image.asset(
//                     'assets/icons/email.png',
//                     width: 20,
//                     height: 20,
//                   ),
//                 ),
//                 CustomTextField(
//                   text: 'Password',
//                   label: ' enter your password',
//                   prefixIcon: Image.asset(
//                     'assets/icons/password.png',
//                     width: 20,
//                     height: 20,
//                   ),
//                   isPassword: true,
//                 ),
//                 // Add more text fields as needed

//                 SizedBox(
//                   height: 20,
//                 ),

//                 ButtonWidgets()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
