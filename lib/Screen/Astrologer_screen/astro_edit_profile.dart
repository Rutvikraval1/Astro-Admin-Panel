import 'package:flutter/material.dart';

import '../../widget/CommonTextField.dart';
import '../../widget/common_screen_appbar.dart';

class astro_edit_profile extends StatefulWidget {
  final Function appbar_Ontap;
  const astro_edit_profile({super.key, required this.appbar_Ontap});

  @override
  State<astro_edit_profile> createState() => _astro_edit_profileState();
}

class _astro_edit_profileState extends State<astro_edit_profile> {
  TextEditingController name_controller = TextEditingController();
  String _genderRadioBtnVal = '';

  int select_index = 0;
  List header_title = [
    'Personal',
    'Skill',
    'Professional',
    'Assignment',
    'Upload',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          common_appbar(
            title_name: 'Edit profile',
            onTap: () {
              widget.appbar_Ontap();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2,
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
          const SizedBox(
            height: 30,
          ),
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
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/94x94"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Container(
                width: 100,
                height: 34,
                decoration: ShapeDecoration(
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
                          Text(
                            'Name : ',
                            style: TextStyle(
                              color: Color(0xFF2C2C2C),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          container_widget(
                              text_widget: CommonTextField.textField(
                                  controller: name_controller))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email : ',
                            style: TextStyle(
                              color: Color(0xFF2C2C2C),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          container_widget(
                              text_widget: CommonTextField.textField(
                                  controller: name_controller))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact no : ',
                            style: TextStyle(
                              color: Color(0xFF2C2C2C),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          container_widget(
                              text_widget: CommonTextField.textField(
                                  controller: name_controller))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Emergency Contact no : ',
                            style: TextStyle(
                              color: Color(0xFF2C2C2C),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          container_widget(
                              text_widget: CommonTextField.textField(
                                  controller: name_controller))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Flexible(flex: 1, child: Container()),
                    SizedBox(
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
                                    Text(
                                      'Name : ',
                                      style: TextStyle(
                                        color: Color(0xFF2C2C2C),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    container_widget(
                                        text_widget: CommonTextField.textField(
                                            controller: name_controller))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 28,
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Relation : ',
                                      style: TextStyle(
                                        color: Color(0xFF2C2C2C),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    container_widget(
                                        text_widget: CommonTextField.textField(
                                            controller: name_controller))
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
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender : ',
                              style: TextStyle(
                                color: Color(0xFF2C2C2C),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8,),
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
                                    SizedBox(width: 5,),
                                    Text(
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
                                SizedBox(width: 18,),
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
                                    SizedBox(width: 5,),
                                    Text(
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
                                SizedBox(width: 18,),
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
                                    SizedBox(width: 5,),
                                    Text(
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
                    SizedBox(
                      width: 28,
                    ),
                    Flexible(flex: 1, child: Container()),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Present address : ',
                            style: TextStyle(
                              color: Color(0xFF2C2C2C),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          container_widget(
                              text_widget: CommonTextField.textField(
                                  controller: name_controller))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Permanent address : ',
                            style: TextStyle(
                              color: Color(0xFF2C2C2C),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          container_widget(
                              text_widget: CommonTextField.textField(
                                  controller: name_controller))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 131,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF9933),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFFF9933)),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Save & next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 25,),
                    Container(
                      width: 100,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Color(0xFF954A00),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF954A00)),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void handleGenderChange(String value) {
    _genderRadioBtnVal = value;
    setState(() {});
  }
}

Widget container_widget({required Widget text_widget}) {
  return Container(
    height: 40,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFFD0D0D0)),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    child: text_widget,
  );
}
