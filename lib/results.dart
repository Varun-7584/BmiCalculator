import 'package:flutter/material.dart';
import 'input_page.dart';
import 'calculate.dart';

class results extends StatelessWidget {
  results(
      {required this.textResult,
      required this.bmiResult,
      required this.resultText});
  final String bmiResult;
  final String resultText;
  final String textResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Reusable_Style_container(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: BMITextStyle,
                  ),
                  Text(
                    textResult,
                    textAlign: TextAlign.center,
                    style: BodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
              onTap: () {
                Navigator.pop(context);
              },
              ButtonTitle: 'Re-Calculate')
        ],
      ),
    );
  }
}

////////////////////////////////////////////       all   consts   below //////////////////////////////////////
const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 23.0,
  fontWeight: FontWeight.bold,
);

const BMITextStyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);
const BodyTextStyle = TextStyle(
  fontSize: 23.0,
);
