import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Service/global_data.dart';
import '../../Service/network_file.dart';
import '../../Service/shared_preferences/pref_manager.dart';
import '../../utils/app_locale.dart';
import '../../utils/custColors.dart';
import '../../utils/text_style.dart';
import '../../widget/CommonTextField.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/Scaffold_widget.dart';
import '../../widget/SvgPictureWidgets.dart';
import '../../widget/loader/loader_file.dart';
import '../main_dashboard.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email_address=TextEditingController();
  TextEditingController password=TextEditingController();
 bool _passwordVisible = true;
@override
  void initState() {
    // TODO: implement initState
  Preferences.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold_widget(
      body: Form(
        key: formKey,
        child: Container(
          color: red_green,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:const EdgeInsets.symmetric(vertical:70,horizontal: 70),
                  child: SizedBox(
                    width: 354,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text(
                          'Log in',
                          textAlign: TextAlign.center,
                          style: text_style().text_size_24_black_light_400,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          // height: 87,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                'Email address',
                                style: text_style().text_size_16_grey_light_400,
                              ),
                              const SizedBox(height: 7),
                              Container(
                                clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(width: 1, color: Color(0x59666666)),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                child: CommonTextField.textField(
                                    controller: email_address,
                                    check_valid: 'mail',
                                  hintText: 'Email id'
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          // height: 87,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Stack(
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //       children:  [
                              //         Text(
                              //           'Password',
                              //           style:  text_style().text_size_16_grey_light_400,
                              //         ),
                              //         Text(
                              //           'Hide',
                              //           textAlign: TextAlign.right,
                              //           style: text_style().text_size_18_grey_light_400
                              //         )
                              //       ],
                              //     ),
                              //     Positioned(
                              //       right: 48,
                              //       top: 5,
                              //       child: svgpicture().SvgPicture_asset(AppImages.eyes_icon),)
                              //   ],
                              // ),
                              const SizedBox(height: 7),
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(width: 1, color: Color(0x59666666)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: CommonTextField.textField(
                                    controller: password,
                                    suffixIcon: _passwordVisible,
                                    suffix_check:'true',
                                    suffix_ontap: (){
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    hintText: 'Password'
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              loader_file().show_loader();
                              final response = await Network_data().login_User(email_id:email_address.text,
                                  password: password.text);
                              if(response!=null){
                               Auth_token=response['token'].toString();
                                set_login_data(response['token'].toString());
                               loader_file().dismiss_loader();
                               Flutter_toast_mes().Error_Message(response['message']);
                                // ignore: use_build_context_synchronously

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const main_dashboard()),
                                );
                              }else{
                                Flutter_toast_mes().Error_Message('Invalid email or password.');
                              }
                            }
                          },
                          child: Container(
                            width: 180,
                            height: 64,
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 57.50,
                              right: 57.50,
                              bottom: 16,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Carrot_color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            child: Text(
                              'Log in',
                              textAlign: TextAlign.center,
                              style: text_style().text_size_22_white_500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // child:
        ),
      ),
    );
  }

  void set_login_data(String token){
    Preferences.addDataToSF(  Preferences.is_login_check, true);
    Preferences.addDataToSF(  Preferences.Token, token);
  }
}
