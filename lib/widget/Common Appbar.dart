
import 'package:admin_desktop/utils/app_locale.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';
import 'CommonTextField.dart';
import 'SvgPictureWidgets.dart';

class CommonAppBar{

  static AppBar appBar({required TextEditingController controller,required BuildContext context}){
    return AppBar(
      backgroundColor: Colors.white,
        title:Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Container(
            width: 437,
            height: 38,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.03999999910593033),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE6E6E6)),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // alignment: Alignment.centerLeft,
            child:  CommonTextField.textField(controller: controller,prefixIcon: 'true',hintText: 'Search...')
          ),
        ),
        actions: [
          svgpicture().SvgPicture_asset(AppImages.mail),
          const SizedBox(width: 21,),
          svgpicture().SvgPicture_asset(AppImages.setting),
          const SizedBox(width: 21,),
          Padding(
            padding: const EdgeInsets.only(right: 21),
            child: svgpicture().SvgPicture_asset(AppImages.notification),
          ),
        ],
        automaticallyImplyLeading: Responsive.isDesktop(context)?false:true,
        titleSpacing: 0,
        iconTheme:  const IconThemeData(color: Colors.black),
        elevation: 5
    );
  }

}