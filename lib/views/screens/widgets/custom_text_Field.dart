import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String label;
  final Widget prefixIcon;
  final bool isPassword;
  final String text;
  void Function(String)? onChanged;
  String? Function(String?)? validator;

  CustomTextField({
    required this.label,
    required this.prefixIcon,
    this.isPassword = false,
    required this.text,
    required this.validator,
    required this.onChanged,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscureText: widget.isPassword ? _isObscure : false,
          controller: _controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: widget.label,
            labelStyle: GoogleFonts.getFont(
              'Nunito Sans',
              color: Color(0xFF7F909F),
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.7,
            ),
            prefixIcon: Padding(
                padding: EdgeInsets.all(10.0), child: widget.prefixIcon),
            // contentPadding:
            //     EdgeInsets.fromLTRB(20 * fem, 18 * fem, 25.58 * fem, 18 * fem),
            hintStyle: TextStyle(color: Color(0xffbcbcbc)),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : null,
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
