
import 'package:flutter/material.dart';

import '../../../utils/app_locale.dart';
import '../../../widget/button/custom_outline_button.dart';
import '../../../widget/button/navigate_btn.dart';
import '../../Dashboard/componets/card_counter.dart';
import 'add_order_screen.dart';

class Order_dashboard extends StatefulWidget {
  const Order_dashboard({super.key});

  @override
  State<Order_dashboard> createState() => _Order_dashboardState();
}

class _Order_dashboardState extends State<Order_dashboard> {
  List<String> list = ['Sort By', 'Date', 'Time', 'Activity', 'Status'];
  final yourScrollController = ScrollController();
  final table_scrollController = ScrollController();
  String order_check_screen = '0';
  List<String> Order_heading_item = [
    'Sr. no',
    'Order ID',
    'Customer name',
    'Product',
    'Date of order',
    'Date of Delivery',
    'Price',
    'Status',
    'Address',
    'Action',
  ];

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
              if(order_check_screen=='0')
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
                            'Order',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              card_counter(
                                title_name: 'Total Order',
                                counter_number: '100',
                                img_name: AppImages.product_1,
                              ),
                              card_counter(
                                title_name: 'Delivered Order',
                                counter_number: '200',
                                img_name: AppImages.product_2,
                              ),
                              card_counter(
                                title_name: 'Pending Order',
                                counter_number: '100',
                                img_name: AppImages.product_3,
                              ),
                              card_counter(
                                title_name: 'Cancel Order',
                                counter_number: '100',
                                img_name: AppImages.product_4,
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
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
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: 135,
                                height: 45,
                                child: NavigateBtn(
                                  text: 'Add Order',
                                  text_size: 'true',
                                  onPressed: () {
                                    order_check_screen='1';
                                    setState(() {});
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                              // width: MediaQuery.of(context).size.width,
                              child: Scrollbar(
                                controller: table_scrollController,
                                isAlwaysShown: true,
                                showTrackOnHover: false,
                                hoverThickness: 80.0,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: table_scrollController,
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
                                      columns: [
                                        for (int i = 0; i < Order_heading_item.length; i++)
                                          DataColumn(
                                            label: Text(Order_heading_item[i],
                                                overflow: TextOverflow.ellipsis),
                                          ),
                                      ],
                                      rows: [
                                        for (int i = 0; i < 4; i++)
                                          DataRow(cells: [
                                            DataCell(Text( '1',)),
                                            DataCell(Text( '#125456',)),
                                            DataCell(Text('Sheetal Shukla',)),
                                            DataCell(Text('Lorem ipsum dolo',)),
                                            DataCell(Text('12/18/2023',)),
                                            DataCell(Text('12/18/2023')),
                                            DataCell(Text('Rs 200',)),
                                            DataCell(Text( 'Pending',)),
                                            DataCell(Text( 'Lorem ipsum dolor sit amet\n consectetur. Pulvinar ',)),
                                            DataCell(Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width:
                                                  MediaQuery.of(context).size.width /
                                                      12,
                                                  child: NavigateBtn(
                                                    onPressed: () {
                                                      order_check_screen='2';
                                                      setState(() {});
                                                    },
                                                    text: 'Edit',
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                SizedBox(
                                                  width:
                                                      MediaQuery.of(context).size.width /
                                                          12,
                                                  child: custom_outlined_button(
                                                    onPressed: () {
                                                      // action_button_click(User_id[i]);
                                                    },
                                                    text: 'Delete',
                                                  ),
                                                )
                                              ],
                                            )),
                                          ]),
                                      ]),
                                ),
                              )),
                        ],
                      ),
                    ),

                  ],
                ),
              if(order_check_screen=='1')             /// Add Time
                add_order_screen(
                  select_user_id: '',
                  appbar_Ontap: (){
                    order_check_screen='0';
                    setState(() {});
                  },
                ),
              if(order_check_screen=='2')                 /// Edit Time
                add_order_screen(
                  select_user_id: '',
                  edit_time_check: true,
                  appbar_Ontap: (){
                    order_check_screen='0';
                    setState(() {});
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
