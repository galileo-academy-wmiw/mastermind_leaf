import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/settings.dart';
import 'package:mastermind_leaf/library/styles.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);


  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double turnsDouble = settingTurns.toDouble();//this value is just for the slider to slide around right, turns don't accept

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Settings', style: titleStyle,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sound:',
                  style: paragraphStyle,
                ),
                Switch(
                    value: settingSoundEnabled,
                    onChanged: (value) {
                      setState(() {
                        settingSoundEnabled = value;
                        saveSettingsBool('settingSoundEnabled', value);
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'How many turns',
                  style: paragraphStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('10', style: paragraphStyle),
                Slider.adaptive(
                    min: 10,
                    max: 20,
                    value: turnsDouble,
                    onChanged: (double value) {
                      setState(() {
                        turnsDouble = value;
                        settingTurns = value.round();
                        saveSettingsInt('settingTurns', value.round());
                      });
                    }),
                const Text(
                  '20',
                  style: paragraphStyle,
                ),
              ],
            ),
            Center(child: Text(settingTurns.toString(), style: paragraphStyle))
          ],
        ),
      ),
    );
  }
}
