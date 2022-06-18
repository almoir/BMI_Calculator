import 'package:flutter/material.dart';
import '../bmi.dart';
import '../Widgets/Bottom_Button.dart';
import '../Widgets/Text.dart';
import './Results_Pages.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  BodyMassIndex bmi = BodyMassIndex();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                "GENDER",
                style: CategoryText,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: Colors.blueGrey[400]),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                bmi.selectedGender = Gender.male;
                              });
                            },
                            icon: Icon(Icons.male),
                            iconSize: 150,
                            color: bmi.selectedGender == Gender.male
                                ? Colors.tealAccent
                                : Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "MALE",
                          style: TextStyle(
                            color: bmi.selectedGender == Gender.male
                                ? Colors.tealAccent
                                : Colors.blueGrey[400],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: Colors.blueGrey[400]),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                bmi.selectedGender = Gender.female;
                              });
                            },
                            icon: Icon(Icons.female),
                            iconSize: 150,
                            color: bmi.selectedGender == Gender.female
                                ? Colors.tealAccent
                                : Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "FEMALE",
                          style: TextStyle(
                            color: bmi.selectedGender == Gender.female
                                ? Colors.tealAccent
                                : Colors.blueGrey[400],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Text(
                "HEIGHT",
                style: CategoryText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmi.height.toString(),
                    style: NumberText,
                  ),
                  Text(
                    " cm",
                    style: UnitText,
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Colors.blueGrey[400],
                  activeTrackColor: Colors.tealAccent,
                  thumbColor: Colors.tealAccent,
                  overlayColor: Colors.teal,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: bmi.height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  onChanged: (double newValue) {
                    setState(() {
                      bmi.height = newValue.round();
                    });
                  },
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: CategoryText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              bmi.weight.toString(),
                              style: NumberText,
                            ),
                            Text(
                              " kg",
                              style: UnitText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              color: Colors.tealAccent,
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                setState(() {
                                  bmi.weight--;
                                });
                              },
                              iconSize: 50,
                            ),
                            IconButton(
                              color: Colors.tealAccent,
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                setState(() {
                                  bmi.weight++;
                                });
                              },
                              iconSize: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: CategoryText,
                        ),
                        Text(
                          bmi.age.toString(),
                          style: NumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              color: Colors.tealAccent,
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                setState(
                                  () {
                                    bmi.age--;
                                  },
                                );
                              },
                              iconSize: 50,
                            ),
                            IconButton(
                              color: Colors.tealAccent,
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                setState(() {
                                  bmi.age++;
                                });
                              },
                              iconSize: 50,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              BottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                            interpretation: bmi.getInterpretation(),
                            bmiResult: bmi.calculateBMI(),
                            resultText: bmi.getResult())),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
