import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_home.dart';

class ResultScreen extends StatelessWidget {
  List<int>? answers;
  List<Quiz>? quizes;
  ResultScreen({this.answers, this.quizes});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for(int i = 0; i < quizes!.length; i++){
      if(quizes![i].answer == answers![i]){
        score += 1;
      }
    }

    //return을 그냥 SafeArea로 지정하면 원치않는 화면 이동이 가능하게 됨
    //이를 막기 위해 SafeArea 대신 WillPopScop를 사용함.
    return WillPopScope(
      onWillPop: ()  async => false, //비동기 함수로 onWillPop을 처리하며, false를 해당 시점에 반환하게 처리.
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurple),
              color: Colors.deepPurple,
            ),
            width: width * 0.5,
            height: height * 0.5,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: width * 0.048),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.deepPurple),
                    color: Colors.white,
                  ),
                  width : width * 0.73,height: height * 0.25,
                  child: Column(
                    children: <Widget> [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          0, width * 0.048, 0, width * 0.012),
                        child: Text(
                          '수고하셨습니다!',
                          style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.bold,
                          )
                        )
                      ),
                      Text(
                        "당신의 점수는", 
                        style: TextStyle(
                          fontSize: width * 0.048, fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        score.toString() + '/' + quizes!.length.toString(),
                        style: TextStyle(
                          fontSize: width * 0.021,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(width* 0.012),
                      ),
                    ],
                  )
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: width * 0.048
                  ),
                  child: ButtonTheme(
                    minWidth: width * 0.073, 
                    height : height*0.05,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      child: Text('홈으로 돌아가기'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            )
          )
        )
      )
    );
  }
}