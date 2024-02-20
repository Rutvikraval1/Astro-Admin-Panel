import 'package:admin_desktop/utils/app_locale.dart';
import 'package:admin_desktop/widget/SvgPictureWidgets.dart';
import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../widget/common_screen_appbar.dart';
import '../../widget/loader/loader_file.dart';
import '../Dashboard/componets/card_counter.dart';
import 'componets/common_datatable.dart';
import 'componets/profile_card_view.dart';
import 'componets/user_profile_card.dart';

class User_profile_view extends StatefulWidget {
  final Function appbar_Ontap;
  final String select_user_id;
  const User_profile_view({super.key,required this.appbar_Ontap,required this.select_user_id});

  @override
  State<User_profile_view> createState() => _User_profile_viewState();
}

class _User_profile_viewState extends State<User_profile_view> {
  List<String> list=['Sort By','Date','Time','Activity'];
  List<String> Consultation_heading_item=[
    'Sr. no',
    'Astrologer Name',
    'Consult type',
    'Date',
    'Time',
    'Time taken',
    'Charge taken',
    'Feedback given'
  ];
  List<String> Consultation_row_value=[
    // '1',
    // 'Sheetal Shukla',
    // 'Chat',
    // '05/06/2023',
    // '12:45 pm',
    // '5 min',
    // '5 min',
    // 'Lorem ipsum dolor sit amet consectetur. ',
  ];
  List Saved_heading_item=[
    'Sr. no',
    'Name',
    'Gender',
    'DOB',
    'TOB',
    'POB',
    'Martial status',
    'Occupation',
    'Concern'
  ];
  List Saved_heading_value=[
    // '1',
    // 'Sheetal Shukla',
    // 'Female',
    // '05/06/2023',
    // '12:45 pm',
    // 'Jaipur,Rajasthan',
    // 'Married',
    // 'Engineer',
    // 'Lorem ipsum dolor sit amet consectetur. ',
  ];
  List Order_item=[
    'Sr. no',
    'Name',
    'Item',
    'Date',
    'Order ID',
    'Tracking ID',
    'Status',
    'Receive on',
    'Address'
  ];
  List Order_value=[
    // '1',
    // 'Sheetal Shukla',
    // 'Female',
    // '05/06/2023',
    // '12:45 pm',
    // 'Jaipur,Rajasthan',
    // 'Married',
    // 'Engineer',
    // 'Lorem ipsum dolor sit amet consectetur. ',
  ];

  @override
  void initState() {
    // TODO: implement initState
    print('select_user_id');
    print(widget.select_user_id);
    get_user_details();
    super.initState();
  }
  String user_name='';
  String user_mobileNumber='';
  String user_age='';
  String user_gender='';
  String user_currentAddress='';
  Future<void> get_user_details() async {
    loader_file().show_loader();
    final userdetails_response = await Network_data().get_user_details(widget.select_user_id);
    if(userdetails_response!=null){
      if(userdetails_response['status']){
        user_name= userdetails_response['user']['name'].toString();
        user_mobileNumber=userdetails_response['user']['mobileNumber'].toString();
        user_age= userdetails_response['user']['age'].toString();
        user_gender=userdetails_response['user']['gender'].toString();
        user_currentAddress='${userdetails_response['user']['currentAddress'].toString()},${userdetails_response['user']['city'].toString()}, '
            '${userdetails_response['user']['state'].toString()}, ${userdetails_response['user']['country'].toString()}, ${userdetails_response['user']['pincode'].toString()}.';
      }
      setState(() {});
    }
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
              common_appbar(title_name: 'View profile',
                onTap: () {
                  widget.appbar_Ontap();
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   profile_card_view(
                     mobile_number: user_mobileNumber,
                     user_name:user_name ,
                     // img_name: '',
                     delete_button: (){},
                   ),
                  SizedBox(width: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Text(
                        'Age : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        user_age??'',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 25,),
                      Text(
                        'Gender : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        user_gender??'',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 25,),
                      Text(
                        'Address : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        user_currentAddress??'',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Consultation : ',
                    style: TextStyle(
                      color: Color(0xFF954A00),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  DropdownMenu<String>(
                    initialSelection: list.first,
                    inputDecorationTheme: InputDecorationTheme(

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),),
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
                    dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 18,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: common_datatable(heading_data:Consultation_heading_item,row_data: Consultation_row_value,)),
              const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Saved Data : ',
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

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),),
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
                    dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 18,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: common_datatable(heading_data:Consultation_heading_item,row_data: Consultation_row_value,)),
              const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order : ',
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

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),),
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
                    dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 18,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: common_datatable(heading_data:Order_item,row_data: Order_value,)),

              // DataTable(
              //     dataRowColor: MaterialStateProperty.all(Colors.white),
              //     headingRowColor: MaterialStateProperty.all(const Color(0xffFF9933)),
              //     headingTextStyle:  const TextStyle(
              //       color: Colors.white,
              //       fontSize: 12,
              //       fontFamily: 'Inter',
              //       fontWeight: FontWeight.w500,
              //     ),
              //     headingRowHeight: 45,
              //     dataTextStyle: const TextStyle(
              //       color: Color(0xFF5C5C5C),
              //       fontSize: 11,
              //       fontFamily: 'Inter',
              //       fontWeight: FontWeight.w400,
              //     ),
              //     columns: const [
              //       DataColumn(
              //         label: Text( 'Sr. no',overflow: TextOverflow.ellipsis),
              //       ),
              //       DataColumn(
              //         label: Text('Name',overflow: TextOverflow.ellipsis),
              //       ),
              //       DataColumn(
              //         label: Text('Item',overflow: TextOverflow.ellipsis),
              //       ),
              //       DataColumn(
              //         label: Text('Date',overflow: TextOverflow.ellipsis),
              //       ),
              //       DataColumn(
              //         label: Text('Order ID',overflow: TextOverflow.ellipsis),
              //       ),
              //       DataColumn(
              //         label: Text('Tracking ID',overflow: TextOverflow.ellipsis),
              //       ),
              //       DataColumn(
              //         label: Text('Status',overflow: TextOverflow.ellipsis),
              //       ),
              //       DataColumn(
              //         label: Text('Receive on',overflow: TextOverflow.ellipsis),
              //       ),
              //       DataColumn(
              //         label: Text('Address',overflow: TextOverflow.ellipsis),
              //       ),
              //     ],
              //     rows: [
              //       for(int i=0;i<5;i++)
              //         const DataRow(cells: [
              //           DataCell(Text('1')),
              //           DataCell(Text('Sheetal Shukla')),
              //           DataCell(Text('Female')),
              //           DataCell(Text('05/06/2023')),
              //           DataCell(Text('12:45 pm')),
              //           DataCell(Text('Jaipur,Rajasthan')),
              //           DataCell(Text('Married')),
              //           DataCell(Text('Engineer')),
              //           DataCell(Text('Lorem ipsum dolor sit amet consectetur. ')),
              //         ])
              //     ])
        ]),
      ),
    ));
  }
}
