// ignore_for_file: prefer_const_constructors

import 'package:calculator_bmi/AllData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _style(fontSize) {
    const TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  }

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bbcolor = bcolor.ColorgreenAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:bcolor.ColorBlueAccent,
      appBar: AppBar(
        backgroundColor: bcolor.Colorblue,
        centerTitle: true,
        title: Text(
          'BMI',
          style: _style(25),
        ),
      ),
      body: Container(
        color: bbcolor,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.4,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textField1(),
                  textField2(),
                  textField3(),
                  elevatedButton1(),
                  Text(
                    result,
                    style: _style(25),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget textField3() {
    return TextField(
      controller: inController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text('Enter You Height(in Inch)'),
          prefixIcon: Icon(Icons.format_list_numbered),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      style: _style(20),
    );
  }

  textField1() {
    return TextField(
      controller: wtController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text('Enter You Weight(in Kgs)'),
          prefixIcon: Icon(Icons.format_list_numbered),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      style: _style(20),
    );
  }

  textField2() {
    return TextField(
      controller: ftController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text('Enter You Height(in Feet)'),
          prefixIcon: Icon(Icons.format_list_numbered),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      style: _style(20),
    );
  }

  elevatedButton1() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(bcolor.Colorblue)),
        onPressed: () {
          var wt = wtController.text.toString();
          var ft = ftController.text.toString();
          var inch = inController.text.toString();
          if (wt != "" && ft != "" && inch != "") {
            var iwt = int.parse(wt);
            var ift = int.parse(ft);
            var inchs = int.parse(inch);

            var tinchs = (ift * 12) + inchs;
            var tc = tinchs * 2.54;
            var tm = tc / 100;
            var bmi = iwt / (tm * tm);
            var mag = "";
            if (bmi > 25) {
              mag = "You 're OverWeight !!";
              bbcolor = bcolor.ColorredAccent;
            } else if (bmi < 18) {
              mag = "You 're UnderWeight !!";
              bbcolor = bcolor.ColororangeAccent;
            } else {
              mag = "You 're Healthy !!";
              bbcolor = bcolor.ColorgreenAccent;
            }
            setState(() {
              result = "$mag \n You BMI is: ${bmi.toStringAsFixed(4)}";
            });
          } else {
            setState(() {
              result = "please fill all the required blank!!";
            });
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result,style: TextStyle(color: bbcolor),)));

        },
        child: Text(
          'Calculate',
          style: _style(22),
        ));
  }
}
