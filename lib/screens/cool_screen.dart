import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class CoolScreen extends StatefulWidget {
  @override
  _CoolScreenState createState() => _CoolScreenState();
}

class _CoolScreenState extends State<CoolScreen> {
  int switchValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeuCard(
              curveType: CurveType.concave,
              bevel: 12,
              decoration: NeumorphicDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text('Container'),
            ),
            SizedBox(height: 16),
            NeuButton(
              onPressed: () {
                print('Pressed !');
              },
              child: Text('Button'),
            ),
//            NeuTextField(
//              decoration: InputDecoration(
//                border: OutlineInputBorder(),
//                labelText: 'Write',
//              ),
//            )
//            NeuText('Lorem Ipsum'),
//            NeuSwitch<int>(
//              onValueChanged: (val) {
//                setState(() {
//                  switchValue = val;
//                });
//              },
//              groupValue: switchValue,
//              children: {
//                0: Padding(
//                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
//                  child: Text('First'),
//                ),
//                1: Padding(
//                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
//                  child: Text('Second'),
//                ),
//              },
//            ),
          ],
        ),
      ),
    );
  }
}
