
import 'package:flutter/material.dart';

import '../../../utils/app_locale.dart';
import '../../../widget/SvgPictureWidgets.dart';

class User_profile_card extends StatelessWidget {
  final String? img_name;
  final String? user_name;
  final String? mobile_number;
  final Function? view_ontap;
  const User_profile_card({super.key,this.img_name,this.user_name,this.mobile_number,this.view_ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 203,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFB9B9B9)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 71,
            height: 71,
            decoration:  ShapeDecoration(
              image: img_name!=null?DecorationImage(
                image: NetworkImage(img_name!),
                onError:(exception, stackTrace) => AssetImage(AppImages.person_img),
                fit: BoxFit.fill,
              ):DecorationImage(
                image: AssetImage(AppImages.person_img),
                fit: BoxFit.fill,
              ),
              shape: OvalBorder(
                side: BorderSide(width: 1, color: Color(0xFF954A00)),
              ),
            ),
          ),
          const SizedBox(height: 8,),
           Text(
            user_name??'',
            style: TextStyle(
              color: Color(0xFFCB6500),
              fontSize: 13,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(height: 5,),
           Text(
            mobile_number??'',
            style: TextStyle(
              color: Color(0xFF777777),
              fontSize: 11,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  view_ontap!();
                },
                child: Container(
                  width: 86,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF6A44F),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'View Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              // Container(
              //   width: 86,
              //   height: 30,
              //   decoration: ShapeDecoration(
              //     shape: RoundedRectangleBorder(
              //       side: const BorderSide(width: 1, color: Color(0xFFFF9933)),
              //       borderRadius: BorderRadius.circular(3),
              //     ),
              //   ),
              //   alignment: Alignment.center,
              //   child: const Text(
              //     'Delete',
              //     style: TextStyle(
              //       color: Color(0xFFFF9933),
              //       fontSize: 11,
              //       fontFamily: 'Inter',
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
