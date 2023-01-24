import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results.dart';
import 'calculate.dart';

/////
const bottomContainerHeight = 60.0;
const inActiveCardColor = Color(0xFF111328);
const activeCardColor = Color(0xFF1D1E33);
// const height = 20.0 ;
const NumberTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,

  fontWeight: FontWeight.w900,
);
const TTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
  fontWeight: FontWeight.w900,
);
Color MaleCardColor = inActiveCardColor;
Color FemaleCardColor = inActiveCardColor;

//activeCardColor
enum Gender {
  male,
  female,
}

void updateColor(Gender selectedGender) {
  if (selectedGender == Gender.male) {
    if (MaleCardColor == inActiveCardColor) {
      MaleCardColor = activeCardColor;
      FemaleCardColor = inActiveCardColor;
    } else {
      MaleCardColor = inActiveCardColor;
    }
  }
  if (selectedGender == Gender.female) {
    if (FemaleCardColor == inActiveCardColor) {
      FemaleCardColor = activeCardColor;
      MaleCardColor = inActiveCardColor;
    } else {
      FemaleCardColor = inActiveCardColor;
    }
  }
}

final myFinal = DateTime.now();

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 40 ;
  int age = 1 ;


  @override
  Widget build(BuildContext context) {
    return
        ///////////////////////////////////
        Scaffold(
      //appbar
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI',
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              //////////////////////////////////    1 /////////////////////////////////
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // updateColor(Gender.male);
                      updateColor(Gender.male);
                    });
                  },
                  child: Reusable_Style_container(
                    colour: MaleCardColor,
                    ////////card child////////
                    cardChild: CardChid_Icon_Text(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),

              /////////////////////////////       2 /////////////////////////////////////
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(Gender.female);
                    });
                  },
                  child: Reusable_Style_container(
                    colour: FemaleCardColor,
                    cardChild: CardChid_Icon_Text(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          )),
          /////////////////////////////////////    3        //////////////////////////////////////
          Expanded(
            child: Reusable_Style_container(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.baseline,
                // textBaseline: TextBaseline.alphabetic ,
                children: <Widget>[
                  Text(
                    'Enter Height ',
                    style: TTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: NumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: TTextStyle,
                      ),
                    ],
                  ),
                  //////////////////////Slider////////////////////////
                  SliderTheme(data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 24.0),

                  ), child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,

                    inactiveColor: Color(0xFF8B8E98),
                    onChanged: (double value) {
                      setState(() {
                        //changes value of the height
                        height = value.round();
                      });
                    },
                  ),),

                ],
              ),
            ),
          ),
          // ////////////////////////////////////////     4     /////////////////////////////////////
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: Reusable_Style_container(
                    colour:Color(0xFF1D1E33),
                  cardChild: Column(
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Text('Weight',
                      style: TTextStyle,),
                      Text(weight.toString(),
                        style: NumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton( onPressed: () {
                            setState(() {
                              weight--;

                            });
                          },
                          backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 15.0),

                          FloatingActionButton( onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              )
                          )


                      ]),
                    ],
                  ),),
              ),

              //////////////////////////////////////        5       ////////////////////////////////////////
              Expanded(
                child: Reusable_Style_container(
                    colour:Color(0xFF1D1E33),
                  cardChild: Column(
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Text('Age',
                        style: TTextStyle,),
                      Text(age.toString(),
                        style: NumberTextStyle,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton( onPressed: () {
                              setState(() {
                                age --;
                              });
                            },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15.0),

                            FloatingActionButton( onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                )
                            )


                          ]),
                    ],

                ),),
              ),
            ],
          )),
          /////////////////////////////////////////////         Result           /////////////////////////////////

          CalculateButton(ButtonTitle: 'Calculate',
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => results(),),);

          },
    ),
        ],
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////      Calculate Bottom Button ////////////////////////////////////////
class CalculateButton extends StatelessWidget {

  CalculateButton({required this.onTap , required this.ButtonTitle});
  final Function onTap ;
  final String ButtonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.push(context,
        // MaterialPageRoute(builder: (context) => results()));
        onTap;
      },
      child: Container(
        child: Center(
            child:
            Text(ButtonTitle,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D1E33),
              ) ,
    )
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only (bottom :10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////
class CardChid_Icon_Text extends StatelessWidget {
  CardChid_Icon_Text({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //will have two children :- icon and Text
          Icon(
            icon,
            size: 80.0,
          ),
          //for spacing
          SizedBox(height: 10.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ]);
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
class Reusable_Style_container extends StatelessWidget {
  // const Reusable_Style_container({
  //   Key? key,
  // }) : super(key: key);
  //make a constructor for reusable card
  Reusable_Style_container({required this.colour, required this.cardChild});
  final Color colour;
//////
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
//create a child of container names cardchild ...i.e final
      child: cardChild,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}

// Container(
// margin: EdgeInsets.all(15.0),
// decoration: BoxDecoration(
// color: Colors.blue,
// borderRadius: BorderRadius.circular(10.0)),
// ),

////////////////////////////////////////////////////////////////////////////////////////////////
