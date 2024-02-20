import 'package:admin_desktop/Screen/User_screen/user_profile_view.dart';
import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../utils/app_locale.dart';
import '../../widget/SvgPictureWidgets.dart';
import '../../widget/common_screen_appbar.dart';
import '../../widget/loader/loader_file.dart';
import '../Dashboard/componets/card_counter.dart';
import 'componets/user_profile_card.dart';

class user_screen extends StatefulWidget {
  const user_screen({super.key});

  @override
  State<user_screen> createState() => _user_screenState();
}

class _user_screenState extends State<user_screen> {
  List<String> list=['Sort By','Date','Time','Activity'];
  bool user_profile_check=false;
  String  select_user_id='';
  List get_all_user_list=[];

  @override
  void initState() {
    // TODO: implement initState
    get_total_user_number();
    get_allusers();
    super.initState();
  }
  String get_total_user='';
  Future<void> get_total_user_number() async {
    loader_file().show_loader();
    final user_response = await Network_data().get_usersregistered();
    if(user_response!=null){
      if(user_response['status']){
        get_total_user=user_response['numberOfUsers'].toString()??'';
      }
    }
    setState(() {});
  }
  Future<void> get_allusers() async {
    final get_allusers_response = await Network_data().get_allusers();
    if(get_allusers_response!=null){
      if(get_allusers_response['status']){
        get_all_user_list=get_allusers_response['users'];
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
            if(!user_profile_check)
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
                          'All Registered Users',
                          style: TextStyle(
                            color: Color(0xFF954A00),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4,),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            card_counter(
                              title_name: 'Total Registered Users',
                              counter_number: get_total_user,
                              img_name: AppImages.person_img_icon,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 24,top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownMenu<String>(
                        initialSelection: list.first,
                        inputDecorationTheme: InputDecorationTheme(

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),),
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
                        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),
                      // SizedBox(width: 20,),
                      // Container(
                      //   width: 100,
                      //   height: 45,
                      //   decoration: ShapeDecoration(
                      //     gradient: const LinearGradient(
                      //       begin: Alignment(0.00, -1.00),
                      //       end: Alignment(0, 1),
                      //       colors: [Color(0xFFFF9933), Color(0xFFF47B03)],
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //       side: BorderSide(width: 1, color: Color(0xFFFF9933)),
                      //       borderRadius: BorderRadius.circular(2),
                      //     ),
                      //   ),
                      //   alignment: Alignment.center,
                      //   child: const Text(
                      //     'Add User',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 13,
                      //       fontFamily: 'Arial',
                      //       fontWeight: FontWeight.w700,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 15
                      ),
                      itemCount: get_all_user_list.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return   User_profile_card(
                          img_name: get_all_user_list[index][''],
                          view_ontap: (){
                            select_user_id=get_all_user_list[index]['_id'];
                            user_profile_check=true;
                            setState(() {});

                          },
                          user_name:get_all_user_list[index]['name'],
                          mobile_number: get_all_user_list[index]['mobileNumber'],
                        );
                      }),
                ),
              ],
            ),
            if(user_profile_check)
              User_profile_view(
    select_user_id: select_user_id,
    appbar_Ontap: (){
                user_profile_check = false;
                setState(() {});
              })


          ],
        )),
      ),
    );
  }
}
