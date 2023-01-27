import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key,required this.bmi,required this.info,required this.message}) : super(key: key);
  final String bmi;
  final String info;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Your Result",style: TextStyle(
              fontSize: 40
            ),),
            Expanded(child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF1D1E33),
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(info,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  ),),
                  Text(bmi,style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w900
                  ),),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(message,style: TextStyle(
                        fontSize: 20,
                    ),textAlign: TextAlign.center,),
                  )
                ],
              ),
            )),
            GestureDetector(
              onTap: (){
                  Navigator.pop(context);
              },
              child: Container(
                height: 80,
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Re-Calculate",style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      fontStyle: FontStyle.italic
                  ),)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


