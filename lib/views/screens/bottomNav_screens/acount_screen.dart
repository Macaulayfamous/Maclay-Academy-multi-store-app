import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/icons/1.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.89,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 20,
                top: 30,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.chat_bubble_2,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.horizontal_distribute,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.35,
                child: Center(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.2,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                left: MediaQuery.of(context).size.width * 0.35,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Macaulay Famous',
                        style: GoogleFonts.getFont(
                          'Readex Pro',
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            color: Colors.white,
                          ),
                          Text(
                            'Nioda City',
                            style: GoogleFonts.getFont(
                              'Readex Pro',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.47,
                left: 0, // Set left to 0
                right: 0, // Set right to 0
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/3.png',
                          width: 80,
                        ),
                        Text(
                          "22",
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Cart",
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/icon.png',
                          width: 80,
                        ),
                        Text(
                          "192",
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Favourite",
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/2.png',
                          width: 80,
                        ),
                        Text(
                          "162",
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Completed",
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
