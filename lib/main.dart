import 'package:bmi/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(bmi());

class bmi extends StatelessWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
      ),
      //home
      home: InputPage(),
    );
  }
}
