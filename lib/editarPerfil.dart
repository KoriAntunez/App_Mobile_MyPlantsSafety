import 'package:flutter/material.dart';

class editarPerfil extends StatefulWidget {
  @override
  _editarPerfilState createState() => _editarPerfilState();
}

class _editarPerfilState extends State<editarPerfil> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController passwordRem = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.network('https://res.cloudinary.com/webaplicacionmobile/image/upload/v1653805738/myplantz_uwngys.png', height: 150), //cambia el nombre de tu imagen

            Image.network('https://res.cloudinary.com/webaplicacionmobile/image/upload/v1653846749/editar-perfil_gviejj.png', height: 50), //cambia el nombre de tu imagen
            CampoText1(),
            SizedBox(
              height: 30,
            ),
            CampoText2(),
            SizedBox(
              height: 30,
            ),
            CampoText3(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.only(top: 20, right: 10),
                decoration: BoxDecoration(color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
                child: Boton2(),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10),
                decoration: BoxDecoration(color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
                child: Boton(),
              ),
            ]),
            SizedBox(
              height: 40,
            ),
          ]),
        ),
      ),
    );
  }

  Widget CampoText1() {
    return TextField(
      controller: email,
      decoration: InputDecoration(hintText: "Correo"),
    );
  }

  Widget CampoText2() {
    return TextField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(hintText: "Contraseña "),
    );
  }

  Widget CampoText3() {
    return TextField(
      controller: passwordRem,
      obscureText: true,
      decoration: InputDecoration(hintText: "Repetir Constraseña"),
    );
  }

  Widget Boton() {
    return FlatButton(
      color: Colors.green,
      child: Text(
        'Guardar',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {},
    );
  }


Widget Boton2() {
  return FlatButton(
    color: Colors.redAccent,
    child: Text(
      'Cancelar',
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    onPressed: () {},
  );
}
}