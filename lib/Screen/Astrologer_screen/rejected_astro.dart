
import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../widget/button/custom_outline_button.dart';
import '../../widget/button/navigate_btn.dart';
import '../../widget/loader/loader_file.dart';
import '../Interview/interview_profile.dart';

class rejected_astro extends StatefulWidget {
  final String title_name;
  final String page_id;
  final String page_code;
  const rejected_astro({super.key,required this.title_name,required this.page_id,required this.page_code});

  @override
  State<rejected_astro> createState() => _rejected_astroState();
}

class _rejected_astroState extends State<rejected_astro> {
  List<String> list=['Sort By','Date','Time','Activity','Status'];
  String dropdown='';
  String select_user_id='';
  bool interview_profile_check = false;
  List<String> interview_heading_item = [
    'Sr. No.',
    'Name of Astrologer',
    'Mobile number',
    'Email id',
    'Status',
    'Action',
  ];
  List Sr_no=[];
  List User_id=[];
  List Astro_Name=[];
  List mobile_no=[];
  List email_id=[];
  List Status=[];
  List Action=[];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('scscscs');
    print(widget.page_code);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    print('rrrrr');
    print(widget.page_code);

    get_Under_review_astro();
    super.initState();
  }

  Future<void> get_Under_review_astro() async {
    loader_file().show_loader();
    final user_response = await Network_data().get_Under_review_astro(page_name:widget.page_id );
    if(user_response!=null){
      if(user_response['status']){
        Sr_no=[];
        User_id=[];
        Astro_Name=[];
        Status=[];
        mobile_no=[];
        email_id=[];
        Action=[];
        for(int i=0;i<user_response['astrologers'].length;i++){
          Sr_no.add(i+1);
          User_id.add(user_response['astrologers'][i]['_id']);
          Astro_Name.add(user_response['astrologers'][i]['fullName']);
          mobile_no.add(user_response['astrologers'][i]['mobileNumber']);
          email_id.add(user_response['astrologers'][i]['email']);
          Status.add('Rejected');
          Action.add('1');
        }
      }
    }
    setState(() {});
    loader_file().dismiss_loader();
  }

  void referce(){
    get_Under_review_astro();
    // setState(() {});
  }

  final yourScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          showTrackOnHover: false,
          hoverThickness: 80.0,
          controller: yourScrollController,
          child: SingleChildScrollView(
            controller: yourScrollController,
            child: Column(
              children: [
                if (!interview_profile_check)
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(children: [
                      const SizedBox(
                        height:8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title_name??'',
                            style: const TextStyle(
                              color: Color(0xFF954A00),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          DropdownMenu<String>(
                            initialSelection: list.first,
                            inputDecorationTheme: InputDecorationTheme(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            textStyle: TextStyle(
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
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child:
                          DataTable(
                              dataRowColor: MaterialStateProperty.all(Colors.white),
                              headingRowColor: MaterialStateProperty.all(const Color(0xffFF9933)),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              headingTextStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),

                              headingRowHeight: 45,
                              dataTextStyle: const TextStyle(
                                color: Color(0xFF5C5C5C),
                                fontSize: 11,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                              dataRowHeight: 100,
                              // horizontalMargin: 60,
                              columns: [
                                for (int i = 0; i < interview_heading_item.length; i++)
                                  DataColumn(
                                    label: Text(interview_heading_item[i], overflow: TextOverflow.ellipsis),
                                  ),
                              ],

                              rows: [
                                for (int i = 0; i < Sr_no.length; i++)
                                  DataRow(cells: [
                                    DataCell(Text(Sr_no[i].toString())),
                                    DataCell(Text(Astro_Name[i])),
                                    DataCell(Text(mobile_no[i])),
                                    DataCell(Text(email_id[i])),
                                    DataCell(Text(Status[i])),
                                    DataCell(Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width/12,
                                          child: NavigateBtn(
                                            onPressed: () {
                                              select_user_id=User_id[i];
                                              interview_profile_check = true;
                                              setState(() {});
                                            },
                                            text: 'View',
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 20,
                                        // ),
                                        // SizedBox(
                                        //   width: MediaQuery.of(context).size.width/12,
                                        //   child: custom_outlined_button(
                                        //     onPressed: () {
                                        //
                                        //     },
                                        //     text: 'Delete',
                                        //   ),
                                        // )
                                      ],
                                    )),
                                  ]),
                                // DataRow(cells: [
                                //     DataCell(Column(
                                //       children: [
                                //         NavigateBtn(onPressed: (){},text: 'View',),
                                //         SizedBox(height: 10,),
                                //         custom_outlined_button(onPressed: (){},text: 'View',)
                                //       ],
                                //     )),
                                // ])
                              ])
                        // common_interview_table(
                        //   heading_data: interview_heading_item,
                        //   row_data: interview_value,
                        //   approve_ontap: () {},
                        //   view_ontap: () {
                        //     interview_profile_check = true;
                        //     setState(() {});
                        //   },
                        // ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, bottom: 24),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(color: Color(0xFFFF9933)),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 25,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) => Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1, color: Color(0xFFFF9933)),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          color: Color(0xFFFF9933),
                                          fontSize: 11,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(color: Color(0xFFFF9933)),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                if (interview_profile_check)
                  Interview_profile(
                      Select_user_id: select_user_id,
                      check_id_click: '4',
                      appbar_Ontap: () {
                    interview_profile_check = false;
                    setState(() {});
                  })
              ],
            ),
          ),
        ));
  }
}
