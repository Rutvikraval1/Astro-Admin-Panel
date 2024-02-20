
import 'dart:convert';
import 'dart:io';
var Auth_token;
class GlobleData {



  ///Live call API
  static const String base_url = "https://astro-backend-lgagceac3a-rj.a.run.app/api";

  Future<dynamic> httpClient_request_post(
      {required Map map_data, required String page_name,String nobody=''}) async {
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient
          .postUrl(Uri.parse("$base_url/$page_name"));
      request.headers.set('content-type', 'application/json');
      request.headers.set('Authorization', 'Bearer $Auth_token');
      if(nobody=='')
        request.add(utf8.encode(json.encode(map_data)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      print('vvxcvcv');
      print(response.statusCode);
      print(reply);
      if (response.statusCode == 200||response.statusCode == 201) {
        return json.decode(reply);
      } else {
        if (response.statusCode == 404) {
          return null;
        } else {
          return data;
        }
      }
    } on SocketException {
      // fluttertoast().fluttertoast_wiget("Please Connect Internet!");
    } catch (e) {
      print("svcvc");
    }
  }


   Future<dynamic> httpClient_request_get(
       {required String page_name}) async {
     try {
       print('Auth_token');
       print(Auth_token);
       HttpClient httpClient = HttpClient();
       HttpClientRequest request = await httpClient
           .getUrl(Uri.parse("$base_url/$page_name"));
       request.headers.set('Authorization', 'Bearer $Auth_token');
       HttpClientResponse response = await request.close();
       String reply = await response.transform(utf8.decoder).join();
       httpClient.close();
       print('vvxcvcv');
       print(response.statusCode);
       print(reply);
       if (response.statusCode == 200) {
         return json.decode(reply);
       } else {
         if (response.statusCode == 404) {
           return null;
         } else {
           return null;
         }
       }
     } on SocketException {
       // fluttertoast().fluttertoast_wiget("Please Connect Internet!");
     } catch (e) {
       print("svcvc");
     }
   }


  Future<dynamic> httpClient_request_PUT(
      {required Map map_data, required String page_name}) async {
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient
          .putUrl(Uri.parse("$base_url/$page_name"));
      request.headers.set('content-type', 'application/json');
      request.headers.set('Authorization', 'Bearer $Auth_token');
      request.add(utf8.encode(json.encode(map_data)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      print('vvxcvcv');
      print(response.statusCode);
      print(reply);
      if (response.statusCode == 200||response.statusCode == 201) {
        return json.decode(reply);
      } else {
        if (response.statusCode == 404) {
          return null;
        } else {
          return data;
        }
      }
    } on SocketException {
      // fluttertoast().fluttertoast_wiget("Please Connect Internet!");
    } catch (e) {
      print("svcvc");
    }
  }


  Future<dynamic> httpClient_request_Delete({required String page_name}) async{
    try{
      HttpClient httpClient =  HttpClient();
      HttpClientRequest request = await httpClient.deleteUrl(Uri.parse("$base_url/$page_name"));
      request.headers.set('Authorization', 'Bearer $Auth_token');
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      print('vvxcvcv');
      print(response.statusCode);
      print(reply);
      if (response.statusCode == 200) {
        return json.decode(reply);
      } else {
        if (response.statusCode == 404) {
          return null;
        } else {
          return null;
        }
      }

    }on SocketException {
      // fluttertoast().fluttertoast_wiget("Please Connect Internet!");
    } catch (e) {
      print("svcvc");
    }

  }

  Map data = {
    'status_code': 500,
    'message': 'Server Error',
  };
  Map data1 = {
    'status_code': 404,
    'message': 'Page Not Found',
  };
}
