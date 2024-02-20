import 'package:flutter/material.dart';

class Drop_down_interview extends StatefulWidget {
  final String title;
  final bool? select_index;
  final Widget? content;
  final Function onPressed;

  const Drop_down_interview({
    Key? key,
    required this.title,
    this.select_index,
    required this.onPressed,
    this.content,
  }) : super(key: key);

  @override
  State<Drop_down_interview> createState() => _Drop_down_interviewState();
}

class _Drop_down_interviewState extends State<Drop_down_interview> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: widget.select_index!?ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFFFF9731), Color(0xFFFE7A16)],
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
          ):ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
    side: BorderSide(width: 2, color: Color(0xFFFF9933)),
    borderRadius: BorderRadius.circular(3),
    ),
    ),

          child: ListTile(
            tileColor: Colors.transparent,
            onTap: () {
              _isExpanded = !_isExpanded;
              widget.onPressed();
              setState(() {});
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            title: Text(
              widget.title,
              style:TextStyle(
                color:widget.select_index!? Colors.white:const Color(0xFF5C5C5C),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              )
            ),
            trailing: !_isExpanded
                ?  Icon(Icons.keyboard_arrow_down_rounded,color:widget.select_index!?Colors.white:const Color(0xFF5C5C5C))
                :  Icon(Icons.keyboard_arrow_up_rounded,color:widget.select_index!?Colors.white:const Color(0xFF5C5C5C)),
          ),
        ),
        // _isExpanded? Divider(color: Color_file().Quartz_colore,indent: 20,endIndent: 20,):const SizedBox(),
        AnimatedContainer(
          color: Colors.transparent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          // padding: const EdgeInsets.only(left: 20,right: 20),
          // height: _isExpanded ? 100 : 0,
          child: _isExpanded ? widget.content : const SizedBox(),
        ),
      ],
    );
  }
}
