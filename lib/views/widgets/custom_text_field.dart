import 'package:flutter/material.dart';
import 'package:hungry/views/utils/AppColor.dart';

class CustomTextField extends StatelessWidget {
  final Function validator;
  final String title;
  final String hint;
  final TextEditingController controller;
  final bool obsecureText;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  CustomTextField({
    @required this.validator,
    @required this.title,
    @required this.hint,
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
              validator: validator,
              /*
              validator: (val) {
                if (title == "Email") {
                  if (val.isEmpty) {
                    return 'Ingrese un email';
                  } else {
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                        .hasMatch(val)) {
                      return 'Ingrese válido';
                    } else {
                      return null;
                    }
                  }
                }
                if (title == "Password") {
                  if (val.isEmpty) {
                    return 'Ingrese una contraseña';
                  } else {
                    if (!RegExp('^.{8}').hasMatch(val)) {
                      return 'Ingrese una contraseña válida';
                    } else {
                      return null;
                    }
                  }
                }
                if (title == "Nombre y Apellidos") {
                  if (val.isEmpty) {
                    return 'Ingrese su nombre y apellidos';
                  } else {
                    if (!RegExp(r'(^[a-zA-Z ]*$)').hasMatch(val)) {
                      return 'El nombre solo debe contener letras';
                    } else {
                      return null;
                    }
                  }
                }
                if (title == "Repetir Password") {
                  if (val.isEmpty) {
                    return 'Ingrese una contraseña';
                  } else {
                    if (!RegExp('^.{8}').hasMatch(val)) {
                      return 'Ingrese una contraseña válida';
                    } else {
                      return null;
                    }
                  }
                }
              },*/
            ),
          ),
        ],
      ),
    );
  }
}
