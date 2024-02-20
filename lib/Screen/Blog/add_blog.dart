import 'dart:io';

import 'package:flutter/material.dart';
import '../../Service/network_file.dart';
import '../../widget/CommonTextField.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/button/navigate_btn.dart';
import '../../widget/common_screen_appbar.dart';
import '../../widget/loader/loader_file.dart';
import '../../widget/pick_image_file.dart';

class add_blog extends StatefulWidget {
  final Function appbar_Ontap;
  final String select_user_id;
  final bool? edit_time_check;
  const add_blog({super.key,required this.appbar_Ontap,this.edit_time_check,required this.select_user_id});

  @override
  State<add_blog> createState() => _add_blogState();
}

class _add_blogState extends State<add_blog> {
  TextEditingController Title_contro = TextEditingController();
  TextEditingController Blog_topic_contro = TextEditingController();
  // TextEditingController Author_image_contro = TextEditingController();
  TextEditingController Blog_contro = TextEditingController();
  File? main_img;
  File? additional_img;
  String isDraft='';
  List pick_img_list=[];

  @override
  void initState() {
    // TODO: implement initState
    if(widget.edit_time_check!=null){
      get_update_blog_details();
    }
    super.initState();
  }

  List network_img=[];

  Future<void> get_update_blog_details() async {
    loader_file().show_loader();
    final user_response = await Network_data().get_Blogs_details(user_id: widget.select_user_id);
    if (user_response != null) {
      Title_contro.text=user_response['blog']['title']??'';
      Blog_topic_contro.text=user_response['blog']['authorName']??'';
      Blog_contro.text=user_response['blog']['content']??'';
      isDraft=user_response['blog']['isDraft'].toString()??'';
      network_img=user_response['blog']['images']??'';
      print('network_img');
      print(network_img);
    }
    setState(() {});
    loader_file().dismiss_loader();
  }

  Future<void> add_blog_astro() async {
    loader_file().show_loader();
    final user_response = await Network_data().add_blog_astro(
      authorName: Blog_topic_contro.text,
      content: Blog_contro.text,
      title: Title_contro.text,
      images_path: pick_img_list,    );
    print('user_response');
    print(user_response);
    if(user_response!=null){
      if(user_response['success']=='01'){
        Flutter_toast_mes().Error_Message(user_response['message']);
      }

    }
    pick_img_list=[];
    setState(() {});
    loader_file().dismiss_loader();
    Title_contro.clear();
    Blog_contro.clear();
    Blog_topic_contro.clear();

  }

