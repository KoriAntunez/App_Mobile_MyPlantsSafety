import 'package:flutter/material.dart';
import 'package:hungry/views/utils/AppColor.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final String validationMessage;
  final TextEditingController controller;
  final bool obsecureText;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  CustomTextField({
    @required this.title,
    @required this.hint,
    @required this.validationMessage,
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
              obscureText: obsecureText,
              decoration: InputDecoration(
                hintText: '$hint',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                contentPadding: EdgeInsets.only(left: 16),
                border: InputBorder.none,
              ),
              validator: (val) {
                if (title == "Email") {
                  if (val.isEmpty) {
                    return '$validationMessage';
                  } else {
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                        .hasMatch(val)) {
                      return '$validationMessage válido';
                    } else {
                      return null;
                    }
                  }
                }
                if (title == "Password") {
                  if (val.isEmpty) {
                    return '$validationMessage';
                  } else {
                    if (!RegExp('^.{8}').hasMatch(val)) {
                      return '$validationMessage válido';
                    } else {
                      return null;
                    }
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
