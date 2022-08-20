import 'package:flutter/material.dart';
import 'package:fluttermlprediction/AppColor.dart';

class CustomTextField extends StatelessWidget {
  // DECLARACIÓN DE VARIABLES
  final String? title;
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obsecureText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  // CONSTRUCTOR
  CustomTextField({
    @required this.title,
    @required this.hint,
    @required this.validator,
    this.controller,
    this.obsecureText = false,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              '$title',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Container(
            //margin: EdgeInsets.only(top: 8),
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                color: AppColor.primaryExtraSoft,
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: controller,
              style: TextStyle(fontSize: 14),
              cursorColor: AppColor.primary,
              obscureText: obsecureText!,
              decoration: InputDecoration(
                hintText: '$hint',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                contentPadding: EdgeInsets.only(left: 16),
                border: InputBorder.none,
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
