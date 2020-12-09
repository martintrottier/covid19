import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new MaterialApp(title: 'covid19', home: FirstPage()));

class FirstPage extends StatelessWidget {
  final myName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Container(child: Image.asset('assets/download.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 180.0, bottom: 10.0, right: 30.0, left: 20.0),
                child: Container(
                  child: Text(
                    'Bienvenue!',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 30.0, left: 20.0),
                child: Container(
                  child: Text(
                    'Pour débuter, entrez votre nom:',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ),
              ),
              TextField(
                controller: myName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Entrer votre nom'),
              ),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(myName.text)),
                    );
                  },
                  child: Text('Completer le questionnaire'))
            ],
          )),
    );
  }
}

class SecondPage extends StatelessWidget {
  String myName;
  SecondPage(String myName) {
    this.myName = myName;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(child: Image.asset('assets/download.png')),
            ),
            Container(
              child: Text('Bienvenue ' + myName,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(
                child: Text(
                  "Pour acceder au campus aujourd'hui, tu doit completer le questionnaire",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15.0, color: Colors.green),
                ),
              ),
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage(myName)),
                  );
                },
                child: Text('Completer le questionnaire'))
          ],
        ),
      ),
    );
  }
}
class ThirdPage  extends StatefulWidget{
   String myName;
  ThirdPage(String myName) {
    this.myName = myName;
  
  }
  @override 
  ThirdPageState createState( ) => ThirdPageState(this.myName);
 }
class ThirdPageState extends State<ThirdPage> {
  String myName;
  int happyness = 0; // 0 = null, 1 = unhappy, 2 = medium, etc...
  int days = 0;
  int contacte = 0;
  int sommaire = 0;

  ThirdPageState(String myName) {
    this.myName = myName;
  }
  @override
  Widget build(BuildContext context) {

    if(happyness ==3 && contacte ==1 && days ==1 )
      sommaire = 2;// can go in school
    if(happyness <= 2 || contacte == 2 || days == 2)
      sommaire = 1; // connot go in school
    if (happyness == 0||contacte == 0 || days == 0)
      sommaire = 0;// forgot something
    

    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(child: Image.asset('assets/download.png')),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Formulaire COVID-19 pour ' + myName + ':',
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Aujourd'hui, je me sens: "),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: IconButton(
                    icon: Icon(Icons.sentiment_very_dissatisfied),
                    iconSize: 50.0,
                    color: happyness == 1 ? Colors.red : Colors.black,
                    onPressed: () {
                      setState(() {
                        happyness = 1;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: IconButton(
                    icon: Icon(Icons.sentiment_neutral_outlined),
                    iconSize: 50.0,
                    color: happyness == 2 ? Colors.yellow : Colors.black,
                    onPressed: () {
                      setState(() {
                        happyness = 2;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: IconButton(
                    icon: Icon(Icons.sentiment_satisfied_alt_outlined),
                    iconSize: 50.0,
                    color: happyness == 3 ? Colors.green : Colors.black,
                    onPressed: () {
                      setState(() {
                        happyness = 3;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text("J'ai voyager hors du Canada ",
                    style: TextStyle( color:Colors.green)),
                    Text('dans les derniers 14 Jours :',style: TextStyle( color:Colors.green))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: IconButton(
                    icon: Icon(Icons.close_rounded),
                    iconSize: 50.0,
                    highlightColor: Colors.red,
                    color: days == 1 ? Colors.red : Colors.black,
                    onPressed: () {
                      setState(() {
                        days = 1;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
                    icon: Icon(Icons.done_outlined),
                    iconSize: 50.0,
                    highlightColor: Colors.green,
                    color: days == 2 ? Colors.green : Colors.black,
                    onPressed: () {
                      setState(() {
                        days = 2;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text("J'ai été en contacte avec un individu",
                    style: TextStyle( color:Colors.green)),
                    Text(' qui as eu COVID-19 dans les derniers 14 jours:',
                    style: TextStyle( color:Colors.green)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: IconButton(
                    icon: Icon(Icons.close_rounded),
                    iconSize: 50.0,
                    color: contacte == 1 ? Colors.red : Colors.black,
                    onPressed: () {
                      setState(() {
                        contacte = 1;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: Icon(Icons.done_outlined),
                    iconSize: 50.0,
                    color: contacte == 2 ? Colors.green : Colors.black,
                    onPressed: () {
                      setState(() {
                        contacte = 2;
                      });
                    },
                  ),
                ),
              ],
            ),
            RaisedButton(
             onPressed: () {if(sommaire == 2)
             Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForthPage()),
                  );
              if(sommaire == 1)
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForthPageV2()),
                  );
              
             
               
             
             
             },
              child: Text('soumettre'),
            ),
            if(sommaire==0)
            Text('s.v.p. choisier un option de chaque ligne',
            style: TextStyle( color:Colors.red))
          ],
        ),
      ),
    );
  }
}

          

class ForthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(child: Image.asset('assets/download.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Text("le Formulaire a ete completer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Colors.black)),
            ),
            Padding(
                padding: const EdgeInsets.all(60.0),
                child: Text("vous pouriez rentrer dans le batiment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Colors.green))),
          ],
        ),
      ),
    );
  }
}




class ForthPageV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(child: Image.asset('assets/download.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Text("le Formulaire a ete completer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Colors.black)),
            ),
            Padding(
                padding: const EdgeInsets.all(60.0),
                child: Text("Vous ne pouriez pas rentrer dans le batiment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Colors.red)),
                ),
          ],
        ),
      ),
    );
  }
}

