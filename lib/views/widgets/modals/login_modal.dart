import 'package:flutter/material.dart';
import 'package:hungry/views/screens/page_switcher.dart';
import 'package:hungry/views/utils/AppColor.dart';
import 'package:hungry/views/widgets/custom_text_field.dart';
import 'package:hungry/views/screens/bookmarks_page.dart';
<<<<<<< Updated upstream
import 'package:hungry/api/api_service.dart';
import 'package:hungry/models/core/login_model.dart';

=======
import 'package:http/http.dart' as http;
import 'dart:async';
>>>>>>> Stashed changes
class LoginModal extends StatefulWidget {
  @override
  _LoginModal createState() => _LoginModal();
}

<<<<<<< Updated upstream
class _LoginModal extends State<LoginModal>
{
  LoginRequestModel loginRequestModel;
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
=======
class _LoginModalState extends State<LoginModal> {
  final _formKey = GlobalKey<FormState>();

  String usu= "12@12.com";
  String pass="123";

  void ingresar(usu, pass) async{
    try{
      var response= await http.post(Uri.parse("https://localhost:44356/api/Usuario/login"),
        body:{
        "Email": usu,
          "Password": pass
        }).timeout(const Duration(seconds: 90));
      if(response.body!=""){
        print("MEnsaje de exito");
        Navigator.of(this.context).pushReplacement(MaterialPageRoute(
            builder: (context) => PageSwitcher()));}
      else{
        print("usuario incorrecto");
      }
    }on TimeoutException catch(e){
      print("Demora la conexion");
    }on Error catch(e){
      print("Http error");
    }
  }

  void _onFormSubmit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      showDialog(
        context: this.context,
        builder: (context) => AlertDialog(
          title: Text('Mensaje'),
          content: Text('Form submitted'),
        ),
      );
    }
>>>>>>> Stashed changes
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 35 / 100,
                  margin: EdgeInsets.only(bottom: 20),
                  height: 6,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                ),
              ),
              // header
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'inter'),
                ),
              ),
              // Form
              CustomTextField(title: 'Email', hint: 'youremail@email.com'),
              CustomTextField(title: 'Password', hint: '**********', obsecureText: true, margin: EdgeInsets.only(top: 16)),
              // Log in Button
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
<<<<<<< Updated upstream
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PageSwitcher()));
=======
                    //_onFormSubmit();
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      ingresar(usu,pass);
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => PageSwitcher()));
                    }
>>>>>>> Stashed changes
                    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BookmarksPage()));
                  },
                  child: Text('Login', style: TextStyle(color: AppColor.secondary, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'inter')),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    primary: AppColor.primarySoft,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Olvidaste tu contraseña? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'inter',
                          ),
                          text: 'Reset')
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
