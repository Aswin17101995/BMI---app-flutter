import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Containerused extends StatelessWidget {
  const Containerused({Key?key,required this.colour,required this.Cardchild,required this.onPress}):super(key:key);
  final Color colour;
  final Widget Cardchild;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Cardchild,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colour,
        ),
      ),
    );
  }
}

class Cardused extends StatelessWidget {
  const Cardused({Key? key,required this.text,required this.icons}) : super(key: key);
  final text;
  final Icon icons;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icons,
          SizedBox(height: 15,),
          Text( text,style: TextStyle(
              fontSize: 18,
              color: Color(0xFF8D8E98)
          ),)
        ],
      ),
    );
  }
}

class Roundbutton extends StatelessWidget {
  const Roundbutton({Key? key,required this.weight,required this.onPress,required this.icons}) : super(key: key);
  final int weight;
  final Function() onPress;
  final Icon icons;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child:icons,
    );
  }
}




