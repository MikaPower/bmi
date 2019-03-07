import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {


  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();








  int age = 0;
  double height=0;
  int weight=0;
  double _final_result=0.0;
  String _resultSentence="";

void handleRadioValueChanged() {
    setState(() {
      age=int.parse(_ageController.text);
      height=double.parse(_heightController.text);
      height=height/100;
      weight=int.parse(_weightController.text);




_final_result= weight/(height*height);
      debugPrint(_final_result.toString());
     if(_final_result<18.5){
       _resultSentence = "Underweight ${_final_result.toStringAsFixed(1)}";
     }
     else if(_final_result>=18.5 &&  _final_result<=24.9){
       _resultSentence = "Perfect Weight ${_final_result.toStringAsFixed(1)}";
     }   else if(_final_result>=25 &&  _final_result<=29.9){
       _resultSentence = "Overweight ${_final_result.toStringAsFixed(1)}";
     }   else if(_final_result>=30){
       _resultSentence = "Obesse ${_final_result.toStringAsFixed(1)}";
     }

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("BMI"),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: new Container(
          alignment: Alignment.center,
          child: new ListView(
            padding: const EdgeInsets.all(13.5),
            children: <Widget>[
              new Image.asset(
                'images/bmilogo.png',
                height: 133.0,
                width: 200.0,
              ),
              new Container(
                alignment: Alignment.center,
                  margin: const EdgeInsets.all(20.0),
                  child: new Column(children: <Widget>[
                new TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: 'Your Age',
                      hintText: 'In numbers xD',
                      icon: new Icon(Icons.person_outline)),
                ),
                new TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: 'Altura',
                      hintText: 'In numbers xD',
                      icon: new Icon(Icons.cloud_circle)),
                ),
                new TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: 'Peso',
                      hintText: 'In numbers xD',
                      icon: new Icon(Icons.cloud_circle)),
                ),
                
                new Padding(padding: EdgeInsets.all(20)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new FlatButton(
                      child: new Text("Calculate"),
                      onPressed: handleRadioValueChanged,
                      color: Colors.pinkAccent,
                    )
                  ],
                ),

                new Padding(padding: new EdgeInsets.all(15.0)),

                new Text(
                  _ageController.text.isEmpty ? "Please enter age" : _resultSentence,
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500),
                )
              ]))
            ],
          ),
        ));
  }
}
