

import 'package:admin_desktop/utils/app_locale.dart';

class DrawerModel {
  String iconname;
  String label;
  String label_id;

  DrawerModel(
      {required this.iconname, required this.label, required this.label_id});
}
List<DrawerModel> acc_menu = [
  DrawerModel(
      iconname: AppImages.Dashboard,
      label: 'Dashboard',
      label_id: '1'),
  DrawerModel(
      iconname: AppImages.person,
      label: 'User',
      label_id: '2'),
  DrawerModel(
      iconname: AppImages.horoscope,
      label: 'Astrologer',
      label_id: '3'),
  // DrawerModel(
  //     iconname: AppImages.person_workspace,
  //     label:'Interview Schedule',
  //     label_id: '4'),
  DrawerModel(
      iconname: AppImages.phone_talk,
      label: 'Consultation',
      label_id: '5'),
  DrawerModel(
      iconname: AppImages.store,
      label: 'Store',
      label_id: '6'),
  DrawerModel(
      iconname: AppImages.rate_review,
      label: 'Testimonials',
      label_id: '7'),
  DrawerModel(
      iconname: AppImages.codicon_preview,
      label: 'Blogs',
      label_id: '8'),
  DrawerModel(
      iconname: AppImages.person,
      label: 'Create New Admin',
      label_id: '9'),

];

List<DrawerModel> astrogogy_sub_menu = [
  DrawerModel(
      iconname: AppImages.person_workspace,
      label: 'Under Review',
      label_id: '2'),
  DrawerModel(
      iconname: AppImages.person_workspace,
      label: 'Approved',
      label_id: '3'),
  DrawerModel(
      iconname: AppImages.person_workspace,
      label: 'Live',
      label_id: '4'),
  DrawerModel(
      iconname: AppImages.person_workspace,
      label: 'Rejected',
      label_id: '5'),

];

List<DrawerModel> Store_sub_menu = [
  // DrawerModel(
  //     iconname: AppImages.procuct_file,
  //     label: 'Product',
  //     label_id: '1'),
  DrawerModel(
      iconname: AppImages.order_img,
      label: 'Order',
      label_id: '2'),

];
