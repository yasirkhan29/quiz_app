import 'package:flutter/material.dart';
import 'package:quiz_app/main_menu.dart';

// ignore: must_be_immutable
class MathResult extends StatefulWidget {
  int scores;
  MathResult(this.scores, {Key? key}) : super(key: key);

  @override
  _MathResultState createState() => _MathResultState();
}

class _MathResultState extends State<MathResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 800,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://thumbs.dreamstime.com/b/happy-woman-pointing-fingers-up-to-copy-space-yellow-studio-background-happy-woman-pointing-fingers-up-to-copy-space-179006684.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Congratulations",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              Text(
                "Your Score is",
                style: TextStyle(color: Colors.white, fontSize: 34.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "${widget.scores}",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 85.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              RawMaterialButton(
                onPressed: () {
                  //Navigating the the Quizz Screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainMenu(),
                      ));
                },
                shape: const StadiumBorder(),
                fillColor: Colors.orange,
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    "Back To Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppColor {}
