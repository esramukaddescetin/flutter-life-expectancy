import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy_v1/constants.dart';

import 'icon_cinsiyet.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = '';
  double icilenSigara = 0.0;
  int sporGunu = 0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                  child: buildRowOutlineButton('BOY'),
                )),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Haftada kaç gün spor yapıyorsunuz?',
                    style: kMetinStili,
                  ),
                  Text(
                    sporGunu.toString(),
                    style: kSayiStili,
                  ),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: sporGunu.toDouble(),
                      onChanged: (double newValue) {
                        setState(
                          () {
                            sporGunu = newValue.toInt();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Günde kaç sigara içiyorsunuz?',
                    style: kMetinStili,
                  ),
                  Text(
                    icilenSigara.round().toString(),
                    style: kSayiStili,
                  ),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: 30,
                      value: icilenSigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(
                        () {
                          seciliCinsiyet = 'KADIN';
                        },
                      );
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.lightGreen
                        : Colors.white,
                    child: IconCinsiyet(FontAwesomeIcons.venus, 'KADIN'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(
                        () {
                          seciliCinsiyet = 'ERKEK';
                        },
                      );
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightGreen
                        : Colors.white,
                    child: IconCinsiyet(FontAwesomeIcons.mars, 'ERKEK'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              label,
              style: kMetinStili,
            )),
        SizedBox(
          width: 5,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy++ : kilo++;
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy-- : kilo--;
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
