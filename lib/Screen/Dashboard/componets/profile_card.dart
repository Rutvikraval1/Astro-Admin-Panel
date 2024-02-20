import 'package:flutter/material.dart';

import '../../../Service/shared_preferences/pref_manager.dart';
import '../../../utils/app_locale.dart';
import '../../Login/login_Screen.dart';

class profile_card extends StatelessWidget {
  final String? img_name;
  final String? user_name;
  final String? mobile_number;
  final String? Email_id;
  const profile_card({super.key,this.user_name,this.mobile_number,this.img_name,this.Email_id});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xffFF9933),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: [
          const BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 73,
                height: 73,
                decoration:  ShapeDecoration(
                  image:  img_name!=null?DecorationImage(
                    image: NetworkImage(img_name!),
                    onError:(exception, stackTrace) => const AssetImage(AppImages.person_img),
                    fit: BoxFit.fill,
                  ):const DecorationImage(
                    image:AssetImage(AppImages.person_img),
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(
                    side: BorderSide(width: 3, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    user_name??'',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8,),
                  const Text(
                    'Admin',
                    style: TextStyle(
                      color: Color(0xFF606060),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )

            ],
          ),
          const SizedBox(height: 20,),
          // for(int i=0;i<3;i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   width: 195,
                //   // height: 35,
                //   decoration: ShapeDecoration(
                //     color: const Color(0xFFFFDAB6),
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                //     shadows: [
                //       const BoxShadow(
                //         color: Color(0x3F000000),
                //         blurRadius: 4,
                //         offset: Offset(0, 0),
                //         spreadRadius: 0,
                //       )
                //     ],
                //   ),
                //   padding: const EdgeInsets.all(8),
                //   child: Row(
                //     children: [
                //       const Text(
                //         'No. of today task: ',
                //         style: TextStyle(
                //           color: Color(0xFF757575),
                //           fontSize: 10,
                //           fontFamily: 'Poppins',
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //       const Text(
                //         '13',
                //         style: TextStyle(
                //           color: Color(0xFFCB6500),
                //           fontSize: 13,
                //           fontFamily: 'Poppins',
                //           fontWeight: FontWeight.w500,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                const Text(
                  'Email id',
                  style: TextStyle(
                    color: Color(0xFF606060),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  Email_id??'',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 9,),
                const Text(
                  'Mobile numbe',
                  style: TextStyle(
                    color: Color(0xFF606060),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  mobile_number??'',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          const SizedBox(height: 15,),
          InkWell(
            onTap: (){
              Preferences.clearAllValuesSF();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const login_screen()),
              );
            },
            child: Container(
              width: 100,
              height: 39,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                shadows: [
                  const BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(4, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
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
