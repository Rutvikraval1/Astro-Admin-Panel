
import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../utils/app_locale.dart';
import '../../widget/CommonTextField.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/button/custom_outline_button.dart';
import '../../widget/button/navigate_btn.dart';
import '../../widget/common_screen_appbar.dart';
import '../../widget/input/custom_checkbox.dart';
import '../../widget/loader/loader_file.dart';
import 'componets/drop_down_interview.dart';
class Interview_profile extends StatefulWidget {
  final Function appbar_Ontap;
  final String Select_user_id;
  final String check_id_click;
  const Interview_profile({super.key,required this.appbar_Ontap,required this.Select_user_id,required this.check_id_click});

  @override
  State<Interview_profile> createState() => _Interview_profileState();
}

class _Interview_profileState extends State<Interview_profile> {
  TextEditingController fullName_contro = TextEditingController();
  TextEditingController email_contro = TextEditingController();
  TextEditingController mobileNumber_contro = TextEditingController();
  TextEditingController emer_ContactNo_contro = TextEditingController();
  TextEditingController per_Address_contro = TextEditingController();
  TextEditingController collegeSchool_contro = TextEditingController();
  TextEditingController learnAstrologyFrom_contro = TextEditingController();
  TextEditingController learnAboutUsFrom_contro = TextEditingController();
  TextEditingController platformName_contro = TextEditingController();
  TextEditingController Relation_contro = TextEditingController();
  TextEditingController name_contro = TextEditingController();

//Assignment
  TextEditingController Assignmen1_contro = TextEditingController();
  TextEditingController Assignmen2_contro = TextEditingController();
  TextEditingController Assignmen3_contro = TextEditingController();
  TextEditingController Assignmen4_contro = TextEditingController();
  TextEditingController Assignmen5_contro = TextEditingController();
  TextEditingController Assignmen6_contro = TextEditingController();
  TextEditingController Assignmen7_contro = TextEditingController();
  TextEditingController Assignmen8_contro = TextEditingController();
  TextEditingController Assignmen9_contro = TextEditingController();
  TextEditingController Assignmen10_contro = TextEditingController();
  TextEditingController Assignmen11_contro = TextEditingController();
  TextEditingController Assignmen12_contro = TextEditingController();

  var profile_pic;
  String _genderRadioBtnVal = '';
  String _Consultation_type = '';
  String _working_type = '';
  int select_index = 0;
  int select_drop_down_index=0;


  double wrep_spacing=12;
  double wrep_runSpacing=12;
  List<String> header_title = [
    'Candidate information',
  ];

  List<String> drop_down_title=[
    'Personal Information',
    'Skills',
    'Assignment',
  ];
  void handleGenderChange(String value) {
    _genderRadioBtnVal = value;
    setState(() {});
  }
  void Consultation_typeChange(String value) {
    _Consultation_type = value;
    setState(() {});
  }
  void working_typeChange(String value) {
    _working_type = value;
    setState(() {});
  }

  List Astrologer_type = [];
  List consultationType = [];
  List experienceInYears = [];
  List highestQualification = [];
  List languages = [];
  List Degree = [];




