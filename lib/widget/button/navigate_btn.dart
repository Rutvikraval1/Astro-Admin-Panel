import 'package:flutter/material.dart';

class NavigateBtn extends StatefulWidget {
  final Function onPressed;
  final String text;
  final String? text_size;
  const NavigateBtn({super.key, required this.onPressed, required this.text,this.text_size});

  @override
  State<NavigateBtn> createState() => _NavigateBtnState();
}

class _NavigateBtnState extends State<NavigateBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      height:  32,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
          backgroundColor: MaterialStateProperty.all(Color(0xFFFF9933)),
          // shape: MaterialStateProperty.all(
          //   const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          // ),
        ),
        child: Text(
          widget.text,
          style:  TextStyle(
            color: Colors.white,
            fontSize: widget.text_size!=null?14:10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
