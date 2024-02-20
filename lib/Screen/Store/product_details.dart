import 'package:flutter/material.dart';

import '../../Service/network_file.dart';
import '../../widget/CommonTextField.dart';
import '../../widget/SvgPictureWidgets.dart';
import '../../widget/button/custom_outline_button.dart';
import '../../widget/button/navigate_btn.dart';
import '../../widget/common_screen_appbar.dart';
import '../../widget/loader/loader_file.dart';
import 'add_product_screen.dart';

class product_details extends StatefulWidget {
  final Function appbar_Ontap;
  final String select_user_id;
  const product_details(
      {super.key, required this.appbar_Ontap, required this.select_user_id});

  @override
  State<product_details> createState() => _product_detailsState();
}

class _product_detailsState extends State<product_details> {

  final yourScrollController = ScrollController();
  String product_check_screen='0';
  String testfile ='';
  @override
  void initState() {
    // TODO: implement initState
    print(widget.select_user_id);
    getblog_details_astro();
    super.initState();
  }

  String productTitle='';
  String discountPrice='';
  String MRP='';
  String category='';
  String stocksAvailable='';
  String product_id='';
  String mainImage='';
  List   otherImages=[];

  Future<void> getblog_details_astro() async {
    loader_file().show_loader();
    final user_response = await Network_data().getStore_product_details(user_id:widget.select_user_id );
    if(user_response!=null){
      if(user_response['status']=='success'){
        productTitle=user_response['product']['productTitle']??'';
        discountPrice=user_response['product']['discountPrice'].toString()??'';
        MRP=user_response['product']['MRP'].toString()??'';
        category=user_response['product']['category']['name'].toString()??'';
        stocksAvailable=user_response['product']['stocksAvailable'].toString()??'';
        product_id=user_response['product']['_id'].toString()??'';
        mainImage=user_response['product']['mainImage']??'';
        testfile=user_response['product']['productDescription']??'';
        otherImages=user_response['product']['otherImages']??'';
      }
      // authorName=user_response['products']['authorName'];
      // createdAt=user_response['products']['dateofCreation'];
      // content=user_response['products']['content'];
      // check_img=true;
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
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              if(product_check_screen=='0')
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  common_appbar(
                    title_name: 'Product Detail',
                    onTap: () {
                      widget.appbar_Ontap();
                    },
                  ),
                  Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4.5,
                            height: MediaQuery.of(context).size.height / 3,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFDDDDDD)),
                                borderRadius: BorderRadius.circular(5),
                              ),

                            ),
                            child: svgpicture().Img_network(mainImage),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child:  Text(
                                    productTitle??'',
                                  style: TextStyle(
                                    color: Color(0xFF954A00),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                   Text(
                                    'Discounted price :',
                                    style: TextStyle(
                                      color: Color(0xFF6C6C6C),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                   Text(
                                     discountPrice??'',
                                    style: TextStyle(
                                      color: Color(0xFF954A00),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Text(
                                    'MRP :',
                                    style: TextStyle(
                                      color: Color(0xFF6C6C6C),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                   Text(
                                    MRP??'',
                                    style: TextStyle(
                                      color: Color(0xFF954A00),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Category :',
                                    style: TextStyle(
                                      color: Color(0xFF6C6C6C),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                   Text(
                                     category??'',
                                    style: TextStyle(
                                      color: Color(0xFF954A00),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'No. of stock :',
                                    style: TextStyle(
                                      color: Color(0xFF6C6C6C),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                   Text(
                                    stocksAvailable??'',
                                    style: TextStyle(
                                      color: Color(0xFF954A00),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Positioned(
                          right: 0,
                          top: 80,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment:
                            // CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 12,
                                child: NavigateBtn(
                                  onPressed: () {
                                    product_check_screen='1';
                                    setState(() {});
                                  },
                                  text: 'Edit',
                                ),
                              ),
                              SizedBox(
                                height: 20,
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
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4.5,
                    height:MediaQuery.of(context).size.height / 9 ,
                    child: ListView.builder(
                      itemCount: otherImages.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 16,
                            height: MediaQuery.of(context).size.height / 9,
                            decoration: ShapeDecoration(
                              // image: const DecorationImage(
                              //   image:
                              //       NetworkImage("https://via.placeholder.com/82x78"),
                              //   fit: BoxFit.fill,
                              // ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFDDDDDD)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: svgpicture().Img_network(otherImages[index]),
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description : ',
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
                                context: context,
                                text_widget: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                      testfile,
                                    style: TextStyle(
                                      color: Color(0xFF5C5C5C),
                                      fontSize: 13,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                    ],
                  ),
                ],
              ),
              if(product_check_screen=='1')
                add_Product_screen(             /// Edit Time
                  select_user_id: widget.select_user_id,
                  edit_time_check: true,
                  appbar_Ontap: (){
                    product_check_screen='0';
                    getblog_details_astro();
                    setState(() {});
                  },
                ),
            ],
          ),
        ),
      ),
    ));
  }
}

Widget container_widget(
    {required Widget text_widget, required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).size.height / 3,
    width: MediaQuery.of(context).size.width,
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
