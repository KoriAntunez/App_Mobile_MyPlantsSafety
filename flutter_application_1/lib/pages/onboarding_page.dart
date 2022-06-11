import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'dart:io';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // Controller
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          // Introduction 1
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                      image: pages[index].image,
                      icon: pages[index].icon,
                      title: pages[index].title,
                      description: pages[index].description,
                    )),
          ),
          Row(
            children: [
              SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // Evento al botón
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.ease,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  )),
              const Spacer(),
              // Genera lista de dots
              ...List.generate(
                pages.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Center(
                      child: DotIndicator(isActive: index == _pageIndex)),
                ),
              ),
              //DotIndicator(),
              Spacer(),
              SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // Evento al botón
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.ease,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                  )),
            ],
          )
        ],
      ),
    )));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: isActive ? 20 : 10,
      width: 12,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(25))),
    ));
  }
}

// OnBoard
class Onboard {
  final String image, icon, title, description;

  Onboard({
    required this.image,
    required this.icon,
    required this.title,
    required this.description,
  });
}

// List of pages (Onboard)
final List<Onboard> pages = [
  Onboard(
    image: "assets/imgs/welcome.jpg",
    icon: "assets/imgs/icon.png",
    title: "Bienvenidos a MyPlantsSafety",
    description: "Convierta su teléfono Android en un médico de cultivo móvil",
  ),
  Onboard(
    image: "assets/imgs/capture.jpg",
    icon: "assets/imgs/elipse.png",
    title: "Toma una foto a la hoja de la planta",
    description: "Convierta su teléfono Android en un médico de cultivo móvil",
  ),
  Onboard(
    image: "assets/imgs/diagnosis.jpg",
    icon: "assets/imgs/scan-line.png",
    title: "La aplicación diagnostica el problema de la planta",
    description: "Convierta su teléfono Android en un médico de cultivo móvil",
  )
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, icon, title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Stack(
          children: [
            // Image
            Positioned.fill(
                child: Opacity(
              opacity: 0.5,
              child: Image.asset(image, fit: BoxFit.cover),
            )),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Icon App
                    Center(
                        child: ClipRect(
                      child: Container(
                          width: 150, height: 150, child: Image.asset(icon)),
                    )),
                    SizedBox(height: 50),
                    // Title
                    Text(title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 50),
                    // Text
                    Text(description,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(height: 50),
                    // Button
                    Center(
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text('Ir al Home',
                              style: TextStyle(fontSize: 20)),
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    )
                  ]),
            )
          ],
        ));
  }
}