  Future<void> edit_update_blog_astro() async {
    loader_file().show_loader();
    final user_response = await Network_data().Edit_update_blog_astro(
      user_id:  widget.select_user_id,
      authorName: Blog_topic_contro.text,
      content: Blog_contro.text,
      title: Title_contro.text,
      images_path: network_img,);
    print('user_response');
    print(user_response);
    if(user_response!=null){
      if(user_response['success']=='01'){
        Flutter_toast_mes().Error_Message(user_response['message']);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    if(widget.edit_time_check==null){
      return    SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                common_appbar(title_name: 'Add blog',
                  onTap: () {
                    widget.appbar_Ontap();
                  },
                ),
                const SizedBox(height: 30,),
                const Text(
                  'Title : ',
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
                        controller: Title_contro)),
                const SizedBox(height: 30,),
                const Text(
                  ' Blog topic : ',
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
                        controller: Blog_topic_contro)),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Pick_file_main_image('1');
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 23,
                        height: 23,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFF9933),
                          shape: OvalBorder(),
                        ),
                        child: const Icon(Icons.add,color: Colors.white,size: 15,),
                      ),
                      const SizedBox(width: 20,),
                      const Text(
                        'Main image',
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                if(main_img!=null)
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey,
                          child: Image.file(main_img!,fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Pick_file_main_image('2');
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 23,
                        height: 23,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFF9933),
                          shape: OvalBorder(),
                        ),
                        child: const Icon(Icons.add,color: Colors.white,size: 15,),
                      ),
                      const SizedBox(width: 20,),
                      const Text(
                        'Additional images',
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                if(additional_img!=null)
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey,
                          child: Image.file(additional_img!,fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                // SizedBox(height: 30,),
                // const Text(
                //   'Author image : ',
                //   style: TextStyle(
                //     color: Color(0xFF2C2C2C),
                //     fontSize: 14,
                //     fontFamily: 'Poppins',
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                // container_widget(
                //     text_widget: CommonTextField.textField(
                //         controller: Author_image_contro)),
                const SizedBox(height: 30,),
                const Text(
                  'Blog : ',
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
                  text_widget:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonTextField.textField(maxLines_check: 'true',
                        controller: Blog_contro),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  alignment: Alignment.bottomRight,
                  child:  Container(
                    width: 100,
                    child: NavigateBtn(
                      text: 'Add',
                      text_size: 'true',
                      onPressed: () {
                        setState(() {
                          add_blog_astro();
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }else{
      return    SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                common_appbar(title_name: 'Edit blog',
                  onTap: () {
                    widget.appbar_Ontap();
                  },
                ),
                const SizedBox(height: 30,),
                const Text(
                  'Title : ',
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
                        controller: Title_contro)),
                const SizedBox(height: 30,),
                const Text(
                  ' Blog topic : ',
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
                        controller: Blog_topic_contro)),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Pick_file_main_image('1');
                      },
                      child: Container(
                        width: 23,
                        height: 23,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFF9933),
                          shape: OvalBorder(),
                        ),
                        child: const Icon(Icons.add,color: Colors.white,size: 15,),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    const Text(
                      'Main image',
                      style: TextStyle(
                        color: Color(0xFF2C2C2C),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                if(main_img!=null)
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey,
                          child: Image.file(main_img!,fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Pick_file_main_image('2');
                      },
                      child: Container(
                        width: 23,
                        height: 23,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFF9933),
                          shape: OvalBorder(),
                        ),
                        child: const Icon(Icons.add,color: Colors.white,size: 15,),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    const Text(
                      'Additional images',
                      style: TextStyle(
                        color: Color(0xFF2C2C2C),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                if(additional_img!=null)
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey,
                          child: Image.file(additional_img!,fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                // SizedBox(height: 30,),
                // const Text(
                //   'Author image : ',
                //   style: TextStyle(
                //     color: Color(0xFF2C2C2C),
                //     fontSize: 14,
                //     fontFamily: 'Poppins',
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                // container_widget(
                //     text_widget: CommonTextField.textField(
                //         controller: Author_image_contro)),
                const SizedBox(height: 30,),
                const Text(
                  'Blog : ',
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
                  text_widget:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonTextField.textField(maxLines_check: 'true',
                        controller: Blog_contro),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  alignment: Alignment.bottomRight,
                  child:  Container(
                    width: 100,
                    child: NavigateBtn(
                      text: 'Submit',
                      text_size: 'true',
                      onPressed: () {
                        edit_update_blog_astro();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

  }

  Future<void> Pick_file_main_image(String check_img) async {
    final img=await Pick_image().imgFromGallery();
    if(widget.edit_time_check==null){
      if(check_img=='1'){
        main_img=img;
        pick_img_list.add(main_img?.path);
      }else{
        additional_img=img;
        pick_img_list.add(additional_img?.path);
      }
      print("pick_img_list");
      print(pick_img_list);
      setState(() {});

    }else{
      if(check_img=='1'){
        main_img=img;
        pick_img_list.add(main_img?.path);
        network_img.add(main_img?.path);
      }else{
        additional_img=img;
        pick_img_list.add(additional_img?.path);
        network_img.add(additional_img?.path);
      }
      print("pick_img_list");
      print(pick_img_list);
      setState(() {});

    }

  }



  Widget container_widget({required Widget text_widget,String? height_check}) {
    return Container(
      height: height_check==null?40:MediaQuery.of(context).size.height/2.5,
      width: height_check!=null?MediaQuery.of(context).size.width/1.8:MediaQuery.of(context).size.width/2.8,
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