  @override
  void initState() {
    // TODO: implement initState
    print('user_id');
    get_user_details();
    print(widget.Select_user_id);
    super.initState();
  }
  Future<void> get_user_details() async {
    loader_file().show_loader();
    final userdetails_response = await Network_data().get_astro_details(widget.Select_user_id);
    if(userdetails_response!=null){
      try{
        if(userdetails_response['status']){
          profile_pic= userdetails_response['astrologer']['profilePicture'];
          fullName_contro.text= userdetails_response['astrologer']['fullName'].toString();
          email_contro.text= userdetails_response['astrologer']['email'].toString();
          mobileNumber_contro.text= userdetails_response['astrologer']['mobileNumber'].toString();
          emer_ContactNo_contro.text= userdetails_response['astrologer']['emergencyContactNumber'].toString();
          per_Address_contro.text= userdetails_response['astrologer']['permanentAddress'].toString();
          collegeSchool_contro.text= userdetails_response['astrologer']['collegeSchool'].toString();
          learnAstrologyFrom_contro.text= userdetails_response['astrologer']['learnAstrologyFrom'].toString();
          learnAboutUsFrom_contro.text= userdetails_response['astrologer']['learnAboutUsFrom'].toString();
          platformName_contro.text= userdetails_response['astrologer']['platformName'].toString();


          // gender pending

          Assignmen1_contro.text=userdetails_response['astrologer']['hoursAvailable'].toString();
          Assignmen2_contro.text=userdetails_response['astrologer']['reasonToOnboard'].toString();
          Assignmen3_contro.text=userdetails_response['astrologer']['traveledInternationally'].toString();
          Assignmen4_contro.text=userdetails_response['astrologer']['handledForeignClient'].toString();
          Assignmen5_contro.text=userdetails_response['astrologer']['handlingRepetitiveQuestions'].toString();
          Assignmen6_contro.text=userdetails_response['astrologer']['bestQualityAsAstrologer'].toString();
          Assignmen7_contro.text=userdetails_response['astrologer']['expectedEarning'].toString();
          Assignmen8_contro.text=userdetails_response['astrologer']['aboutYourself'].toString();


          Assignmen9_contro.text=userdetails_response['astrologer']['socialLinks']['instagram']??'';
          Assignmen10_contro.text=userdetails_response['astrologer']['socialLinks']['facebook']??'';
          Assignmen11_contro.text=userdetails_response['astrologer']['socialLinks']['youtube']??'';
          Assignmen12_contro.text=userdetails_response['astrologer']['socialLinks']['other']??'';
          var bool_check=userdetails_response['astrologer']['workingOnOtherPlatform'];
          if(bool_check!=null){
            if(bool_check){
              _working_type='Yes';
            }else{
              _working_type='No';
            }
          }


          // hoursAvailable
          // reasonToOnboard
          // traveledInternationally
          // handledForeignClient
          // handlingRepetitiveQuestions
          // bestQualityAsAstrologer
          // expectedEarning
          // aboutYourself



          //list
          Astrologer_type=userdetails_response['astrologer']['astrologerType'];
          consultationType=userdetails_response['astrologer']['consultationType'];
          experienceInYears.add(userdetails_response['astrologer']['experienceInYears'].toString());
          Degree.add(userdetails_response['astrologer']['degree'].toString());
          highestQualification.add(userdetails_response['astrologer']['highestQualification']);
          languages= userdetails_response['astrologer']['languages'];
        }
        setState(() {});
      }catch(e){
        loader_file().dismiss_loader();
      }
    }
    loader_file().dismiss_loader();
  }


  Future<void> action_button_click(String button_clicl_status) async {
    loader_file().show_loader();
    var userdetails_response;
    if(button_clicl_status=='1'){
      userdetails_response = await Network_data().Approved_astro_api(widget.Select_user_id);
    }
    if(button_clicl_status=='2'){
      userdetails_response = await Network_data().get_astro_reject_api(widget.Select_user_id);
    }
    if(button_clicl_status=='3'){
      userdetails_response = await Network_data().Approved_TO_live_astro_api(widget.Select_user_id);
    }
    // final userdetails_response = await Network_data().Approved_astro_api(widget.Select_user_id);
    if(userdetails_response!=null){
      Flutter_toast_mes().Error_Message(userdetails_response['message']);
      if(userdetails_response['status']){
        // Flutter_toast_mes().Error_Message(userdetails_response['message']);
      }
      setState(() {});
    }
    loader_file().dismiss_loader();
  }


