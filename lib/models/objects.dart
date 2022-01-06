import 'dart:convert';

List<Objects> objectsFromJson(String str) =>
    List<Objects>.from(json.decode(str).map((x) => Objects.fromJson(x)));

String objectsToJson(List<Objects> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Objects {
  Objects({
    required this.id,
    required this.agreement_id,
    required this.console_id,
    required this.console_code,
    required this.console,
    required this.service_type,
    required this.object_name,
    required this.address,
    required this.monthly_payment,
    required this.created_at,
    required this.updated_at,
  });

  late String id;
  late String agreement_id;
  late String console_id;
  late String console_code;
  late String console;
  late String service_type;
  late String object_name;
  late String address;
  late String monthly_payment;
  late String created_at;
  late String updated_at;

  factory Objects.fromJson(Map<String, dynamic> json) => Objects(
    id: json["id"],
    agreement_id: json["agreement_id"],
    console_id: json["console_id"],
    console_code: json["console_code"],
    console: json["console"],
    service_type: json["service_type"],
    object_name: json["object_name"],
    address: json["address"],
    monthly_payment: json["monthly_payment"],
    created_at: json["created_at"],
    updated_at: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "agreement_id": agreement_id,
    "console_id": console_id,
    "console_code": console_code,
    "console": console,
    "service_type": service_type,
    "object_name": object_name,
    "address": address,
    "monthly_payment": monthly_payment,
    "created_at": created_at,
    "updated_at": updated_at,
  };
}
