// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ReuseHeaderWidget extends StatelessWidget {
//   const ReuseHeaderWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 118,
//       clipBehavior: Clip.hardEdge,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(
//             'assets/icons/cartb.png',
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Positioned(
//               left: 322,
//               top: 52,
//               child: Stack(
//                 children: [
//                   Image.asset(
//                     'assets/icons/not.png',
//                     width: 26,
//                     height: 26,
//                     fit: BoxFit.contain,
//                   ),
//                   Positioned(
//                     right: 0,
//                     top: 0,
//                     child: badges.Badge(
//                       badgeStyle: badges.BadgeStyle(
//                         badgeColor: Colors.yellow.shade800,
//                       ),
//                       badgeContent: Text(
//                         cartData.length.toString(),
//                         style: GoogleFonts.lato(
//                           // fontSize: 11,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//           Positioned(
//             left: 61,
//             top: 51,
//             child: Text(
//               'My Cart',
//               style: GoogleFonts.getFont(
//                 'Lato',
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 23,
//             top: 57,
//             child: Image.asset(
//               'assets/icons/arrow.png',
//               width: 10,
//               height: 12,
//               fit: BoxFit.contain,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
