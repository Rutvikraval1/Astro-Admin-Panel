
import 'package:flutter_easyloading/flutter_easyloading.dart';

class loader_file{

  void show_loader(){
    EasyLoading.show(status: 'Please Wait..');
  }

  void dismiss_loader(){
    EasyLoading.dismiss();
  }

}

