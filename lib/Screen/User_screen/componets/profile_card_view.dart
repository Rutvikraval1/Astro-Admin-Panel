

import 'package:flutter/material.dart';

import '../../../utils/app_locale.dart';

class profile_card_view extends StatelessWidget {
  final String? img_name;
  final String? user_name;
  final String? mobile_number;
  final Function? delete_button;
  const profile_card_view({super.key,this.img_name,this.mobile_number,this.user_name,this.delete_button});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 226,
      height: 234,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFFFFE1C3), Color(0xFFFF9933)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: ShapeDecoration(
              image:
              img_name!=null?DecorationImage(
                image: NetworkImage(img_name!),
                onError:(exception, stackTrace) => AssetImage(AppImages.person_img),
                fit: BoxFit.fill,
              ):DecorationImage(
                image:AssetImage(AppImages.person_img),
                fit: BoxFit.fill,
              ),
              shape: OvalBorder(
                side: BorderSide(width: 3, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            user_name??'',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            mobile_number??'',
            style: TextStyle(
              color: Color(0xFFE6E6E6),
              fontSize: 11,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(height: 16,),
          InkWell(
            onTap: (){
              delete_button!();
            },
            child: Container(
              width: 201,
              height: 36,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Color(0xFF954A00),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
