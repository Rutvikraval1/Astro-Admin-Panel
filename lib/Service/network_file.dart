import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'global_data.dart';
import 'package:http/http.dart' as http;

class Network_data {
  Future<dynamic> login_User(
      {String email_id = '', String password = ''}) async {
    Map data = {"email": email_id, "password": password};

    return await GlobleData()
        .httpClient_request_post(map_data: data, page_name: 'admin/loginAdmin');
  }

  Future<dynamic> Create_User(
      {String email_id = '',
      String password = '',
      String mobileNumber = '',
      String name = ''}) async {
    Map data = {
      "email": email_id,
      "password": password,
      "mobileNumber": mobileNumber,
      "name": name
    };

    return await GlobleData().httpClient_request_post(
        map_data: data, page_name: 'admin/createAdmin');
  }

  Future<dynamic> get_usersregistered() async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'admin/getnumberofusersregistered');
  }

  Future<dynamic> get_astrologersregistered() async {
    return await GlobleData().httpClient_request_get(
        page_name: 'admin/gettotalregisteredastrologers');
  }

  Future<dynamic> get_allusers() async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'admin/getallusers');
  }

  Future<dynamic> get_allastro() async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'admin/getallastrologers');
  }

  Future<dynamic> get_user_details(String user_id) async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'admin/getuserbyid/$user_id');
  }

  Future<dynamic> get_astro_details(String user_id) async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'admin/getastrologerbyid/$user_id');
  }

  Future<dynamic> get_astro_reject_api(String user_id) async {
    Map data = {"id": user_id};
    return await GlobleData().httpClient_request_post(
        nobody: 'true',
        map_data: data,
        page_name: 'admin/rejectastrologer/$user_id');
  }

  Future<dynamic> Approved_astro_api(String user_id) async {
    Map data = {"id": user_id};
    return await GlobleData().httpClient_request_post(
        nobody: 'true',
        map_data: data,
        page_name: 'admin/changeStatusToAprooved/$user_id');
  }

  Future<dynamic> delete_blog_api(String user_id) async {
    return await GlobleData()
        .httpClient_request_Delete(page_name: 'blogs/deleteBlog/$user_id');
  }

  Future<dynamic> Approved_TO_live_astro_api(String user_id) async {
    Map data = {"id": user_id};
    return await GlobleData().httpClient_request_post(
        nobody: 'true',
        map_data: data,
        page_name: 'admin/approvedtolive/$user_id');
  }

  Future<dynamic> get_Under_review_astro({String page_name = ''}) async {
    return await GlobleData().httpClient_request_get(page_name: page_name);
  }

  Future<dynamic> get_admin_profile() async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'admin/viewAdminprofile');
  }

  Future<dynamic> get_BlogsList() async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'blogs/getBlogsList');
  }

  Future<dynamic> get_Blogs_details({String user_id = ''}) async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'blogs/getBlog/$user_id');
  }

  Future add_blog_astro(
      {String title = '',
      String content = '',
      String authorName = '',
      List? images_path,
      String isDraft = 'false',
      String check_edit = ''}) async {
    try {
      Map<String, String> headers = {'Authorization': 'Bearer $Auth_token'};
      Uri uri = Uri.parse('${GlobleData.base_url}/blogs/createBlog');
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields['title'] = title;
      request.fields['content'] = content;
      request.fields['isDraft'] = isDraft;
      request.fields['authorName'] = authorName;
      if (images_path!.isNotEmpty) {
        for (var i = 0; i < images_path.length; i++) {
          images_path[i];
          request.files
              .add(await http.MultipartFile.fromPath('images', images_path[i]));
        }
      }

      http.StreamedResponse response = await request.send();
      var responseBytes = await response.stream.toBytes();
      var responseString = utf8.decode(responseBytes);
      var errorMessage = jsonDecode(responseString);
      print("errorMessage");
      print(errorMessage);
      if (response.statusCode == 200) {
      } else {}
      return errorMessage;
    } on SocketException {
      // fluttertoast().fluttertoast_wiget("Please Connect Internet!");
    } catch (e) {
      print('ADSSADFDSDD');
      print(e);
      log("", name: "erroe", error: e);
    }
  }

  Future Edit_update_blog_astro(
      {
      String title = '',
      String content = '',
      String authorName = '',
      List? images_path,
      String user_id = '',
      String isDraft = 'false'}) async {
    try {
      Map<String, String> headers = {'Authorization': 'Bearer $Auth_token'};
      Uri uri = Uri.parse('${GlobleData.base_url}/blogs/editBlog/$user_id');
      var request = http.MultipartRequest('PUT', uri);
      request.headers.addAll(headers);
      request.fields['title'] = title;
      request.fields['content'] = content;
      request.fields['isDraft'] = isDraft;
      request.fields['authorName'] = authorName;
      if (images_path!.isNotEmpty) {
        for (var i = 0; i < images_path.length; i++) {
          images_path[i];
          var img=images_path[i].toString().split(':');
          print('imgimgimg');
          print(img);
          if(img[0]!='https'){
            print('sfF');
            request.files
                .add(await http.MultipartFile.fromPath('images', images_path[i]));
          }else{
            request.files
                .add(http.MultipartFile.fromString('images', images_path[i]));
          }

        }
      }

      http.StreamedResponse response = await request.send();
      var responseBytes = await response.stream.toBytes();
      var responseString = utf8.decode(responseBytes);
      var errorMessage = jsonDecode(responseString);
      print("errorMessage");
      print(errorMessage);
      if (response.statusCode == 200) {
      } else {}
      return errorMessage;
    } on SocketException {
      // fluttertoast().fluttertoast_wiget("Please Connect Internet!");
    } catch (e) {
      print('ADSSADFDSDD');
      print(e);
      log("", name: "erroe", error: e);
    }
  }


  /// Store product

  Future<dynamic> get_Store_productList() async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'product/getAllProducts');
  }

  Future<dynamic> getStore_product_details({String user_id = ''}) async {
    return await GlobleData()
        .httpClient_request_get(page_name: 'product/getProduct/$user_id');
  }

  Future add_Store_product_astro(
      {String productTitle = '',
        String category = '',
        String productDescription = '',
        String MRP = '',
        String discountPrice = '',
        String stocksAvailable = '',
        String mainImage = '',
        List? otherImages_path,}) async {
    try {
      Map<String, String> headers = {'Authorization': 'Bearer $Auth_token'};
      Uri uri = Uri.parse('${GlobleData.base_url}/product/createProduct');
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields['productTitle'] = productTitle;
      request.fields['category'] = category;
      request.fields['productDescription'] = productDescription;
      request.fields['MRP'] = MRP;
      request.fields['discountPrice'] = discountPrice;
      request.fields['stocksAvailable'] = stocksAvailable;
      request.files.add(await http.MultipartFile.fromPath('mainImage', mainImage));
      if (otherImages_path!.isNotEmpty) {
        for (var i = 0; i < otherImages_path.length; i++) {
          otherImages_path[i];
          request.files.add(await http.MultipartFile.fromPath('otherImages', otherImages_path[i]));
        }
      }

      http.StreamedResponse response = await request.send();
      var responseBytes = await response.stream.toBytes();
      var responseString = utf8.decode(responseBytes);
      var errorMessage = jsonDecode(responseString);
      print("errorMessage");
      print(errorMessage);
      if (response.statusCode == 201) {
      } else {}
      return errorMessage;
    } on SocketException {
      // fluttertoast().fluttertoast_wiget("Please Connect Internet!");
    } catch (e) {
      print('ADSSADFDSDD');
      print(e);
      log("", name: "erroe", error: e);
    }
  }


  Future Edit_Store_product_astro(
      {String productTitle = '',
        String category = '',
        String user_id = '',
        String productDescription = '',
        String MRP = '',
        String discountPrice = '',
        String stocksAvailable = '',
        String mainImage = '',
        List? otherImages_path,}) async {
    try {
      Map<String, String> headers = {'Authorization': 'Bearer $Auth_token'};
      Uri uri = Uri.parse('${GlobleData.base_url}/product/edit/$user_id');
      var request = http.MultipartRequest('PUT', uri);
      request.headers.addAll(headers);
      request.fields['productTitle'] = productTitle;
      request.fields['category'] = category;
      request.fields['productDescription'] = productDescription;
      request.fields['MRP'] = MRP;
      request.fields['discountPrice'] = discountPrice;
      request.fields['stocksAvailable'] = stocksAvailable;
      request.files.add( http.MultipartFile.fromString('mainImage', mainImage));
      if (otherImages_path!.isNotEmpty) {
        for (var i = 0; i < otherImages_path.length; i++) {
          otherImages_path[i];
          request.files.add(await http.MultipartFile.fromPath('otherImages', otherImages_path[i]));
        }
      }

      http.StreamedResponse response = await request.send();
      var responseBytes = await response.stream.toBytes();
      var responseString = utf8.decode(responseBytes);
      var errorMessage = jsonDecode(responseString);
      print("errorMessage");
      print(errorMessage);
      if (response.statusCode == 200) {
      } else {}
      return errorMessage;
    } on SocketException {
      // fluttertoast().fluttertoast_wiget("Please Connect Internet!");
    } catch (e) {
      print('ADSSADFDSDD');
      print(e);
      log("", name: "erroe", error: e);
    }
  }


}
