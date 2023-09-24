import 'package:log_in/utils/theme/ad_colors.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final void Function()? onPressed;
  final Size size;
  final String text;
  final Color color;
  final Color textColor;

  const SubmitButton({Key? key, required this.onPressed, required this.size,
    required this.text,
    this.color = ADColors.accentColor,
    this.textColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.w600),),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(3),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
          minimumSize: MaterialStateProperty.all(size),
          backgroundColor: MaterialStateProperty.all(color)
      ),
    );
  }
}
