
import 'package:admin_desktop/utils/app_locale.dart';
import 'package:admin_desktop/widget/SvgPictureWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Service/network_file.dart';
import '../../widget/button/custom_outline_button.dart';
import '../../widget/button/navigate_btn.dart';
import '../../widget/common_screen_appbar.dart';
import '../../widget/input/custom_checkbox.dart';
import '../../widget/loader/loader_file.dart';

class Full_blog_screen extends StatefulWidget {
  final Function appbar_Ontap;
  final String select_user_id;
  final String title_name;
  const Full_blog_screen({super.key,required this.appbar_Ontap,required this.select_user_id,required this.title_name});

  @override
  State<Full_blog_screen> createState() => _Full_blog_screenState();
}

class _Full_blog_screenState extends State<Full_blog_screen> {
  double wrep_spacing=12;
  double wrep_runSpacing=12;


  List blog_data=[
    'Personal Information',
    'Skills',
    'Assignment',
  ];

  @override
  void initState() {
    // TODO: implement initState
    print(widget.select_user_id);
    getblog_details_astro();
    super.initState();
  }

  String authorName='';
  String createdAt='';
  String content  ='';
  List images=[];
  bool check_img=false;
  Future<void> getblog_details_astro() async {
    loader_file().show_loader();
    final user_response = await Network_data().get_Blogs_details(user_id:widget.select_user_id );
    if(user_response!=null){
      authorName=user_response['blog']['authorName'];
          createdAt=user_response['blog']['dateofCreation'];
          content=user_response['blog']['content'];
      images=user_response['blog']['images'];
      check_img=true;
    }
    setState(() {});
    loader_file().dismiss_loader();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              common_appbar(title_name: widget.title_name,
                onTap: () {
                  widget.appbar_Ontap();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      svgpicture().Img_asset(AppImages.calender_icon),
                      SizedBox(width: 15,),
                      Text(
                        createdAt,
                        // '8th-12th April',
                        style: TextStyle(
                          color: Color(0xFF434343),
                          fontSize: 15,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  // Container(
                  //   width: 100,
                  //   height: 35,
                  //   child:NavigateBtn(
                  //     text: 'Edit',
                  //     onPressed: () {
                  //       setState(() {});
                  //     },
                  //   ),
                  // )
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    authorName,
                    style: TextStyle(
                      color: Color(0xFF5B5B5B),
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // Container(
                  //   width: 100,
                  //   height: 35,
                  //   child:custom_outlined_button(
                  //     text: 'Delete',
                  //     // text_size: 'true',
                  //     onPressed: () {
                  //       setState(() {});
                  //     },
                  //   ),
                  // )
                ],
              ),
              // SizedBox(height: 18,),
              // Wrap(
              //   spacing: wrep_spacing,
              //   runSpacing: wrep_runSpacing,
              //   children: [
              //     for (var item in blog_data)
              //       CustomCheckbox(
              //         isChecked: false,
              //         select_name: [],
              //         onChange: () {
              //
              //         },
              //         selectedColor: const Color(0xFFFF9933),
              //         name: item,
              //       ),
              //   ],
              // ),
              SizedBox(height: 25,),
              if(check_img)
                  Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5,
                decoration: BoxDecoration(
                  image: images.isNotEmpty?DecorationImage(
                    image: NetworkImage(images[0]),
                    fit: BoxFit.fill,
                  ):DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/1112x348"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(content,
              style: TextStyle(
                color: Color(0xFF3B3B3B),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
