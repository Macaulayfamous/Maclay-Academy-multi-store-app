import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
 
  final bool isLoading;
  final String buttonTitle;
  final void Function() buttonChange;

  const ButtonWidgets({
    super.key,
  
    required this.buttonChange,
    required this.isLoading,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 95,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: buttonChange,
              child: Container(
                width: 319,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF102DE1), Color(0xCC0D6EFF)],
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 278,
                      top: 19,
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 12,
                              color: const Color(0xFF1D3DE5),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 260,
                      top: 29,
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: 10,
                          height: 10,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: const Color(0xFF2141E5),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 311,
                      top: 36,
                      child: Opacity(
                        opacity: 0.3,
                        child: Container(
                          width: 5,
                          height: 5,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 281,
                      top: -10,
                      child: Opacity(
                        opacity: 0.3,
                        child: Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              buttonTitle, // Add your button text here
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
