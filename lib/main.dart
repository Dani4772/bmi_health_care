import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI  HEALTH CARE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 2.0;
  double _bmi = 0;
  double? _num;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 32,right: 32,top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/images/bmi.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "BMI Calculator",
                  style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 34,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Check Your Health status",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 72,
                ),
                Text("Height (cm)",
                  style: TextStyle(color: Colors.grey,
                      fontSize: 24, fontWeight: FontWeight.w400),),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Slider(
                    min: 80.0,
                    max: 250.0,
                    onChanged: (height){
                      setState(() {
                        _heightOfUser = height;
                      });
                    },
                    value: _heightOfUser,
                    divisions: 100,
                    activeColor: Colors.pink,
                    label: "$_heightOfUser",
                  ),
                ),
                Text("$_heightOfUser cm",
                  style: TextStyle(color: Colors.red,
                      fontSize: 18, fontWeight: FontWeight.w900),),
                SizedBox(height: 50,),
                Text("Weight (kg)",
                  style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Slider(
                    min: 1.0,
                    max: 120.0,
                    onChanged: (height){
                      setState(() {
                        _weightOfUser = height;
                      });
                    },
                    value: _weightOfUser,
                    divisions: 100,
                    activeColor: Colors.pink,
                    label: "$_weightOfUser",
                  ),
                ),

                Text("$_weightOfUser kg",
                  style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),
                SizedBox(height: 50,),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _bmi = _weightOfUser/((_heightOfUser/100)*(_heightOfUser/100));
                         _num = double.parse((_bmi).toStringAsFixed(2));




                      });
                    },
                    child: Text('Calculate'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(170, 55),
                      primary: Color(0xFF526091),
                      side:
                      BorderSide(width: 3, color: Colors.transparent),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 16, right: 16),
                ),
                SizedBox(height: 16,),

             if(_num != null)   Padding(
               padding: const EdgeInsets.only(top: 10,bottom: 20),
               child: Text(" BMI is: $_num",
                    style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),
             ),
                if(_bmi >=18.5 && _bmi <= 25)   Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 20),
                  child: Text(" You are totally fit",
                    style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w900),),
                ),
                if(_bmi <18.5 && _bmi> 1)   Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 20),
                  child: Text(" You are Underweighted",
                    style: TextStyle(color: Colors.brown, fontSize: 18, fontWeight: FontWeight.w900),),
                ),
                if(_bmi >25 && _bmi<=30)   Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 20),
                  child: Text(" You are Overweighted",
                    style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),
                ),
                if(_bmi >30 )   Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 20),
                  child: Text(" You are Obesed",
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
