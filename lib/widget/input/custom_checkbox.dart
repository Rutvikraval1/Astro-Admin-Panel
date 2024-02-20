import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  Function onChange;
  final bool isChecked;
  final Color selectedColor;
  final String name;
  final List select_name;

  CustomCheckbox(
      {required this.isChecked,
      required this.onChange,
      required this.selectedColor,
      required this.select_name,
      required this.name});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          !widget.isChecked;
          _isSelected = !_isSelected;
          print('List');
          print(_isSelected);
          if (_isSelected) {
            widget.select_name.add(widget.name);
          } else {
            if (widget.select_name.contains(widget.name)) {
              widget.select_name.remove(widget.name);
            }
          }
        });
      },
      child: AnimatedContainer(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: ShapeDecoration(
            color:_isSelected
                      ? widget.selectedColor
                      : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFFF9933)),
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          // decoration: BoxDecoration(
          //     color: _isSelected
          //         ? widget.selectedColor
          //         : Colors.transparent,
          //     borderRadius: BorderRadius.circular(50),
          //     border: Border.all(
          //         color: _isSelected ? widget.borderColor : Colors.black,
          //         width: 0.8)),
          child: Text(
            widget.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: _isSelected ? Colors.white : Colors.lightGreen,
            ),
          )),
    );
  }
}
