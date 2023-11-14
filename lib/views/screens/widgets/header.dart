import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.20,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Image.asset(
            'assets/icons/1.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 48,
            top: 68,
            child: SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                autocorrect: false,
                maxLines: null,
                minLines: null,
                expands: true,
                cursorHeight: 14,
                cursorRadius: const Radius.circular(2),
                cursorColor: const Color(0xFF5C69E5),
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                  hintText: 'Enter text',
                  hintStyle: const TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                  hintMaxLines: 1,
                  errorStyle: const TextStyle(
                    color: Color(0xFFFF0000),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                  errorMaxLines: 1,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  prefixIcon: SizedBox.square(
                    dimension: 24,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/u95VPQt7clXUFWMKgdUNoZ5RqEy2%2Fuploads%2Fimages%2Fsearch.png?alt=media&token=a4c0d44a-4a87-489b-b575-feee812343d1',
                      scale: 5,
                    ),
                  ),
                  suffixIcon: SizedBox.square(
                    dimension: 24,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/u95VPQt7clXUFWMKgdUNoZ5RqEy2%2Fuploads%2Fimages%2Fcamera.png?alt=media&token=f22ff345-904f-4e09-9b9a-3cbe4d1e2d71',
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  focusColor: Colors.black,
                  hoverColor: const Color(0x197F7F7F),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
              ),
            ),
          ),
          Positioned(
            left: 311,
            top: 78,
            child: Material(
              type: MaterialType.transparency,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {},
                overlayColor:
                    MaterialStateProperty.all<Color>(const Color(0x0c7f7f7f)),
                child: Ink(
                  width: 31,
                  height: 31,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/u95VPQt7clXUFWMKgdUNoZ5RqEy2%2Fuploads%2Fimages%2F29f89a00_3f38_1d8d_bcd6_87304e104361_notifcation.png?alt=media',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 354,
            top: 78,
            child: Material(
              type: MaterialType.transparency,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {},
                overlayColor:
                    MaterialStateProperty.all<Color>(const Color(0x0c7f7f7f)),
                child: Ink(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/u95VPQt7clXUFWMKgdUNoZ5RqEy2%2Fuploads%2Fimages%2Fdacb5d00_3f69_1d8d_bcd6_87304e104361_chat.png?alt=media',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
