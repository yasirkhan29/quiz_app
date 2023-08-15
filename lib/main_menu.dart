import 'package:flutter/material.dart';
import 'package:quiz_app/maths_test.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/widgets/reusbalebutton.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://t3.ftcdn.net/jpg/02/15/65/44/360_F_215654421_0RipSD5PS2T4UtcNtbfQdc9tszG4mpAc.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 48.0,
            horizontal: 12.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Quizz App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Center(
                child: RawMaterialButton(
                  onPressed: () {
                    //Navigating the the Quizz Screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizzScreen(),
                        ));
                  },
                  shape: const StadiumBorder(),
                  fillColor: Colors.orange,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      "Start the Quizz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ////////////////////////////////////////////////////////////////////
              /// Reusable button
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableBotton(
                    ButtonText: "Online Study",
                    onpress: () {
                      launch(
                          'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                    },
                  ),
                  SizedBox(width: 20),
                  ReusableBotton(
                    ButtonText: "Math Test",
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MathsQuizz()));
                    },
                  ),
                  SizedBox(width: 20),
                  ReusableBotton(
                    ButtonText: "Scicne Test",
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizzScreen()));
                    },
                  ),
                ],
              ),
              //online study
              // Container(
              //   height: 200,
              //   child: PageView(
              //     children: [
              //       ReusableButton(
              //         texts: 'online stutdy',
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              SizedBox(
                height: 170,
              ),
              Center(
                child: Text(
                  "Made with ❤ by Muhammad Yasir Khan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
