import 'package:get/get_connect/connect.dart';

class ApiProvider extends GetConnect {
  Future<Response> getAddress(lat, lng) => get(
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng');
}
