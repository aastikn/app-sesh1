import 'package:flutter/material.dart';

class shapeChip extends StatelessWidget {
  late String Label;

  shapeChip({
    required this.Label
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor: Colors.yellow.shade200,
        label: Text(Label,),
      );
  }
}





