
import 'package:admin_desktop/Screen/Login/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Service/shared_preferences/pref_manager.dart';
import '../responsive.dart';
import '../utils/app_locale.dart';
import '../widget/Common Appbar.dart';
import '../widget/Scaffold_widget.dart';
import '../widget/SvgPictureWidgets.dart';
import '../widget/down_up/custom_accordion.dart';
import 'Astrologer_screen/approve_astro.dart';
import 'Astrologer_screen/astrologer_screen.dart';
import 'Astrologer_screen/live_astro.dart';
import 'Astrologer_screen/rejected_astro.dart';
import 'Blog/Blog_dashboard.dart';
import 'Create_user_screen/create_user_screen.dart';
import 'Dashboard/dashboard_screen.dart';
import 'Interview/interview_dashboard.dart';
import 'Store/Store_product.dart';
import 'Store/Order/order_dashboard.dart';
import 'User_screen/user_screen.dart';
import 'drawer/drawer_screen.dart';

class main_dashboard extends StatefulWidget {
  const main_dashboard({super.key});

  @override
  State<main_dashboard> createState() => _main_dashboardState();
}

class _main_dashboardState extends State<main_dashboard> {
  int select_index=0;
  int select_Sub_index=0;
  int select_Store_index=0;
  bool sub_menu_check=false;
  TextEditingController Search_controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  final yourScrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold_widget(
      // key: _scaffoldKey,
      // appBar: CommonAppBar.appBar(controller: Search_controller),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
               Drawer(
                 backgroundColor: Colors.white,
                 shape: const RoundedRectangleBorder( side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),),
                 child: Column(
                   children: [
                     const SizedBox(
                       height: 32,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           width: 50,
                             height: 50,
                             child: svgpicture().Img_asset(AppImages.company_logo)),
                         const SizedBox(width: 12,),
                         const Text(
                           'AstroVaidyaa',
                           style: TextStyle(
                             color: Color(0xFF1A0B1F),
                             fontSize: 20,
                             fontFamily: 'Outfit',
                             fontWeight: FontWeight.w400,
                             height: 0,
                           ),
                         )
                       ],
                     ),
                     const SizedBox(height: 40,),
                     Expanded(
                       child: Scrollbar(
                         isAlwaysShown: true,
                         showTrackOnHover: false,
                         hoverThickness: 30.0,
                         controller: yourScrollController,
                         child: ListView.builder(
                           scrollDirection: Axis.vertical,
                           controller: yourScrollController,
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           itemCount: acc_menu.length,
                           itemBuilder: (context, index) {
                             return CustomAccordion(
                               onPressed: (){

                                 if(index!=5){
                                   select_index=index;
                                 }
                                     print('fafffas');
                                     print(select_index);
                                     sub_menu_check=false;
                                     setState(() {});
                               },
                               title: acc_menu[index].label,
                               check_trailing: index==2||index==4?'':null,
                               Image_name:acc_menu[index].iconname ,
                               select_index: index==select_index?true:false,
                               content: Padding(
                                 padding: const EdgeInsets.only(left: 20),
                                 child: index==4?
                                 ListView.builder(
                                   shrinkWrap: true,
                                   itemCount: Store_sub_menu.length,
                                   itemBuilder: (context, indexStore) {
                                     return CustomAccordion(
                                       onPressed: (){
                                         select_Store_index=indexStore+1;
                                         print('fafffas');
                                         select_Sub_index=0;
                                         print(select_index);
                                         sub_menu_check=true;
                                         setState(() {});
                                       },
                                       title: Store_sub_menu[indexStore].label,
                                       Image_name:Store_sub_menu[indexStore].iconname ,
                                       checksubmenu: 'true',
                                       select_index: indexStore+1==select_Store_index?true:false,
                                     );
                                   },
                                 ):
                                 ListView.builder(
                                   shrinkWrap: true,
                                   itemCount: astrogogy_sub_menu.length,
                                   itemBuilder: (context, indexSub) {
                                     return CustomAccordion(
                                       onPressed: (){
                                         select_Sub_index=indexSub+1;
                                         print('fafffas');
                                         select_Store_index=0;
                                         print(select_index);
                                         sub_menu_check=true;
                                         setState(() {});
                                       },
                                       title: astrogogy_sub_menu[indexSub].label,
                                       Image_name:astrogogy_sub_menu[indexSub].iconname ,
                                       checksubmenu: 'true',
                                       select_index: indexSub+1==select_Sub_index?true:false,
                                     );
                                   },
                                 ),
                               ),
                             );
                           },
                         ),
                       ),
                     ),
                     Column(
                       children: [
                         Container(
                           width: 208,
                           height: 39,
                           decoration: ShapeDecoration(
                             color: Colors.white,
                             shape: RoundedRectangleBorder(
                               side: const BorderSide(width: 1, color: Color(0xFFFF9933)),
                               borderRadius: BorderRadius.circular(3),
                             ),
                           ),
                           alignment: Alignment.center,
                           child: const Text(
                             'Push Announcement',
                             style: TextStyle(
                               color: Color(0xFFFF9933),
                               fontSize: 16,
                               fontFamily: 'Roboto',
                               fontWeight: FontWeight.w400,
                             ),
                           ),
                         ),
                         const SizedBox(height: 11,),
                         InkWell(
                           onTap: (){
                             Preferences.clearAllValuesSF();
                             Navigator.pushReplacement(
                               context,
                               MaterialPageRoute(builder: (context) => const login_screen()),
                             );
                           },
                           child: Container(
                               width: 208,
                               height: 39,
                               decoration: ShapeDecoration(
                                 color: const Color(0xFFFF9933),
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                               ),
                               alignment: Alignment.center,
                               child: const Text(
                                 'Log out',
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 16,
                                   fontFamily: 'Roboto',
                                   fontWeight: FontWeight.w400,
                                 ),
                               )
                           ),
                         ),
                         const SizedBox(height: 16,),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               InkWell(
                                   onTap: (){
                                     social_link_click('1');
                                   },
                                   child: svgpicture().SvgPicture_asset(AppImages.facebook)),
                               InkWell(onTap: (){
                                 social_link_click('2');
                               },child: svgpicture().SvgPicture_asset(AppImages.instagram)),
                               InkWell(onTap: (){
                                 social_link_click('3');
                               },child: svgpicture().SvgPicture_asset(AppImages.linkedin)),
                               // svgpicture().SvgPicture_asset(AppImages.snapchat),
                               // svgpicture().SvgPicture_asset(AppImages.twitter),
                               InkWell(onTap: (){
                                 social_link_click('4');
                               },child: svgpicture().SvgPicture_asset(AppImages.youtube)),
                             ],
                           ),
                         )
                       ],
                     )
                   ],
                 ),
               ),
            if(!sub_menu_check)
              Flexible(
                  child: Column(
                children: [
                  CommonAppBar.appBar(controller: Search_controller, context: context),
                    if(select_index==0)
                      const Expanded(
                          child: DashboardScreen()),
                    if(select_index==1)
                      const Expanded(
                        child:user_screen(),
                      ),
                    if(select_index==2)
                      const Expanded(
                        child:astrologer_screen(),
                      ),
                    if(select_index==3)
                      Expanded(
                        child:Center(child: Container(color: Colors.greenAccent,child: const Text('Consultation'),)),
                      ),
                    if(select_index==4)
                      const Expanded(
                        child:Store_product(),
                      ),
                    if(select_index==5)
                      Expanded(
                        child:Center(child: Container(color: Colors.lightGreenAccent,child: const Text('Testimony'),)),
                      ),
                    if(select_index==6)
                      const Expanded(
                        child:Blog_dashboard(),
                      ),
                  if(select_index==7)
                    const Expanded(
                      child:Create_user_screen(check_appbar: false),
                    ),
                ],
              )),
            if(sub_menu_check)
              Flexible(
                child: Column(
                  children: [
                    CommonAppBar.appBar(controller: Search_controller, context: context),
                    if(select_Sub_index==1)
                      const Expanded(
                        child:intervie_dashboard(title_name: 'Under review Astrologer',page_id: 'admin/getunderreviewastrologers',page_code: '1'),
                      ),
                    if(select_Sub_index==2)
                      const Expanded(
                        child:approve_astro(title_name: 'Approved Astrologer',page_id: 'admin/getapprovedastrologers',page_code: '2'),
                      ),
                    if(select_Sub_index==3)
                      const Expanded(
                        child:live_astro(title_name: 'Live',page_id: 'admin/getLiveAstrologers',page_code: '3'),
                      ),
                    if(select_Sub_index==4)
                      const Expanded(
                        child:rejected_astro(title_name: 'Rejected',page_id: 'admin/getRejectedAstrologers',page_code: '4'),
                      ),
                    // if(select_Store_index==1)
                    //   const Expanded(
                    //     child:Store_product(),
                    //   ),
                    if(select_Store_index==1)
                      const Expanded(
                        child:Order_dashboard(),
                      ),

                  ],
                ),
              )
            // const User_profile_view(),
            // const astrologer_profile_view()
          ],
        ),
      ),
    );
  }

  String click_link='';
  Future<void> social_link_click(String social_code) async {

    if(social_code=='1'){
      click_link='https://www.facebook.com/p/AstroVaidya-100090331256308/';
    }else if(social_code=='2'){
      click_link='https://instagram.com/astrovaidya?igshid=OGQ5ZDc2ODk2ZA==';
    } else if(social_code=='3'){
      click_link='https://www.linkedin.com/company/astrovaidya/';
    }else if(social_code=='4'){
      click_link='https://www.youtube.com/@astrovaidyaofficial';
    }
    final Uri _url = Uri.parse(click_link);
    if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
    }
  }
}

