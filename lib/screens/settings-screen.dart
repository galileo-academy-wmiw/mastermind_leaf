import 'package:flutter/material.dart';
import 'package:mastermind_leaf/styles/styles.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool soundEnabled = true;

  bool visualAids = false;

  int turns = 12;

  double turnsDouble = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Settings', style: titleStyle,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sound:',
                  style: paragraphStyle,
                ),
                Switch(
                    value: soundEnabled,
                    onChanged: (value) {
                      setState(() {
                        soundEnabled = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Colorblind Mode:',
                  style: paragraphStyle,
                ),
                Switch(
                    value: visualAids,
                    onChanged: (value) {
                      setState(() {
                        visualAids = value;
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'How many turns',
                  style: paragraphStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('10', style: paragraphStyle),
                Slider.adaptive(
                    min: 10,
                    max: 20,
                    value: turnsDouble,
                    onChanged: (double value) {
                      setState(() {
                        turns = value.round();
                      });
                    }),
                Text(
                  '20',
                  style: paragraphStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
