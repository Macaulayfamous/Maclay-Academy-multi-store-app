import 'package:flutter/material.dart';



class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 99,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            left: 0,
            top: 69,
            child: SizedBox(
              width: 83,
              height: 30,
              child: Text(
                'Fashion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  letterSpacing: 0.3,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 0,
            child: Material(
              type: MaterialType.transparency,
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {},
                overlayColor: const MaterialStatePropertyAll<Color>(
                  Color(0x0c7f7f7f),
                ),
                child: Ink(
                  color: Colors.white,
                  width: 63,
                  height: 63,
                ),
              ),
            ),
          ),
          Positioned(
            left: 18,
            top: 5,
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FoWHqAkkBQtCIoAn9Tb3B%2Fd84d713c22858e1d6a3fa0fb820a13dcfabf3230clothes.png?alt=media&token=8b5edcd3-b686-47e9-b5ec-06d60f92d8d3',
              width: 47,
              height: 47,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}