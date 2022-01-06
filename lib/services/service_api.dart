import 'package:http/http.dart' as http;
import 'package:patriotapp/models/objects.dart';
import 'package:patriotapp/models/status.dart';

abstract class ServiceApi {
  Future<List<Status>> getStatus(String id);

  Future<List<Objects>> getObjects();
}

class StatusService extends ServiceApi {
  String BASE_URL = "http://89.190.249.251/api/objects";

  @override
  Future<List<Status>> getStatus(String id) async {
    try {
      var uri = Uri.parse(BASE_URL + '/statuses/${int.parse(id)}?limit=99');
      var response = await http.get(
        uri,
        headers: {
          "ContentType": "application/json",
          'Authorization': 'Bearer 52|DDALogeHwHTv6tGW4IpffvRSmhwa3mnPC4VPvAox'
        },
      );
      var statusList = albumsFromJson(response.body);
      return statusList;
    } catch (e) {
      return List<Status>.empty();
    }
  }

  @override
  Future<List<Objects>> getObjects() async {
    try {
      var uri = Uri.parse(BASE_URL);
      var response = await http.get(
        uri,
        headers: {
          "ContentType": "application/json",
          'Authorization': 'Bearer 52|DDALogeHwHTv6tGW4IpffvRSmhwa3mnPC4VPvAox'
        },
      );
      var objectList = objectsFromJson(response.body);
      return objectList;
    } catch (e) {
      return List<Objects>.empty();
    }
  }
}
