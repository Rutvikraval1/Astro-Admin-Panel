import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../utils/app_locale.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/button/custom_outline_button.dart';
import '../../widget/button/navigate_btn.dart';
import '../../widget/loader/loader_file.dart';
import '../Dashboard/componets/card_counter.dart';
import 'Full_blog_screen.dart';
import 'add_blog.dart';

class Blog_dashboard extends StatefulWidget {
  const Blog_dashboard({super.key});

  @override
  State<Blog_dashboard> createState() => _Blog_dashboardState();
}

class _Blog_dashboardState extends State<Blog_dashboard> {
  List<String> list = ['Sort By', 'Date', 'Time', 'Activity', 'Status'];
  final yourScrollController = ScrollController();
  String blog_check_screen = '0';
  String select_id = '';
  String select_title = '';

  List<String> blog_heading_item = [
    'Sr. No.',
    'Title',
    'Author name',
    'Description ',
    'Date',
    'Time',
    'Action',
  ];

  List Sr_no = [];
  List Title = [];
  List Author_name = [];
  List Date = [];
  List User_id = [];
  List Time = [];
  List Action = [];
  List Description = [];

  Future<void> get_Under_review_astro() async {
    loader_file().show_loader();
    final user_response = await Network_data().get_BlogsList();
    if (user_response != null) {
      Sr_no = [];
      Title = [];
      Author_name = [];
      Date = [];
      Time = [];
      User_id = [];
      Action = [];
      Description = [];
      final get_data=user_response['blogs'];
      for (int i = 0; i < get_data.length; i++) {
        Sr_no.add(i + 1);
        Title.add(get_data[i]['title'] ?? '');
        User_id.add(get_data[i]['_id'] ?? '');
        Author_name.add(get_data[i]['authorName'] ?? '');
        Date.add(get_data[i]['dateofCreation'] ?? '');
        Time.add(get_data[i]['timeofCreation'] ?? '');
        Description.add(get_data[i]['content'] ?? '');
        Action.add('1');
      }
    }
    setState(() {});
    loader_file().dismiss_loader();
  }

  Future<void> action_button_click(String select_user_id) async {
    loader_file().show_loader();
    final userdetails_response =
        await Network_data().delete_blog_api(select_user_id);
    if (userdetails_response != null) {
      Flutter_toast_mes().Error_Message(userdetails_response['message']);
      // if(userdetails_response['status']){
      //   // Flutter_toast_mes().Error_Message(userdetails_response['message']);
      // }
      setState(() {});
    }
    // loader_file().dismiss_loader();
    // Future.delayed(Duration())
    get_Under_review_astro();
  }

  @override
  void initState() {
    get_Under_review_astro();
    // TODO: implement initState
    super.initState();
  }

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
            if (blog_check_screen == '0')
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Blog',
                      style: TextStyle(
                        color: Color(0xFF954A00),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        card_counter(
                          title_name: 'Total Blog',
                          counter_number: Title.length.toString(),
                          img_name: AppImages.blog_img,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const card_counter(
                          title_name: 'Total Reader',
                          counter_number: '1000',
                          img_name: AppImages.bx_book,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                          dropdownMenuEntries: list
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 135,
                          height: 45,
                          child: NavigateBtn(
                            text: 'Add Blog',
                            text_size: 'true',
                            onPressed: () {
                              blog_check_screen = '1';
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DataTable(
                            dataRowColor:
                                MaterialStateProperty.all(Colors.white),
                            headingRowColor: MaterialStateProperty.all(
                                const Color(0xffFF9933)),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
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
                            horizontalMargin: 60,
                            columns: [
                              for (int i = 0; i < blog_heading_item.length; i++)
                                DataColumn(
                                  label: Text(blog_heading_item[i],
                                      overflow: TextOverflow.ellipsis),
                                ),
                            ],
                            rows: [
                              for (int i = 0; i < Sr_no.length; i++)
                                DataRow(
                                    cells: [
                                       DataCell(
                                        Text(Sr_no[i].toString()),
                                      ),
                                      DataCell(Text(Title[i],maxLines: 2,overflow: TextOverflow.ellipsis,),onTap: (){  blog_check_screen = '2';
                                      select_id = User_id[i];
                                      select_title = Title[i];
                                      setState(() {});}),
                                      DataCell(Text(Author_name[i]),onTap: (){  blog_check_screen = '2';
                                      select_id = User_id[i];
                                      select_title = Title[i];
                                      setState(() {});}),
                                      DataCell(SizedBox(
                                          width: MediaQuery.of(context).size.width/7,
                                          child: Text(Description[i],maxLines: 4,overflow: TextOverflow.ellipsis,),),onTap: (){  blog_check_screen = '2';
                                      select_id = User_id[i];
                                      select_title = Title[i];
                                      setState(() {});}),
                                      DataCell(Text(Date[i]),onTap: (){  blog_check_screen = '2';
                                      select_id = User_id[i];
                                      select_title = Title[i];
                                      setState(() {});}),
                                      DataCell(Text(Time[i]),onTap: (){  blog_check_screen = '2';
                                      select_id = User_id[i];
                                      select_title = Title[i];
                                      setState(() {});}),
                                      DataCell(Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                12,
                                            child: NavigateBtn(
                                              onPressed: () {
                                                blog_check_screen = '3';
                                                select_id = User_id[i];
                                                setState(() {});
                                              },
                                              text: 'Edit',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                12,
                                            child: custom_outlined_button(
                                              onPressed: () {
                                                action_button_click(User_id[i]);
                                              },
                                              text: 'Delete',
                                            ),
                                          )
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
                            ])),
                  ],
                ),
              ),
            if (blog_check_screen == '1')
              add_blog(                      /// Add Time
                appbar_Ontap: () {
                  blog_check_screen = '0';
                  get_Under_review_astro();
                  setState(() {});
                },
                select_user_id: '',
              ),
            if (blog_check_screen == '3')
              add_blog(                        /// Edit Time
              appbar_Ontap: () {
                blog_check_screen = '0';
                get_Under_review_astro();
                setState(() {});
              },
                edit_time_check: true,
              select_user_id: select_id,
            ),
            if (blog_check_screen == '2')
              Full_blog_screen(                  /// view  Time
                appbar_Ontap: () {
                  blog_check_screen = '0';
                  get_Under_review_astro();
                  setState(() {});
                },
                title_name: select_title,
                select_user_id: select_id,
              )
          ],
        ),
      ),
    ));
  }
}
