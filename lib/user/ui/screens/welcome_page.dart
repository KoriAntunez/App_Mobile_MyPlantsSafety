import 'package:flutter/material.dart';
import 'package:fluttermlprediction/AppColor.dart';
// FILE .DART DEL MODELO
import '../../../ui.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PAGINA DE BIENVENIDA
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // CONTAINER
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/welcome.jpg'),
                      fit: BoxFit.cover)),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: 16, bottom: 32),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 60 / 100,
                decoration: BoxDecoration(gradient: AppColor.linearBlackBottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Text('MyPlantsSafety',
                                style: TextStyle(
                                    fontFamily: 'inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Colors.white))),
                        Text("Cuida tus plantas, cuida tu vida",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // BOTON REGISTRARSE
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: ElevatedButton(
                              child: Text('Registrarse',
                                  style: TextStyle(
                                      color: AppColor.secondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'inter')),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UI()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: AppColor.primarySoft,
                              ),
                            )),
                        SizedBox(height: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: OutlinedButton(
                            child: Text('Iniciar Sesión',
                                style: TextStyle(
                                    color: AppColor.secondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'inter')),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return LoginModal();
                                  });
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              side: BorderSide(
                                  color: AppColor.secondary.withOpacity(0.5),
                                  width: 1),
                              primary: Colors.white,
                            ),
                          ),
                        ),
                        // BOTON LOGIN
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // fff
          ],
        ),
      ),
    );
  }
}
