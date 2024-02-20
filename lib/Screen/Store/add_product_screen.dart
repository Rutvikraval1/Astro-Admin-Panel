
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../widget/CommonTextField.dart';
import '../../../widget/button/custom_outline_button.dart';
import '../../../widget/button/navigate_btn.dart';
import '../../../widget/common_screen_appbar.dart';
import '../../Service/network_file.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/loader/loader_file.dart';
import '../../widget/pick_image_file.dart';

class add_Product_screen extends StatefulWidget {
  final Function appbar_Ontap;
  final String select_user_id;
  final bool? edit_time_check;
  const add_Product_screen({super.key,required this.select_user_id,this.edit_time_check,required this.appbar_Ontap});

  @override
  State<add_Product_screen> createState() => _add_Product_screenState();
}

class _add_Product_screenState extends State<add_Product_screen> {
  TextEditingController name_control=TextEditingController();
  TextEditingController category_control=TextEditingController();
  TextEditingController dis_price_control=TextEditingController();
  TextEditingController mrp_control=TextEditingController();
  TextEditingController no_stock_control=TextEditingController();
  TextEditingController description_control=TextEditingController();

  String mainImage='';
  List  set_otherImages=[];
  List<File>  otherImages_path=[];

  @override
  void initState() {
    // TODO: implement initState
    if(widget.edit_time_check!=null){
      get_update_product_details();
    }
    super.initState();
  }
  List product_network_img=[];
  Future<void> get_update_product_details() async {
    loader_file().show_loader();
    final user_response = await Network_data().getStore_product_details(user_id:widget.select_user_id );
    if (user_response != null) {
      if(user_response['status']=='success'){
        name_control.text=user_response['product']['productTitle'];
        dis_price_control.text=user_response['product']['discountPrice'].toString()??'';
        mrp_control.text=user_response['product']['MRP'].toString()??'';
        category_control.text=user_response['product']['category']['name'].toString()??'';
        no_stock_control.text=user_response['product']['stocksAvailable'].toString()??'';
        description_control.text=user_response['product']['productDescription']??'';
        product_network_img=user_response['product']['otherImages']??'';
        mainImage=user_response['product']['mainImage']??'';
      }
    }
    setState(() {});
    loader_file().dismiss_loader();
  }








  Future<void> add_product_astro() async {
    loader_file().show_loader();

    final user_response = await Network_data().add_Store_product_astro(
      category: category_control.text ,
      discountPrice: dis_price_control.text ,
      mainImage: mainImage,
      MRP:mrp_control.text  ,
      otherImages_path:set_otherImages ,
      productDescription: description_control.text ,
      productTitle:name_control.text ,
      stocksAvailable:no_stock_control.text,
    );
    print('user_response');
    print(user_response);
    if(user_response!=null){
      Flutter_toast_mes().Error_Message(user_response['message']);
      // if(user_response['success']=='01'){
      //
      // }

    }
    set_otherImages=[];
    otherImages_path=[];
    setState(() {});
    loader_file().dismiss_loader();
    name_control.clear();
    category_control.clear();
    dis_price_control.clear();
    mrp_control.clear();
    no_stock_control.clear();
    description_control.clear();

  }


  Future<void> edit_update_product_astro() async {
    loader_file().show_loader();

    final user_response = await Network_data().Edit_Store_product_astro(
      category: category_control.text ,
      discountPrice: dis_price_control.text ,
      mainImage: mainImage,
      MRP:mrp_control.text  ,user_id: widget.select_user_id,
      otherImages_path:set_otherImages ,
      productDescription: description_control.text ,
      productTitle:name_control.text ,
      stocksAvailable:no_stock_control.text,
    );
    print('user_response');
    print(user_response);
    if(user_response!=null){
      Flutter_toast_mes().Error_Message(user_response['message']);

    }
    loader_file().dismiss_loader();

  }





  @override
  Widget build(BuildContext context) {
    if(widget.edit_time_check==null){
      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                common_appbar(title_name: 'Add Product',
                  onTap: () {
                    widget.appbar_Ontap();
                  },
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    otherImages_path.isNotEmpty?SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: otherImages_path.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            Row(
                              children: [
                                Container(
                                    width: 70,
                                    height: 70,
                                    decoration: const ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1, color: Color(0xFFFF9933)),
                                      ),
                                    ),
                                    child:Image.file(otherImages_path[index])
                                ),
                                SizedBox(width: 20,)
                              ],
                            ),
                      ),
                    ):
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFFF9933)),
                        ),
                      ),
                      child: const Icon(Icons.add,color:Color(0xFFFF9933) ,),
                    ),
                    const SizedBox(width: 30,),
                    SizedBox(
                      width: 100,
                      height: 34,
                      child: custom_outlined_button(
                        onPressed: () {
                          Pick_file_main_image();
                        },
                        text: 'Select Image',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40,),
                SizedBox(
                  width:MediaQuery.of(context).size.width / 1.6,
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
                                        controller: name_control))
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
                                  'Category : ',
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
                                        controller: category_control))
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
                                  'Discounted Price : ',
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
                                        controller: dis_price_control))
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
                                  'MRP : ',
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
                                        controller: mrp_control))
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
                                  'No. of Stock : ',
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
                                        controller: no_stock_control))
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                          const Flexible(
                              flex: 1,
                              child:SizedBox()
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
                                    height_check: 'true',
                                    text_widget: CommonTextField.textField(maxLines_check: 'true',
                                        controller: description_control))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child:  SizedBox(
                          width: 100,
                          child: NavigateBtn(
                            text: 'Add',
                            text_size: 'true',
                            onPressed: () {
                              if(mainImage!=''){
                                add_product_astro();
                              }else{
                                Flutter_toast_mes().Error_Message('Please select Photo');
                              }

                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }else{
      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                common_appbar(title_name: 'Edit Product',
                  onTap: () {
                    widget.appbar_Ontap();
                  },
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        Row(
                          children: [
                            Container(
                                width: 70,
                                height: 70,
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1, color: Color(0xFFFF9933)),
                                  ),
                                ),
                                child:Image.network('https://via.placeholder.com/70x70')
                            ),
                            SizedBox(width: 20,)
                          ],
                        ),
                  ),
                ),
                const SizedBox(height: 40,),
                SizedBox(
                  width:MediaQuery.of(context).size.width / 1.6,
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
                                        controller: name_control))
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
                                  'Category : ',
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
                                        controller: category_control))
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
                                  'Discounted Price : ',
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
                                        controller: dis_price_control))
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
                                  'MRP : ',
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
                                        controller: mrp_control))
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
                                  'No. of Stock : ',
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
                                        controller: no_stock_control))
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                          const Flexible(
                              flex: 1,
                              child:SizedBox()
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
                                    height_check: 'true',
                                    text_widget: CommonTextField.textField(maxLines_check: 'true',
                                        controller: description_control))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child:  SizedBox(
                          width: 100,
                          child: NavigateBtn(
                            text: 'Submit',
                            text_size: 'true',
                            onPressed: () {
                              edit_update_product_astro();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }








  Widget container_widget({required Widget text_widget,String? height_check}) {
    return Container(
      height: height_check==null?40:MediaQuery.of(context).size.height/3,
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

  Future<void> Pick_file_main_image() async {
    final img=await Pick_image().imgFromGallery();
    set_otherImages.add(img?.path);
      otherImages_path.add(img);
    mainImage= set_otherImages.first??'';
    setState(() {});
  }

}