class DrawerModel {
  String iconname;
  String label;
  String label_id;

  DrawerModel(
      {required this.iconname, required this.label, required this.label_id});
}



//
// class MyScaffold extends StatefulWidget {
//   final Widget body;
//   final String route;
//   const MyScaffold({
//     Key? key,
//     required this.route,
//     required this.body,
//   }) : super(key: key);
//   @override
//   State<MyScaffold> createState() => _MyScaffoldState();
// }
//
// class _MyScaffoldState extends State<MyScaffold> {
//
//   TextEditingController Search_controller = TextEditingController();
//   final List<AdminMenuItem> _sideBarItems =  [
//     AdminMenuItem(
//       title: 'Dashboard',
//       route: '/',
//       icon:Icons.dashboard,
//     ),
//     AdminMenuItem(
//       title: 'User',
//       route: '/user',
//       icon:Icons.person,
//     ),
//     AdminMenuItem(
//       title: 'Astrologer',
//       route: '/astrologer',
//       icon:IconData(),
//     ),
//     // DrawerModel(
//     //     iconname: AppImages.person,
//     //     label: 'User',
//     //     label_id: '2'),
//     AdminMenuItem(
//       title: 'Top Level',
//       icon: Icons.file_copy,
//       children: [
//         AdminMenuItem(
//           title: 'Second Level Item 1',
//           route: '/secondLevelItem1',
//         ),
//         AdminMenuItem(
//           title: 'Second Level Item 2',
//           route: '/secondLevelItem2',
//         ),
//         AdminMenuItem(
//           title: 'Third Level',
//           children: [
//             AdminMenuItem(
//               title: 'Third Level Item 1',
//               route: '/thirdLevelItem1',
//             ),
//             AdminMenuItem(
//               title: 'Third Level Item 2',
//               route: '/thirdLevelItem2',
//               icon: Icons.image,
//             ),
//           ],
//         ),
//       ],
//     ),
//   ];
//
//   final List<AdminMenuItem> _adminMenuItems = const [
//     AdminMenuItem(
//       title: 'User Profile',
//       icon: Icons.account_circle,
//       route: '/',
//     ),
//     AdminMenuItem(
//       title: 'Settings',
//       icon: Icons.settings,
//       route: '/',
//     ),
//     AdminMenuItem(
//       title: 'Logout',
//       icon: Icons.logout,
//       route: '/',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return AdminScaffold(
//       backgroundColor: Colors.white,
//       sideBar: SideBar(
//         backgroundColor: Colors.white,
//         activeBackgroundColor: Color(0xFFFFDEBC),
//         // borderColor: const Color(0xFFE7E7E7),
//         iconColor:const Color(0xFF808080),
//         activeIconColor: const Color(0xFF954A00),
//         textStyle:TextStyle(//0xFF808080
//           color: const Color(0xFF808080),
//           fontSize: 16,
//           fontFamily: 'Roboto',
//           fontWeight: FontWeight.w400,
//         ),
//         activeTextStyle: TextStyle(//0xFF808080
//           color: const Color(0xFF954A00),
//       fontSize: 16,
//       fontFamily: 'Roboto',
//       fontWeight: FontWeight.w400,
//     ),
//         items: _sideBarItems,
//         selectedRoute: widget.route,
//         onSelected: (item) {
//           print(
//               'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
//           if (item.route != null && item.route !=  widget.route) {
//             Navigator.of(context).pushNamed(item.route!);
//           }
//         },
//         header: Column(
//           children: [
//             const SizedBox(
//               height: 32,
//             ),
//           Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                     width: 26,
//                     height: 26,
//                     child: svgpicture().Img_asset(AppImages.company_logo)),
//                 const SizedBox(width: 12,),
//                 const Text(
//                   'AstroVaidya',
//                   style: TextStyle(
//                     color: Color(0xFF1A0B1F),
//                     fontSize: 20,
//                     fontFamily: 'Outfit',
//                     fontWeight: FontWeight.w400,
//                     height: 0,
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(height: 40,),
//           ],
//         ),
//         footer: Container(
//           height: 50,
//           width: double.infinity,
//           color: const Color(0xff444444),
//           child: const Center(
//             child: Text(
//               'footer',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             CommonAppBar.appBar(controller: Search_controller, context: context),
//             widget.body,
//           ],
//         ),
//       ),
//     );
//   }
// }



