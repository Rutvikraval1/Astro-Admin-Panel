
import 'package:admin_desktop/widget/common_screen_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Service/network_file.dart';
import '../../widget/CommonTextField.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/button/navigate_btn.dart';

class Create_user_screen extends StatefulWidget {
  final Function? appbar_Ontap;
  final bool check_appbar;
  const Create_user_screen({super.key,this.appbar_Ontap,required this.check_appbar});

  @override
  State<Create_user_screen> createState() => _Create_user_screenState();
}

class _Create_user_screenState extends State<Create_user_screen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController Mobile_controller = TextEditingController();
  bool _passwordVisible = true;


  void clear_value(){
    name_controller.clear();
    email_controller.clear();
    password_controller.clear();
    Mobile_controller.clear();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          primary: false,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.check_appbar)
                    common_appbar(title_name: 'Back',
                      onTap: () {
                        widget.appbar_Ontap!();
                      },
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Create New Admin',
                    style: TextStyle(
                      color: Color(0xFF954A00),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Full Name: ',
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: container_widget(
                        text_widget:
                        CommonTextField.textField(controller: name_controller,hintText: 'Full Name')),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'E-mail : ',
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: container_widget(
                        text_widget: CommonTextField.textField(
                            controller: email_controller,hintText: 'E-mail',check_valid: 'mail')),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Password : ',
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: container_widget(
                        text_widget: CommonTextField.textField(
                          controller: password_controller,
                          suffixIcon: _passwordVisible,
                          suffix_check:'true',
                          suffix_ontap: (){
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          hintText: 'Password',)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Mobile number : ',
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: container_widget(
                        text_widget: CommonTextField.textField(
                          controller: Mobile_controller,hintText: 'Mobile number',)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: NavigateBtn(
                        text_size: 'true',
                        text: 'Submit',
                        onPressed: ()  async {
                          if (formKey.currentState!.validate()) {
                            // clear_value();
                            EasyLoading.show(status: 'Please Wait..');
                            final response = await Network_data().Create_User(email_id:email_controller.text,
                                mobileNumber: Mobile_controller.text,
                                name: name_controller.text,password: password_controller.text);
                            print('response_value');
                            print(response);
                            if(response!=null){
                              print('response');
                              print(response);
                              EasyLoading.showSuccess(response['message']);
                              clear_value();
                            }
                            EasyLoading.dismiss();

                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget container_widget({required Widget text_widget}) {
  return Container(
    height: 40,
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
