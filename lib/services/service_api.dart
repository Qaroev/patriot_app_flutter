import 'package:http/http.dart' as http;
import 'package:patriotapp/models/status.dart';

abstract class ServiceApi {
  Future<List<Status>> getStatus();
}

class StatusService extends ServiceApi {
  String BASE_URL = "http://89.190.249.251/api/objects/statuses/9089?limit=99";

  @override
  Future<List<Status>> getStatus() async {
    try {
      var uri = Uri.parse(BASE_URL);
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
}
