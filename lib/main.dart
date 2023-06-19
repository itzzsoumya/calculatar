import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
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

  double firstnum=0;
  double secondnum=0;
  String res= "";
  String texttodisp="";
  String op="";
  void btnclicked(String btnval) {
    if(btnval=="C"){
      texttodisp="";
      firstnum=0;
      secondnum=0;
      res="";
    }

    else if(btnval=="+" || btnval=="-"||btnval=="x"||btnval=="/"||btnval=="%"){
       firstnum=double.parse(texttodisp);
      res="";
      op=btnval;
    }
    else if(btnval=="="){
      secondnum=double.parse(texttodisp);
      if(op=="+"){
        res=(firstnum+secondnum).toString();
      }
      if(op=="-"){
        res=(firstnum-secondnum).toString();
      }
      if(op=="x"){
        res=(firstnum*secondnum).toString();
      }
      if(op=="/"){
        res=(firstnum/secondnum).toString();
      }
      if(op=="%"){
        res=(firstnum%secondnum).toString();
      }
    }
    else {
      res=int.parse(texttodisp+btnval).toString();
    }

    setState(() {
      texttodisp=res;
    });
  }
  
  custombutton (String btnval){
    return Expanded(

          child: OutlinedButton(
            onPressed: () => btnclicked(btnval),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),

                  child: Text('$btnval', style: TextStyle(fontSize: 25.0),),
                ),
          ),

    );
  }
  
  
  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: const Text('My Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Container(
              alignment: Alignment.bottomLeft,
              color: Colors.indigoAccent.shade100,
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Text("$texttodisp", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.indigo),),
              ),
            )

            ),

              Row(

                children: [
                custombutton('1'),
                  custombutton('2'),
                  custombutton('3'),
                  custombutton('+'),

                  ]
            ),
            Row(

                children: [
                  custombutton('4'),
                  custombutton('5'),
                  custombutton('6'),
                  custombutton('-'),

                ]
            ),

            Row(

                children: [
                  custombutton('7'),
                  custombutton('8'),
                  custombutton('9'),
                  custombutton('x'),

                ]
            ),

            Row(

                children: [
                  custombutton('C'),
                  custombutton('0'),
                  custombutton('%'),
                  custombutton('/'),

                ]
            ),

            Row(
              children: [
                custombutton('='),
              ],
            )



          ],
        ),
      )
    );
  }
}
