import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../utils/app_locale.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/SvgPictureWidgets.dart';
import '../../widget/common_screen_appbar.dart';
import '../../widget/loader/loader_file.dart';
import '../Dashboard/componets/card_counter.dart';
import '../User_screen/componets/common_datatable.dart';
import 'astro_edit_profile.dart';

class astrologer_profile_view extends StatefulWidget {
  final Function appbar_Ontap;
  final String select_user_id;
  const astrologer_profile_view({super.key,required this.appbar_Ontap,required this.select_user_id});

  @override
  State<astrologer_profile_view> createState() =>
      _astrologer_profile_viewState();
}

class _astrologer_profile_viewState extends State<astrologer_profile_view> {
  List<String> list=['Sort By','Date','Time','Activity','Status'];

  List upcoming_consul_item = [
    'Sr. no',
    'Name',
    'Consult type',
    'Date',
    'Time',
    'Time taken',
    'Charge taken',
    'Feedback given'
  ];
  List upcoming_consul_value = [
    // '1',
    // 'Sheetal Shukla',
    // 'Chat',
    // '05/06/2023',
    // '12:45 pm',
    // '5 min',
    // '5 min',
    // 'Lorem ipsum dolor sit amet consectetur. '
  ];
  bool edit_bool=false;

  @override
  void initState() {
    // TODO: implement initState
    print('select_user_id');
    print(widget.select_user_id);
    print(widget.select_user_id);
    get_user_details();
    super.initState();
  }
  String fullName='';
  String mobileNumber='';
  String AsAstrologer='';
  String profileStatus='';
String img_name='';
  Future<void> get_user_details() async {
    loader_file().show_loader();
    final userdetails_response = await Network_data().get_astro_details(widget.select_user_id);
    if(userdetails_response!=null){
      if(userdetails_response['status']){

        fullName= userdetails_response['astrologer']['fullName'].toString();
        mobileNumber= userdetails_response['astrologer']['mobileNumber'].toString();
        AsAstrologer= userdetails_response['astrologer']['bestQualityAsAstrologer'].toString();
        profileStatus= userdetails_response['astrologer']['profileStatus'].toString();
        // img_name= userdetails_response['astrologer']['profilePicture'].toString();





        // user_gender=userdetails_response['user']['gender'].toString();
        // user_currentAddress='${userdetails_response['user']['currentAddress'].toString()},${userdetails_response['user']['city'].toString()}, '
        //     '${userdetails_response['user']['state'].toString()}, ${userdetails_response['user']['country'].toString()}, ${userdetails_response['user']['pincode'].toString()}.';
      }
      setState(() {});
    }
    loader_file().dismiss_loader();
  }

  Future<void> astro_reject() async {
    loader_file().show_loader();
    final userdetails_response = await Network_data().get_astro_reject_api(widget.select_user_id);
    if(userdetails_response!=null){
      Flutter_toast_mes().Error_Message(userdetails_response['message']);
      if(userdetails_response['status']){
      }
      setState(() {});
    }
    loader_file().dismiss_loader();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(!edit_bool)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column( children: [
                common_appbar(title_name: 'View profile',
                  onTap: () {
                    widget.appbar_Ontap();
                  },
                ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration:  ShapeDecoration(
                          image:
                          img_name!=''?DecorationImage(
                            image: NetworkImage(img_name),

                            onError:(exception, stackTrace) => AssetImage(AppImages.person_img),
                            fit: BoxFit.fill,
                          ):
                          const DecorationImage(
                            image:AssetImage(AppImages.person_img),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(
                            side: BorderSide(width: 3, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            fullName??'',
                            style: const TextStyle(
                              color: Color(0xFFCB6500),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            mobileNumber??'',
                            style: const TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            AsAstrologer??'',
                            style: const TextStyle(
                              color: Color(0xFF7B7B7B),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            profileStatus??'',
                            // 'Availability',
                            style: const TextStyle(
                              color: Color(0xFF954A00),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    right: 400,
                    top: 3,
                    child: Container(
                      width: 51.21,
                      height: 18.79,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Color(0xFF000080)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        shadows: [
                          const BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'About',
                        style: TextStyle(
                          color: Color(0xFF000080),
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 25,
                      right: 18,
                      child: Column(
                        children: [
                          // InkWell(
                          //   onTap: (){
                          //     edit_bool=true;
                          //     setState(() {});
                          //   },
                          //   child: Container(
                          //     width: 100,
                          //     height: 35,
                          //     decoration: ShapeDecoration(
                          //       color: const Color(0xFFFF9933),
                          //       shape: RoundedRectangleBorder(
                          //         side:
                          //             const BorderSide(width: 1, color: Color(0xFFFF9933)),
                          //         borderRadius: BorderRadius.circular(5),
                          //       ),
                          //     ),
                          //     alignment: Alignment.center,
                          //     child: const Text(
                          //       'Edit',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 13,
                          //         fontFamily: 'Arial',
                          //         fontWeight: FontWeight.w700,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),nkWell(
                          //   onTap: (){
                          //     edit_bool=true;
                          //     setState(() {});
                          //   },
                          //   child: Container(
                          //     width: 100,
                          //     height: 35,
                          //     decoration: ShapeDecoration(
                          //       color: const Color(0xFFFF9933),
                          //       shape: RoundedRectangleBorder(
                          //         side:
                          //             const BorderSide(width: 1, color: Color(0xFFFF9933)),
                          //         borderRadius: BorderRadius.circular(5),
                          //       ),
                          //     ),
                          //     alignment: Alignment.center,
                          //     child: const Text(
                          //       'Edit',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 13,
                          //         fontFamily: 'Arial',
                          //         fontWeight: FontWeight.w700,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          InkWell(
                            onTap: (){
                              astro_reject();
                            },
                            child: Container(
                              width: 100,
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side:
                                      const BorderSide(width: 1, color: Color(0xFFFF9933)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Reject',
                                style: TextStyle(
                                  color: Color(0xFFFF9933),
                                  fontSize: 13,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: const [
              //     card_counter(),
              //     card_counter(),
              //     card_counter(),
              //     card_counter(),
              //   ],
              // ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming Consultation',
                    style: TextStyle(
                      color: Color(0xFF954A00),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: -0.27,
                    ),
                  ),
                  DropdownMenu<String>(
                    initialSelection: list.first,
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    textStyle: const TextStyle(
                      color: Color(0xFF838383),
                      fontSize: 13,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                    ),
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        // dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: common_datatable(
                  heading_data: upcoming_consul_item,
                  row_data: upcoming_consul_value,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Client Consult',
                    style: TextStyle(
                      color: Color(0xFF954A00),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: -0.27,
                    ),
                  ),
                  DropdownMenu<String>(
                    initialSelection: list.first,
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    textStyle: const TextStyle(
                      color: Color(0xFF838383),
                      fontSize: 13,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                    ),
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        // dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: common_datatable(
                  heading_data: upcoming_consul_item,
                  row_data: upcoming_consul_value,
                ),
              ),
          ]),
            ),
          if(edit_bool)
            astro_edit_profile(appbar_Ontap: (){
              edit_bool = false;
              setState(() {});
            },)
        ],
      ),
    ));
  }
}
