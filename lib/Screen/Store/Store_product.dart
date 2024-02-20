
import 'package:admin_desktop/Screen/Store/product_details.dart';
import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../utils/app_locale.dart';
import '../../widget/SvgPictureWidgets.dart';
import '../../widget/button/navigate_btn.dart';
import '../../widget/loader/loader_file.dart';
import '../Dashboard/componets/card_counter.dart';
import 'add_product_screen.dart';

class Store_product extends StatefulWidget {
  const Store_product({super.key});

  @override
  State<Store_product> createState() => _Store_productState();
}

class _Store_productState extends State<Store_product> {
  List<String> list = ['Sort By', 'Date', 'Time', 'Activity', 'Status'];
  final yourScrollController = ScrollController();
  final table_scrollController = ScrollController();
  String product_check_screen='0';
  String select_user_id='';
  List<String> blog_heading_item = [
    '',
    'ID Code',
    'Product name',
    'Category',
    'MRP ',
    'Discounted price',
    'Status',
    'Instock',
    'Action',
  ];


  @override
  void initState() {
    // TODO: implement initState
    get_Store_product_astro();
    super.initState();
  }

  List Sr_no=[];
  List  productId=[];
  List  mainImage=[];
  List  productTitle=[];
  List  category=[];
  List  MRP=[];
  List  discountPrice=[];
  List  uqnic_product_id=[];
  List  stocksAvailable=[];
  List  Status=[];
  List  Action=[];


  Future<void> get_Store_product_astro() async {
    loader_file().show_loader();
    final user_response = await Network_data().get_Store_productList();
    if(user_response!=null){
      if(user_response['status']=='success'){
        Sr_no=[];
        productId=[];
        productTitle=[];
        mainImage=[];
        category=[];
        MRP=[];
        discountPrice=[];
        uqnic_product_id=[];
        stocksAvailable=[];
        Status=[];
        Action=[];
        for(int i=0;i<user_response['products'].length;i++){
          Sr_no.add(i+1);
          productId.add(user_response['products'][i]['productId']??'');
          uqnic_product_id.add(user_response['products'][i]['_id'].toString());
          mainImage.add(user_response['products'][i]['mainImage']);
          productTitle.add(user_response['products'][i]['productTitle']??'');
          // print("DDd");
          // var cate=user_response['products'][i]['category'];
          // print(cate);
          category.add(user_response['products'][i]['category']['name'].toString()??'');
          MRP.add(user_response['products'][i]['MRP'].toString());
          discountPrice.add(user_response['products'][i]['discountPrice'].toString());
          stocksAvailable.add(user_response['products'][i]['stocksAvailable'].toString());
          Status.add('Pending');
          Action.add('1');
        }
      }
    }
    setState(() {});
    loader_file().dismiss_loader();
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
              if(product_check_screen=='0')
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
                          'Product',
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
                              title_name: 'Total Product',
                              counter_number: productId.length.toString(),
                              img_name: AppImages.product_1,
                            ),
                            // card_counter(
                            //   title_name: 'In stock',
                            //   counter_number: '200',
                            //   img_name: AppImages.product_2,
                            // ),
                            // card_counter(
                            //   title_name: 'Product View',
                            //   counter_number: '100',
                            //   img_name: AppImages.product_3,
                            // ),
                            // card_counter(
                            //   title_name: 'Delete product',
                            //   counter_number: '100',
                            //   img_name: AppImages.product_4,
                            // ),
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
                                text: 'Add Product',
                                text_size: 'true',
                                onPressed: () {
                                  product_check_screen='3';
                                  select_user_id='';
                                  setState(() {});
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Scrollbar(
                          controller: table_scrollController,
                          isAlwaysShown: productId.isNotEmpty?true:false,
                          showTrackOnHover: false,
                          hoverThickness:80.0,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: table_scrollController,
                            child: SizedBox(
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
                                  // horizontalMargin: 60,
                                  columns: [
                                    for (int i = 0; i < blog_heading_item.length; i++)
                                      DataColumn(
                                        label: Text(blog_heading_item[i],
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                  ],
                                  rows: [
                                    for (int i = 0; i < productId.length; i++)
                                      DataRow(cells: [
                                        DataCell(Container(
                                          width: 40,
                                          height: 40,
                                          child: svgpicture().Img_network(mainImage[i]),
                                        )),
                                        DataCell(Text(productId[i],),onTap: (){
                                          product_check_screen='1';
                                          select_user_id=uqnic_product_id[i];
                                          setState(() {});
                                        }),
                                        DataCell(Text(productTitle[i],),onTap: (){
                                          product_check_screen='1';
                                          select_user_id=uqnic_product_id[i];
                                          setState(() {});
                                        }),
                                        DataCell(SizedBox(
                                            width: MediaQuery.of(context).size.width/15,
                                            child: Text(category[i],overflow: TextOverflow.ellipsis,)),onTap: (){
                                          product_check_screen='1';
                                          select_user_id=uqnic_product_id[i];
                                          setState(() {});
                                        }),
                                        DataCell(Text(MRP[i],),onTap: (){
                                          product_check_screen='1';
                                          select_user_id=uqnic_product_id[i];
                                          setState(() {});
                                        }),
                                        DataCell(Text(discountPrice[i]),onTap: (){
                                          product_check_screen='1';
                                          select_user_id=uqnic_product_id[i];
                                          setState(() {});
                                        }),
                                        DataCell(Text(Status[i],),onTap: (){
                                          product_check_screen='1';
                                          select_user_id=uqnic_product_id[i];
                                          setState(() {});
                                        }),
                                        DataCell(Text(stocksAvailable[i],),onTap: (){
                                          product_check_screen='1';
                                          select_user_id=uqnic_product_id[i];
                                          setState(() {});
                                        }),
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
                                                  product_check_screen='2';
                                                  select_user_id=uqnic_product_id[i];
                                                  setState(() {});
                                                },
                                                text: 'Edit',
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 20,
                                            // ),
                                            // SizedBox(
                                            //   width:
                                            //       MediaQuery.of(context).size.width /
                                            //           12,
                                            //   child: custom_outlined_button(
                                            //     onPressed: () {
                                            //       // action_button_click(User_id[i]);
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
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              if(product_check_screen=='1')
                product_details(
                  select_user_id:select_user_id,
                  appbar_Ontap: (){
                    product_check_screen='0';
                    get_Store_product_astro();
                    setState(() {});
                  },
                ),
              if(product_check_screen=='2')
                add_Product_screen(             /// Edit Time
                  select_user_id: select_user_id,
                  edit_time_check: true,
                  appbar_Ontap: (){
                    product_check_screen='0';
                    get_Store_product_astro();
                    setState(() {});
                  },
                ),
              if(product_check_screen=='3')
                add_Product_screen(             /// ADD Time
                  select_user_id: '',
                  appbar_Ontap: (){
                    product_check_screen='0';
                    get_Store_product_astro();
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
