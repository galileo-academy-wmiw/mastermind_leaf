import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/settingFunctions.dart';
import 'package:mastermind_leaf/library/styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);


  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  settingsIntToDouble(int myInt){
    //this function only exists because i can't directly call toDouble on snapshot.data
    return myInt.toDouble();
  }

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
                FutureBuilder<bool>(
                  future: loadSettingsBool('settingSoundEnabled', true),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.hasData){
                      return Switch(
                          value: snapshot.data,
                          onChanged: (value) {
                            setState(() {
                              saveSettingsBool('settingSoundEnabled', value);
                            });
                          });
                    }else{
                      return Switch(
                          value: true,
                          onChanged: (value) {
                            setState(() {
                              saveSettingsBool('settingSoundEnabled', value);
                            });
                          });
                    }

                  }
                ),
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
                FutureBuilder<int>(
                  future: loadSettingsInt('settingTurns', 12),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.hasData){
                      return Slider.adaptive(
                          min: 10,
                          max: 20,
                          divisions: 10,
                          value: settingsIntToDouble(snapshot.data),
                          onChanged: (double value) {
                            setState(() {
                              saveSettingsInt('settingTurns', value.round());
                            });
                          });
                    }else{
                      return Slider.adaptive(
                          min: 10,
                          max: 20,
                          divisions: 10,
                          value: 12,
                          onChanged: (double value) {
                            setState(() {
                              saveSettingsInt('settingTurns', value.round());
                            });
                          });
                    }

                  }
                ),
                const Text(
                  '20',
                  style: paragraphStyle,
                ),
              ],
            ),
            Center(child: FutureBuilder<int>(
              future: loadSettingsInt('settingTurns', 12),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(snapshot.data.toString(), style: paragraphStyle);
              }
            ))
          ],
        ),
      ),
    );
  }
}
