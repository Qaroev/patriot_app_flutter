import 'dart:convert';

List<Status> albumsFromJson(String str) =>
    List<Status>.from(json.decode(str).map((x) => Status.fromJson(x)));

String albumsToJson(List<Status> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Status {
  Status({
    required this.id,
    required this.object_id,
    required this.rc_channel_name,
    required this.event_date,
    required this.save_date,
    required this.event_code,
    required this.event_type,
    required this.event_name,
    required this.event_description,
    required this.created_at,
    required this.updated_at,
  });

  late int id;
  late String object_id;
  late String rc_channel_name;
  late String event_date;
  late String save_date;
  late String event_code;
  late String event_type;
  late String event_name;
  late String event_description;
  late String created_at;
  late String updated_at;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        object_id: json["object_id"],
        rc_channel_name: json["rc_channel_name"],
        event_date: json["event_date"],
        event_code: json["event_code"],
        save_date: json["save_date"],
        event_type: json["event_type"],
        event_name: json["event_name"],
        event_description: json["event_description"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object_id": object_id,
        "rc_channel_name": rc_channel_name,
        "event_date": event_date,
        "save_date": save_date,
        "event_type": event_type,
        "event_name": event_name,
        "event_description": event_description,
        "created_at": created_at,
        "updated_at": updated_at,
      };
}
