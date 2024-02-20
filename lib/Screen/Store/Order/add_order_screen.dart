
import 'package:flutter/material.dart';

import '../../../widget/CommonTextField.dart';
import '../../../widget/button/custom_outline_button.dart';
import '../../../widget/button/navigate_btn.dart';
import '../../../widget/common_screen_appbar.dart';

class add_order_screen extends StatefulWidget {
  final Function appbar_Ontap;
  final String select_user_id;
  final bool? edit_time_check;
  const add_order_screen({super.key,required this.select_user_id,this.edit_time_check,required this.appbar_Ontap});

  @override
  State<add_order_screen> createState() => _add_order_screenState();
}

class _add_order_screenState extends State<add_order_screen> {
  TextEditingController name_control=TextEditingController();
  TextEditingController category_control=TextEditingController();
  TextEditingController dis_price_control=TextEditingController();
  TextEditingController mrp_control=TextEditingController();
  TextEditingController no_stock_control=TextEditingController();
  TextEditingController description_control=TextEditingController();

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
                common_appbar(title_name: 'Add Order',
                  onTap: () {
                    widget.appbar_Ontap();
                  },
                ),
                const SizedBox(height: 30,),
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
                      child: const Icon(Icons.add,color:Color(0xFFFF9933) ,),
                    ),
                    const SizedBox(width: 30,),
                    SizedBox(
                      width: 100,
                      height: 34,
                      child: custom_outlined_button(
                        onPressed: () {
                          // action_button_click(User_id[i]);
                        },
                        text: 'Select Image',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40,),
                Container(
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
                        child:  Container(
                          width: 100,
                          child: NavigateBtn(
                            text: 'Add',
                            text_size: 'true',
                            onPressed: () {
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
                common_appbar(title_name: 'Edit Order',
                  onTap: () {
                    widget.appbar_Ontap();
                  },
                ),
                const SizedBox(height: 30,),
                Container(
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
                Container(
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
                        child:  Container(
                          width: 100,
                          child: NavigateBtn(
                            text: 'Submit',
                            text_size: 'true',
                            onPressed: () {
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

}



