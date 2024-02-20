import 'package:flutter/material.dart';


class CustomAccordion extends StatefulWidget {
  final String title;
  final bool? select_index;
  final String Image_name;
  final Widget? content;
  final Function onPressed;
  final String? checksubmenu;
  final String? check_trailing;



  const CustomAccordion({Key? key,this.checksubmenu,this.check_trailing, required this.title,this.select_index,required this.onPressed,
    required this.Image_name, this.content,})
      : super(key: key);

  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: widget.checksubmenu==null?widget.select_index!?const Color(0xFFFFDEBC):null:null,
          child: ListTile(
              tileColor: Colors.transparent,
              onTap: (){
                widget.onPressed();
                setState(() {});
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              // leading: svgpicture().SvgPicture_asset(widget.Image_name,height: 24,width: 24,color_code: widget.select_index!?const Color(0xFF954A00):const Color(0xFF808080)),
              title: Text(
                  widget.title,
                  style: TextStyle(//0xFF808080
                    color: widget.select_index!?const Color(0xFF954A00):const Color(0xFF808080),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  )
              ),
              trailing:widget.check_trailing!=null?Icon(Icons.keyboard_arrow_down_rounded):null
            // widget.check_trailing!=null?GestureDetector(
            //     onTap: (){
            //       _isExpanded = !_isExpanded;
            //       setState(() {});
            //     },
            //     child: !_isExpanded?Icon(Icons.keyboard_arrow_down_rounded):Icon(Icons.keyboard_arrow_up_rounded)
            // ):null,
          ),
        ),
        // _isExpanded? Divider(color: Color_file().Quartz_colore,indent: 20,endIndent: 20,):const SizedBox(),
        widget.check_trailing!=null?AnimatedContainer(
          color: Colors.white,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          // padding: const EdgeInsets.only(left: 20,right: 20),
          // height: _isExpanded ? 100 : 0,
          child: _isExpanded?widget.content:const SizedBox(),
        ):SizedBox(),
      ],
    );
  }
}
