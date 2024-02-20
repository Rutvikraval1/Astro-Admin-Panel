import 'package:flutter/material.dart';

class custom_outlined_button extends StatefulWidget {
  final Function onPressed;
  final String text;

  const custom_outlined_button({super.key,required this.onPressed,required this.text});

  @override
  State<custom_outlined_button> createState() => _custom_outlined_buttonState();
}

class _custom_outlined_buttonState extends State<custom_outlined_button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(14),
          // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          side:   const BorderSide(
            color: Color(0xFFFF9933)
          ),
        ),
        onPressed: () {   widget.onPressed(); },
        child: Text(widget.text,style: const TextStyle(
          color: Color(0xFFFF9933),
          fontSize: 10,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),),
      ),
    );
  }
}
