import 'package:flutter/material.dart';
import 'package:quiz_app/math_result.dart';
import 'package:quiz_app/model/math_data.dart';

class MathsQuizz extends StatefulWidget {
  const MathsQuizz({Key? key}) : super(key: key);

  @override
  _MathsQuizzState createState() => _MathsQuizzState();
}

class _MathsQuizzState extends State<MathsQuizz> {
  int mathsdata_pos = 0;
  int scores = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          shadowColor: Colors.white,
        ),
        body: Container(
          height: 800,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://media.istockphoto.com/id/1301492606/photo/think-idea-student-lifestyle-puzzled-woman.jpg?s=612x612&w=0&k=20&c=B2fBe0MY2g1pP6u5NjsUMIC5JEZ2-eX1FPWwwLcwv9Y="),
                fit: BoxFit.cover),
          ),
          child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: PageView.builder(
                controller: _controller!,
                onPageChanged: (page) {
                  if (page == mathsdata.length - 1) {
                    setState(() {
                      btnText = "See Results";
                    });
                  }
                  setState(() {
                    answered = false;
                  });
                },
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Question ${index + 1}/10",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 200.0,
                          child: Text(
                            "${mathsdata[index].mathsdata}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                        for (int i = 0;
                            i < mathsdata[index].answers!.length;
                            i++)
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            margin: EdgeInsets.only(
                                bottom: 20.0, left: 12.0, right: 12.0),
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              fillColor: btnPressed
                                  ? mathsdata[index].answers!.values.toList()[i]
                                      ? Colors.green
                                      : Colors.red
                                  : Colors.orange,
                              onPressed: !answered
                                  ? () {
                                      if (mathsdata[index]
                                          .answers!
                                          .values
                                          .toList()[i]) {
                                        scores++;
                                        print("yes");
                                      } else {
                                        print("no");
                                      }
                                      setState(() {
                                        btnPressed = true;
                                        answered = true;
                                      });
                                    }
                                  : null,
                              child: Text(
                                  mathsdata[index].answers!.keys.toList()[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  )),
                            ),
                          ),
                        SizedBox(
                          height: 40.0,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            if (_controller!.page?.toInt() ==
                                mathsdata.length - 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MathResult(scores)));
                            } else {
                              _controller!.nextPage(
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeInExpo);

                              setState(() {
                                btnPressed = false;
                              });
                            }
                          },
                          shape: StadiumBorder(),
                          fillColor: Colors.orange,
                          padding: EdgeInsets.all(18.0),
                          elevation: 0.0,
                          child: Text(
                            btnText,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: mathsdata.length,
              )),
        ),
      ),
    );
  }
}
