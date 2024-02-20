import 'package:admin_desktop/utils/app_locale.dart';
import 'package:admin_desktop/widget/SvgPictureWidgets.dart';
import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../responsive.dart';
import '../../utils/custColors.dart';
import '../../widget/Common Appbar.dart';
import '../../widget/Scaffold_widget.dart';
import '../../widget/button/navigate_btn.dart';
import '../../widget/loader/loader_file.dart';
import '../Create_user_screen/create_user_screen.dart';
import '../drawer/drawer_screen.dart';
import 'componets/admin_user_list.dart';
import 'componets/card_counter.dart';
import 'componets/profile_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController Search_controller=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    get_total_user_number();
    get_admin_profile();
    super.initState();
  }

  String get_total_user='';
  String get_total_astro='';
  Future<void> get_total_user_number() async {
    loader_file().show_loader();
    final user_response = await Network_data().get_usersregistered();
    if(user_response!=null){
      if(user_response['status']){
        get_total_user=user_response['numberOfUsers'].toString()??'';
      }
    }
    final astro_response = await Network_data().get_astrologersregistered();
    if(astro_response!=null){
      if(astro_response['status']){
        get_total_astro=astro_response['totalAstrologers'].toString()??'';
      }
    }


    setState(() {});
    // loader_file().dismiss_loader();
  }


  String admin_name='';
  String admin_id='';
  String admin_email='';
  String admin_mobile='';
  Future<void> get_admin_profile() async {

    final admin_response = await Network_data().get_admin_profile();
    if(admin_response!=null){
      if(admin_response['status']){
        admin_name=admin_response['user']['name'];
        admin_id=admin_response['user']['_id'];
        admin_email=admin_response['user']['email'];
        admin_mobile=admin_response['user']['mobileNumber'];
      }
    }
    setState(() {});
    loader_file().dismiss_loader();
  }
  final yourScrollController = ScrollController();
  bool create_admin_check=false;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: false,
        hoverThickness: 30.0,
        controller: yourScrollController,
        child: SingleChildScrollView(
            controller: yourScrollController,
          // primary: false,
          child: Column(
            children: [
              if(!create_admin_check)
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(26),
                        child: Container(color:Color(0xffF8F8F8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Overview',
                                style: TextStyle(
                                  color: Color(0xFF954A00),
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:  [
                                  card_counter(counter_number: get_total_user,img_name: AppImages.person_img_icon,title_name: 'Total Registered Users'),
                                  SizedBox(width: 20,),
                                  card_counter(counter_number:get_total_astro,img_name: AppImages.yoga_icon,title_name: 'Total Registered Astrologers'),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Container(
                                // height: 56.33,
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                    color: Carrot_color
                                ),
                                padding: EdgeInsets.only(left: 30,right: 30,bottom: 13,top: 9),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    const Text(
                                      'Aug 2023',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/4.5,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 31.67,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(),
                                            child: Text(
                                              'Days',
                                              style: TextStyle(
                                                color: Color(0xFFFF9933),
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Week',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            'Month',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            'Year',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ),
                  if (Responsive.isDesktop(context))
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.only(
                            top: 18,
                            left: 15,
                            right: 13,
                            bottom: 12,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              left: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                              top: BorderSide(color: Color(0xFFCCCCCC)),
                              right: BorderSide(color: Color(0xFFCCCCCC)),
                              bottom: BorderSide(color: Color(0xFFCCCCCC)),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(4, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            children:  [
                              profile_card(
                                img_name: null,
                                user_name: admin_name??'',
                                mobile_number: admin_mobile??'',
                                Email_id:admin_email??'' ,
                              ),
                              SizedBox(height: 30,),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 30,
                                child: NavigateBtn(
                                  text_size: 'true',
                                  onPressed: (){
                                    create_admin_check=true;
                                    setState(() {});
                                  },
                                  text: 'Create New Admin',
                                ),
                              ),
                              SizedBox(height: 20,),
                              // admin_user_list()
                            ],
                          ),
                        )
                    ),
                ],
              ),
              if(create_admin_check)
                Create_user_screen(check_appbar: true,appbar_Ontap: (){
                  create_admin_check=false;
                  setState(() {});
                },)
            ],
          )
        ),
      ),
    );
  }
}
