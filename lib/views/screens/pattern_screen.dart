import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pattern_app/provider/num_provioder.dart';
import 'package:pattern_app/views/screens/components/components.dart';
import 'package:provider/provider.dart';

class PatternScreen extends StatelessWidget {
  const PatternScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pattern Screen"),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 50),
        child: Column(
          children: [
            const Spacer(),
            Consumer<NumProvider>(builder: (context, pro, _) {
              return Column(
                children: List.generate(
                  pro.getNum,
                  (index) => Row(
                    mainAxisAlignment: NumProvider.alignment,
                    children: List.generate(
                      index + 1,
                      (index) => Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("${index + 1}"),
                      ),
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                20,
                0,
                20,
                0,
              ),
              child: Slider(
                value: double.parse(
                  Provider.of<NumProvider>(context).getNum.toString(),
                ),
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Colors.green,
                inactiveColor: Colors.green.shade100,
                label: "Move slider to see pattern",
                thumbColor: Colors.green.shade600,
                onChanged: (value) {
                  Provider.of<NumProvider>(context, listen: false)
                      .onChanged(n: value.toInt());
                },
              ),
            ),
            SizedBox(height: 20),
            Consumer<NumProvider>(builder: (context, pro, _) {
              return CupertinoSlidingSegmentedControl(
                groupValue: pro.group,
                children: {
                  "start": GestureDetector(
                    child: const Text("Left"),
                  ),
                  "center": GestureDetector(
                    child: const Text("Center"),
                  ),
                  "end": GestureDetector(
                    child: const Text("End"),
                  ),
                },
                onValueChanged: (val) {
                  switch (val) {
                    case "start":
                      pro.updateAlign(alignment: MainAxisAlignment.start);
                      break;
                    case "center":
                      pro.updateAlign(alignment: MainAxisAlignment.center);
                      break;
                    case "end":
                      pro.updateAlign(alignment: MainAxisAlignment.end);
                      break;
                  }
                  pro.updateButton(value: val!);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
