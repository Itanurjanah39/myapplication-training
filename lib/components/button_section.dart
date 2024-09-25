import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.blue;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        ButtonWithText(color: color, icon: Icons.send, label: 'SEND'),
        ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
        ButtonWithText(color: color, icon: Icons.comment, label: 'COMMENT')
      ],),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label

  });
  final Color color;
  final IconData  icon;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color : color
        ),
        Padding(padding: EdgeInsets.only(top: 8),
        child:  Text(label,
         style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: color
        ),))
      ],

    )
    ;
  }
}