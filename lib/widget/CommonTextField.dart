
import 'package:flutter/material.dart';

import '../utils/app_locale.dart';
import 'SvgPictureWidgets.dart';

class CommonTextField{

  static Widget textField({

    required TextEditingController? controller,
    String? hintText,
    String? prefixIcon,
    String? check_valid,
    bool? suffixIcon,
    String? suffix_check,
    String? maxLines_check,
    Function? suffix_ontap
  })

  {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (check_valid == 'mail') {
          if (!validateEmail(value!)) {
            return 'Please Enter Valid Email';
          }
        } else {
          if (value == '' || value == null) {
            return 'Please Enter $hintText ';
          }
        }
        return null;
      },
      maxLines: maxLines_check==null?1:null,
      decoration: InputDecoration(
        border:OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 0, style: BorderStyle.none),),
        focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 0, style: BorderStyle.none,),),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 0, style: BorderStyle.none,),),
        disabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 0, style: BorderStyle.none,),) ,
        fillColor: const Color(0xffEDEDED),
        // hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        helperStyle:const TextStyle(
          color: Color(0xFFB3B3B3),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefixIcon!=null?Padding(
          padding: const EdgeInsets.all(5),
          child: svgpicture().SvgPicture_asset(AppImages.SearchFilled,),
        ):null,
          suffixIcon: suffixIcon != null
              ? IconButton(
            icon: Icon(
              !suffixIcon ? Icons.visibility : Icons.visibility_off,
              size: 20,
              color: Colors.grey
            ),
            onPressed: () {
              suffix_ontap!();
            },
          )
              : null

        // filled: true,
      ),
      obscureText: suffix_check==null?false:suffixIcon!,
    );
  }





}
bool validateEmail(String value) {
  RegExp regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  return (!regex.hasMatch(value)) ? false : true;
}