  @override
  Widget build(BuildContext context) {

    List<Widget> drop_down_coontant=[
      Personal_Information(),
      Skills(),
      Assignment(),
    ];
    return SafeArea(child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            common_appbar(title_name: 'View profile',
              onTap: () {
                widget.appbar_Ontap();
              },
            ),
            const SizedBox(height: 10,),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              decoration: const ShapeDecoration(
                shape: BorderDirectional(
                    bottom: BorderSide(
                      width: 1,
                      // strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFFF9933),
                    )),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: header_title.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        select_index = index;
                        setState(() {});
                      },
                      child: Container(
                        // width: 110,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: ShapeDecoration(
                          color: select_index == index
                              ? const Color(0xFFFF9933)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            side: select_index == index
                                ? BorderSide.none
                                : const BorderSide(
                                width: 1, color: Color(0xFFFF9933)),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          header_title[index],
                          style: TextStyle(
                            color: select_index == index
                                ? Colors.white
                                : const Color(0xFFFF9933),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: select_index == index
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            widget.check_id_click=='4'?SizedBox():
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.check_id_click=='2'?
            SizedBox(
              width: 133,
              child: NavigateBtn(
                onPressed: (){
                  action_button_click('3');
                },
                text: 'Mark Live',
              ),
            )
                      :   widget.check_id_click=='3'?SizedBox():SizedBox(
                    width: 133,
                    child: NavigateBtn(
                      onPressed: (){
                        action_button_click('1');
                      },
                      text: 'Approve the profile',
                    ),
                  ),
                  const SizedBox(width: 20,),
                  SizedBox(
                    width: 133,
                    child: custom_outlined_button(
                      onPressed: (){
                        action_button_click('2');
                      },
                      text: 'Reject the Profile',
                    ),
                  ),

            ]),
            const SizedBox(height: 25,),
            Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: drop_down_title.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Drop_down_interview(
                          title: drop_down_title[index],
                          onPressed: (){
                            select_drop_down_index=index;
                            setState(() {});
                        },
                          select_index: index==select_drop_down_index?true:false,
                        content: drop_down_coontant[index],
                        ),
                        const SizedBox(height: 12,)
                      ],
                    ),
                  ),

                ],
              ),
            const SizedBox(height: 30,),
            widget.check_id_click=='4'?SizedBox():
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.check_id_click=='2'?
                    SizedBox(
                      width: 133,
                      child: NavigateBtn(
                        onPressed: (){
                          action_button_click('3');
                        },
                        text: 'Mark Live',
                      ),
                    ):widget.check_id_click=='3'?SizedBox():  SizedBox(
                      width: 133,
                      child: NavigateBtn(
                        onPressed: (){
                          action_button_click('1');
                        },
                        text: 'Approve the profile',
                      ),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 133,
                      child: custom_outlined_button(
                        onPressed: (){
                          action_button_click('2');
                        },
                        text: 'Reject the Profile',
                      ),
                    ),

                  ]),
            ),
              ]),
      ),
          ));

  }


    Widget Personal_Information(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24,),
        const Text(
          'Photo',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 94,
              height: 94,
              decoration:  ShapeDecoration(
                image:
                profile_pic!=null?DecorationImage(
                  image: NetworkImage(profile_pic),
                  onError:(exception, stackTrace) => AssetImage(AppImages.person_img),
                  fit: BoxFit.fill,
                ):
                const DecorationImage(
                  image:AssetImage(AppImages.person_img),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Container(
              width: 100,
              height: 34,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFB9B9B9)),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Select Image',
                style: TextStyle(
                  color: Color(0xFFFFCA95),
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.6,
          // height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name : ',
                          style: TextStyle(
                            color: Color(0xFF2C2C2C),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        container_widget(
                            text_widget: CommonTextField.textField(
                                controller: fullName_contro))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email : ',
                          style: TextStyle(
                            color: Color(0xFF2C2C2C),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        container_widget(
                            text_widget: CommonTextField.textField(
                                controller: email_contro))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Contact no : ',
                          style: TextStyle(
                            color: Color(0xFF2C2C2C),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        container_widget(
                            text_widget: CommonTextField.textField(
                                controller: mobileNumber_contro))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Emergency Contact no : ',
                          style: TextStyle(
                            color: Color(0xFF2C2C2C),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        container_widget(
                            text_widget: CommonTextField.textField(
                                controller: emer_ContactNo_contro))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Flexible(flex: 1, child: Container()),
                  const SizedBox(
                    width: 28,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Name : ',
                                    style: TextStyle(
                                      color: Color(0xFF2C2C2C),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  container_widget(
                                      text_widget: CommonTextField.textField(
                                          controller: name_contro))
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 28,
                            ),
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Relation : ',
                                    style: TextStyle(
                                      color: Color(0xFF2C2C2C),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  container_widget(
                                      text_widget: CommonTextField.textField(
                                          controller: Relation_contro))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Gender : ',
                            style: TextStyle(
                              color: Color(0xFF2C2C2C),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                    value: "Male",
                                    groupValue: _genderRadioBtnVal,
                                    onChanged: (value) {
                                      if (value != null) {
                                        handleGenderChange(value);
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    'Male',
                                    style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 18,),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: "Female",
                                    groupValue: _genderRadioBtnVal,
                                    onChanged: (value) {
                                      if (value != null) {
                                        handleGenderChange(value);
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    'Female',
                                    style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 18,),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: "Other",
                                    groupValue: _genderRadioBtnVal,
                                    onChanged: (value) {
                                      if (value != null) {
                                        handleGenderChange(value);
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    'Other',
                                    style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 28,
                  ),
                  Flexible(flex: 1, child: Container()),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Present address : ',
                          style: TextStyle(
                            color: Color(0xFF2C2C2C),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        container_widget(
                            text_widget: CommonTextField.textField(
                                controller: per_Address_contro))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Permanent address : ',
                          style: TextStyle(
                            color: Color(0xFF2C2C2C),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        container_widget(
                            text_widget: CommonTextField.textField(
                                controller: per_Address_contro))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30,),
      ],
    );
  }

  Widget Skills(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24,),
        Text_widget(text: 'Astrologer type'),
        const SizedBox(height: 14,),
        Wrap(
          spacing: wrep_spacing,
          runSpacing: wrep_runSpacing,
          children: [
            for (var item in Astrologer_type)
              CustomCheckbox(
                isChecked: false,
                select_name: [],
                onChange: () {
                  setState(() {
                    // item.isSelected = !item.isSelected;
                    print('office');
                    // print(item.isSelected);
                  });
                },
                selectedColor: const Color(0xFFFF9933),
                name: item,
              ),
          ],
        ),
        const SizedBox(height: 25,),
        Text_widget(text: 'Consultation type:'),
        const SizedBox(height: 14,),

          Row(
            children: [
              for (var item in consultationType)
              Row(
                children: [
                  Radio<String>(
                    value: item,
                    groupValue: _Consultation_type,
                    onChanged: (value) {
                      if (value != null) {
                        Consultation_typeChange(value);
                      }
                    },
                  ),
                  const SizedBox(width: 5,),
                   Text(
                    item.toString(),
                    style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 18,),
                ],
              ),
            ],
          ),
        // Row(
        //   children: [
        //     for (var item in consultationType)
        //       Row(
        //       children: [
        //         Radio<String>(
        //           value: "Call",
        //           groupValue: _Consultation_type,
        //           onChanged: (value) {
        //             if (value != null) {
        //               Consultation_typeChange(value);
        //             }
        //           },
        //         ),
        //         const SizedBox(width: 5,),
        //         const Text(
        //           'Call',
        //           style: TextStyle(
        //             color: Color(0xFF313131),
        //             fontSize: 13,
        //             fontFamily: 'Poppins',
        //             fontWeight: FontWeight.w400,
        //           ),
        //         )
        //         const SizedBox(width: 18,),
        //       ],
        //     ),
        //
        //     // Row(
        //     //   children: [
        //     //     Radio<String>(
        //     //       value: "Chat",
        //     //         groupValue: _Consultation_type,
        //     //         onChanged: (value) {
        //     //           if (value != null) {
        //     //             Consultation_typeChange(value);
        //     //           }
        //     //         },
        //     //     ),
        //     //     const SizedBox(width: 5,),
        //     //     const Text(
        //     //       'Chat',
        //     //       style: TextStyle(
        //     //         color: Color(0xFF313131),
        //     //         fontSize: 13,
        //     //         fontFamily: 'Poppins',
        //     //         fontWeight: FontWeight.w400,
        //     //       ),
        //     //     )
        //     //   ],
        //     // ),
        //     // const SizedBox(width: 18,),
        //     // Row(
        //     //   children: [
        //     //     Radio<String>(
        //     //       value: "Video call",
        //     //       groupValue: _Consultation_type,
        //     //       onChanged: (value) {
        //     //         if (value != null) {
        //     //           Consultation_typeChange(value);
        //     //         }
        //     //       },
        //     //     ),
        //     //     const SizedBox(width: 5,),
        //     //     const Text(
        //     //       'Video call',
        //     //       style: TextStyle(
        //     //         color: Color(0xFF313131),
        //     //         fontSize: 13,
        //     //         fontFamily: 'Poppins',
        //     //         fontWeight: FontWeight.w400,
        //     //       ),
        //     //     )
        //     //   ],
        //     // ),
        //     // const SizedBox(width: 18,),
        //     // Row(
        //     //   children: [
        //     //     Radio<String>(
        //     //       value: "Home visit",
        //     //       groupValue: _Consultation_type,
        //     //       onChanged: (value) {
        //     //         if (value != null) {
        //     //           Consultation_typeChange(value);
        //     //         }
        //     //       },
        //     //     ),
        //     //     const SizedBox(width: 5,),
        //     //     const Text(
        //     //       'Home visit',
        //     //       style: TextStyle(
        //     //         color: Color(0xFF313131),
        //     //         fontSize: 13,
        //     //         fontFamily: 'Poppins',
        //     //         fontWeight: FontWeight.w400,
        //     //       ),
        //     //     )
        //     //   ],
        //     // ),
        //   ],
        // ),
        const SizedBox(height: 25,),
        Text_widget(text: 'Experience in year'),
        const SizedBox(height: 14,),
        Wrap(
          spacing: wrep_spacing,
          runSpacing: wrep_runSpacing,
          children: [
            for (var item in experienceInYears)
              CustomCheckbox(
                isChecked: false,
                select_name: [],
                onChange: () {
                  setState(() {
                    // item = !item.isSelected;
                    // print('office');
                    // print(item.isSelected);
                  });
                },
                selectedColor: const Color(0xFFFF9933),
                name: item,
              ),
          ],
        ),
        const SizedBox(height: 25,),
        Text_widget(text:   'Highest Qualification'),
        const SizedBox(height: 14,),
        Wrap(
          spacing: wrep_spacing,
          runSpacing: wrep_runSpacing,
          children: [
            for (var item in highestQualification)
              CustomCheckbox(
                isChecked: false,
                select_name: [],
                onChange: () {
                  setState(() {
                    // item.isSelected = !item.isSelected;
                    // print('office');
                    // print(item.isSelected);
                  });
                },
                selectedColor: const Color(0xFFFF9933),
                name: item.toString(),
              ),
          ],
        ),
        const SizedBox(height: 25,),
        Text_widget(text:  'Degree'),
        const SizedBox(height: 14,),
        Wrap(
          spacing: wrep_spacing,
          runSpacing: wrep_runSpacing,
          children: [
            for (var item in Degree)
              CustomCheckbox(
                isChecked: false,
                select_name: [],
                onChange: () {
                  setState(() {
                    // item.isSelected = !item.isSelected;
                    // print('office');
                    // print(item.isSelected);
                  });
                },
                selectedColor: const Color(0xFFFF9933),
                name: item,
              ),
          ],
        ),
        const SizedBox(height: 25,),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text_widget(text:  'School/College :'),
                  const SizedBox(
                    height: 8,
                  ),
                  container_widget(
                      text_widget: CommonTextField.textField(
                          controller: collegeSchool_contro))
                ],
              ),
            ),
            const SizedBox(
              width: 28,
            ),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text_widget(text:  'From where did you learned Astrology? '),
                  const SizedBox(
                    height: 8,
                  ),
                  container_widget(
                      text_widget: CommonTextField.textField(
                          controller: learnAstrologyFrom_contro))
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25,),
        Text_widget(text:  'Language'),
        const SizedBox(height: 14,),
        Wrap(
          spacing: wrep_spacing,
          runSpacing: wrep_runSpacing,
          children: [
            for (var item in languages)
              CustomCheckbox(
                isChecked: false,
                select_name: [],
                onChange: () {
                  setState(() {
                    // item.isSelected = !item.isSelected;
                    // print('office');
                    // print(item.isSelected);
                  });
                },
                selectedColor: const Color(0xFFFF9933),
                name: item,
              ),
          ],
        ),
        const SizedBox(height: 25,),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text_widget(text:  'From where did you learn about us?'),
                  const SizedBox(
                    height: 8,
                  ),
                  container_widget(
                      text_widget: CommonTextField.textField(
                          controller: learnAboutUsFrom_contro))
                ],
              ),
            ),
            const SizedBox(
              width: 28,
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
        const SizedBox(height: 25,),
        Text_widget(text: 'Are you working on some other platform?'),
        const SizedBox(height: 14,),
        Row(
          children: [
            Row(
              children: [
                Radio<String>(
                  value: "Yes",
                  groupValue: _working_type,
                  onChanged: (value) {
                    if (value != null) {
                      working_typeChange(value);
                    }
                  },
                ),
                const SizedBox(width: 5,),
                const Text(
                  'Yes',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(width: 18,),
            Row(
              children: [
                Radio<String>(
                  value: "No",
                  groupValue: _working_type,
                  onChanged: (value) {
                    if (value != null) {
                      working_typeChange(value);
                    }
                  },
                ),
                const SizedBox(width: 5,),
                const Text(
                  'No',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 25,),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text_widget(text:  'Platform Name :'),
                  const SizedBox(
                    height: 8,
                  ),
                  container_widget(
                      text_widget: CommonTextField.textField(
                          controller: platformName_contro))
                ],
              ),
            ),
            const SizedBox(
              width: 28,
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
        const SizedBox(height: 30,),
      ],
    );
  }


  Widget Assignment(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25,),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_widget(text:  'How many hour can you contribute?: '),
                    const SizedBox(
                      height: 8,
                    ),
                    container_widget(
                        text_widget: CommonTextField.textField(
                            controller: Assignmen1_contro))
                  ],
                ),
              ),
              const SizedBox(
                width: 28,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_widget(text:  'Why do you think we should go onboard with you? : '),
                    const SizedBox(
                      height: 8,
                    ),
                    container_widget(
                        text_widget: CommonTextField.textField(
                            controller: Assignmen2_contro))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_widget(text:  'Have you travel international?: '),
                    const SizedBox(
                      height: 8,
                    ),
                    container_widget(
                        text_widget: CommonTextField.textField(
                            controller: Assignmen3_contro))
                  ],
                ),
              ),
              const SizedBox(
                width: 28,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_widget(text:  'Have you handled a foreign client? : '),
                    const SizedBox(
                      height: 8,
                    ),
                    container_widget(
                        text_widget: CommonTextField.textField(
                            controller: Assignmen4_contro))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_widget(text:  'How did you handled a client who asked same questions repeatedly ?: '),
                    const SizedBox(
                      height: 8,
                    ),
                    container_widget(
                        text_widget: CommonTextField.textField(
                            controller: Assignmen5_contro))
                  ],
                ),
              ),
              const SizedBox(
                width: 28,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_widget(text:  'What is your best quality as an Astrologer? : '),
                    const SizedBox(
                      height: 8,
                    ),
                    container_widget(
                        text_widget: CommonTextField.textField(
                            controller: Assignmen6_contro))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_widget(text:  'Expected earning :'),
                    const SizedBox(
                      height: 8,
                    ),
                    container_widget(
                        text_widget: CommonTextField.textField(
                            controller: Assignmen7_contro))
                  ],
                ),
              ),
              const SizedBox(
                width: 28,
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text_widget(text:  'Tell us about yourself :'),
              const SizedBox(
                height: 8,
              ),
              container_widget(
                  text_widget: CommonTextField.textField(
                      controller: Assignmen8_contro))
            ],
          ),
          const SizedBox(height: 25,),
          Text_widget(text:  'Social media link:'),
          const SizedBox(height: 25,),
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width/10,
                  child: Text_widget(text:  'Instagram link:')),
              Container(
                width: MediaQuery.of(context).size.width/4.5,
                child: container_widget(
                    text_widget: CommonTextField.textField(
                        controller: Assignmen9_contro)),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width/10,
                  child: Text_widget(text:  'Facebook link:')),
              Container(
                width: MediaQuery.of(context).size.width/4.5,
                child: container_widget(
                    text_widget: CommonTextField.textField(
                        controller: Assignmen10_contro)),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width/10,
                  child: Text_widget(text:  'Youtube link:',)),
              Container(
                width: MediaQuery.of(context).size.width/4.5,
                child: container_widget(
                    text_widget: CommonTextField.textField(
                        controller: Assignmen11_contro)),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width/10,
                  child: Text_widget(text:  'Other link:',)),
              Container(
                width: MediaQuery.of(context).size.width/4.5,
                child: container_widget(
                    text_widget: CommonTextField.textField(
                        controller: Assignmen12_contro)),
              )
            ],
          ) ,
        ],
      ),
    );
  }

}



Widget container_widget({required Widget text_widget}) {
  return Container(
    height: 40,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFD0D0D0)),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    child: text_widget,
  );
}

Widget Text_widget({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
  );
}

class Box {
  final String name;
  bool isSelected;

  Box({required this.name, this.isSelected = false});
}