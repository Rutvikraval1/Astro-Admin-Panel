import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../utils/app_locale.dart';
import '../../widget/SvgPictureWidgets.dart';
import '../../widget/common_screen_appbar.dart';
import '../../widget/loader/loader_file.dart';
import '../Dashboard/componets/card_counter.dart';
import '../Interview/interview_dashboard.dart';
import '../User_screen/componets/user_profile_card.dart';
import 'astrologer_profile_view.dart';

class astrologer_screen extends StatefulWidget {
  const astrologer_screen({super.key});

  @override
  State<astrologer_screen> createState() => _astrologer_screenState();
}

class _astrologer_screenState extends State<astrologer_screen> {
  List<String> list=['Sort By','Date','Time','Activity','Status'];
  bool astro_profile_check = false;
  String  select_astro_id='';
  List get_all_astro_list=[];


  @override
  void initState() {
    // TODO: implement initState
    get_total_astro_number();
    get_allastro();
    super.initState();
  }
  String get_total_astro='';
  Future<void> get_total_astro_number() async {
    loader_file().show_loader();
    final user_response = await Network_data().get_astrologersregistered();
    if(user_response!=null){
      if(user_response['status']){
        get_total_astro=user_response['totalAstrologers'].toString()??'';
      }
    }
    setState(() {});
  }
  Future<void> get_allastro() async {
    final get_allusers_response = await Network_data().get_allastro();
    if(get_allusers_response!=null){
      if(get_allusers_response['status']){
        get_all_astro_list=get_allusers_response['astrologers'];
      }
    }
    setState(() {});
    loader_file().dismiss_loader();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!astro_profile_check)
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                          ),
                        ),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Astrologers',
                              style: TextStyle(
                                color: Color(0xFF954A00),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // const SizedBox(
                            //   height: 4,
                            // ),
                            // const Text(
                            //   'Lorem ipsum dolor sit amet consectetur.',
                            //   style: TextStyle(
                            //     color: Color(0xFF5A5A5A),
                            //     fontSize: 14,
                            //     fontFamily: 'Poppins',
                            //     fontWeight: FontWeight.w400,
                            //     height: 0,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                card_counter(
                                  title_name: 'Total Registered Astrologers',
                                  counter_number: get_total_astro,
                                  img_name: AppImages.person_img_icon,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24, top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                              dropdownMenuEntries: list
                                  .map<DropdownMenuEntry<String>>((String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 15),
                            itemCount: get_all_astro_list.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return User_profile_card(
                                img_name: get_all_astro_list[index][''],
                                view_ontap: (){
                                  select_astro_id=get_all_astro_list[index]['_id'];
                                  astro_profile_check=true;
                                  setState(() {});

                                },
                                user_name:get_all_astro_list[index]['fullName'],
                                mobile_number: get_all_astro_list[index]['mobileNumber'],
                              );
                            }),
                      ),
                    ],
                  ),
                if (astro_profile_check)
                  astrologer_profile_view(
                      select_user_id: select_astro_id,
                      appbar_Ontap: (){
                    astro_profile_check = false;
                    setState(() {});
                  })
              ],
            )),
      ),
    );
  }
}
