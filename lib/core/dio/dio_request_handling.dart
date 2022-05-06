import 'package:boilerplate/core/network/network_information.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class DioRequestHandlingController extends GetxController {
  // with StateMixin<List>
  DioRequestHandlingController({
    required this.networkInformation,
  });

  final NetworkInformation networkInformation;

  Future<Map<String, dynamic>> onRequestCallback() async {
    String? token = SharedPrefs.instance.getToken();
    return {
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  Future<void> onResponseCallback(Response response) async {}

  Future<void> onErrorCallback(DioError error) async {
    final response = error.response;
    if (response != null) {
      if ((response.statusCode == 500 || response.statusCode == 401) &&
          response.data.toString().contains('Unauthenticated')) {
        // emit(
        //   UnauthenticatedState(
        //     "قد تم تسجيل خروجك تلقائيًا من فضلك قم بتسجبل دخولك.",
        //   ),
        // );
      }
    }
  }
}
