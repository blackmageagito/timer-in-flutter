import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
  ),);


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Timer'),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 180, 180, 180),
    ),
    body: Center(
      child: Image(image: AssetImage('assets/stimg.png'))
      /*Text(
        'Insert the time limit:',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: Colors.blueGrey,
        fontFamily: 'Shingo',
      ),
    ),*/
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      //add functionality
    },
    backgroundColor: Colors.green,
    child: Text('Run'),
    ),
    );
  }
}
