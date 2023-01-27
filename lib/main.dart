import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'componets.dart';
import'result_page.dart';
import 'calculate_bmi.dart';
void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/':(context) =>Mainpage(),
      },
    );
  }
}

class Mainpage extends StatefulWidget {
  @override
  State<Mainpage> createState() => _MainpageState();
}
Color inactive = Color(0xFF111328);
Color active = Color(0xFF1D1E33);
enum Gender  {male,female,none}
class _MainpageState extends State<Mainpage> {
  Color male_color = inactive;
  Color female_color = inactive;
  var male_status = false;
  var female_status = false;
  int age = 20;
  int weight = 50;
  Gender selected = Gender.none;
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI",style: TextStyle(
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child:  Containerused(colour: selected == Gender.male?active:inactive
                    ,Cardchild: Cardused(text: "Male",icons: Icon(FontAwesomeIcons.mars,size: 80,),),onPress: (){
                    setState(() {
                      selected = Gender.male;
                    });
                    },)),
                  Expanded(child:  Containerused(colour: selected == Gender.female?active:inactive
                    ,Cardchild: Cardused(text: "Female",icons: Icon(FontAwesomeIcons.venus,size: 80,),),onPress: (){
                    setState(() {
                      selected = Gender.female;
                    });
                    },)),
                ],
              ),
            ),
            Expanded(child:Containerused(colour: inactive
              ,Cardchild: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Height",style: TextStyle(
                      fontSize: 18,
                      color:Color(0xFF8D8E98)
                  ),),Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("$height",style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w900
                      ),),
                      Text('(cm)',style: TextStyle(
                        fontSize: 20,
                      ),)
                    ],
                  ),Slider(value: height.toDouble(), onChanged: (double newVal){
                      setState(() {
                        height = newVal.toInt();
                      });
                  },
                  min: 120.0,max: 220.0,activeColor: Color(0xFFEB1555),
                  )
                  ],
                ),

              ),onPress: (){},)),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(child:Containerused(colour:inactive
                      ,Cardchild:Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Age",style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98)
                            ),),
                            SizedBox(height: 30,),
                            Text(age.toString(),style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      age ++;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Icon(FontAwesomeIcons.plus),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color(0xFF1D1E33),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      age --;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Icon(FontAwesomeIcons.minus),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color(0xFF1D1E33),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),onPress: (){},)),
                    Expanded(child: Containerused(colour:inactive
                      ,Cardchild:Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Weight",style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF8D8E98)
                            ),),
                            SizedBox(height: 30,),
                            Text(weight.toString(),style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               Roundbutton(weight: weight, onPress: (){
                                 setState(() {
                                   weight++;
                                 });
                               },icons: Icon(Icons.add),
                               ),
                                SizedBox(width: 20,),
                                Roundbutton(weight: weight, onPress: (){
                                  setState(() {
                                    weight--;
                                  });
                                },icons: Icon(FontAwesomeIcons.minus)),
                              ],
                            )
                          ],
                        ),
                      ) ,onPress: (){},)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                if(selected != Gender.none)
                  {
                    CalculateBMI clac = CalculateBMI(height, weight);
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>ResultPage(bmi: clac.operation(), info: clac.getResult(), message: clac.getInterpretations()))
                    );
                  }
              },
              child: Container(
                height: 80,
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Calculate Now",style: TextStyle(
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





