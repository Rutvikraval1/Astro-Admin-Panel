import 'package:flutter/material.dart';

import '../utils/app_locale.dart';
import 'SvgPictureWidgets.dart';

class common_appbar extends StatelessWidget {
  final Function onTap;
  final String  title_name;
  const common_appbar({super.key,required this.onTap,required this.title_name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: GestureDetector(
        onTap: (){
          onTap();
        },
        child:Stack(
          children: [
            Row(
              children:  [
                SizedBox(width:40 ,),
                Text(
                  title_name,
                  style: TextStyle(
                    color: Color(0xFF954A00),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],),
            Positioned(top: 1,child: svgpicture().SvgPicture_asset(AppImages.back_arrow))
          ],

        ),
      ),
    );
  }
}
