import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.network('https://res.cloudinary.com/webaplicacionmobile/image/upload/v1653805738/myplantz_uwngys.png', height: 150), //cambia el nombre de tu imagen

            Image.network('https://res.cloudinary.com/webaplicacionmobile/image/upload/v1653805743/inicio-sesion_yqvh54.png', height: 50), //cambia el nombre de tu imagen
            CampoText1(),
            SizedBox(
              height: 50,
            ),
            CampoText2(),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
              child: Boton(),
            ),
            SizedBox(
              height: 50,
            ),
            Text("¿Nuevo usuario? Crea una cuenta !")
          ]),
        ),
      ),
    );
  }

  Widget CampoText1() {
    return TextField(
      controller: email,
      decoration: InputDecoration(hintText: "Usuario!!!"),
    );
  }

  Widget CampoText2(){
    return TextField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(hintText: "Clave !!!"),
    );
  }


  Widget Boton(){

    return FlatButton(
      color: Colors.green,
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {},
    );
  }
}
