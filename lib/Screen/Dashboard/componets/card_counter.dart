
import 'package:flutter/material.dart';

import '../../../utils/app_locale.dart';
import '../../../widget/SvgPictureWidgets.dart';

class card_counter extends StatelessWidget {
  final String? title_name;
  final String? counter_number;
  final String? img_name;
  const card_counter({super.key,this.title_name,this.counter_number,this.img_name});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width/5.6,
      height: 105,
      decoration: ShapeDecoration(
        color: Color(0xffD4D4D4),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFD4D4D4)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.76, -0.65),
                end: Alignment(-0.76, 0.65),
                colors: [Color(0xFFEBA951), Color(0xFFFA664E)],
              ),
              shape: OvalBorder(),
            ),
            child: img_name!=null?svgpicture().Img_asset(img_name!):null,
          ),
          // svgpicture().Img_asset(AppImages.person_img_icon),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              SizedBox(
                width: MediaQuery.of(context).size.width/9.5,
                child: Text(
                  title_name??'User',
                  style: TextStyle(
                    color: Color(0xFFCB6500),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                ),
              ),
              // SizedBox(height: ,),
              Text(
                counter_number??'0',
                style: TextStyle(
                  color: Color(0xFFCB6500),
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
