import 'package:flutter/material.dart';
import 'package:pattern_app/provider/num_provioder.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  String? text;
  CustomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade600,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        switch (text) {
          case "Left":
            NumProvider.alignment = MainAxisAlignment.start;
            break;
          case "Center":
            NumProvider.alignment = MainAxisAlignment.center;
            break;
          case "Right":
            NumProvider.alignment = MainAxisAlignment.end;
            break;
        }
        Provider.of<NumProvider>(context).patterUpdate();
      },
      child: Text(text!),
    );
  }
}
