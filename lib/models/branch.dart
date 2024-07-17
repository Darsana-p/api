/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Branch branchFromJson(String str) => Branch.fromJson(json.decode(str));

String branchToJson(Branch data) => json.encode(data.toJson());

class Branch {
    Branch({
        required this.address,
        required this.isActive,
        required this.mail,
        required this.phone,
        required this.name,
        required this.gst,
        required this.location,
        required this.id,
        required this.patientsCount,
    });

    String address;
    bool isActive;
    String mail;
    String phone;
    String name;
    String gst;
    String location;
    int id;
    int patientsCount;

    factory Branch.fromJson(Map<dynamic, dynamic> json) => Branch(
        address: json["address"],
        isActive: json["is_active"],
        mail: json["mail"],
        phone: json["phone"],
        name: json["name"],
        gst: json["gst"],
        location: json["location"],
        id: json["id"],
        patientsCount: json["patients_count"],
    );

    Map<dynamic, dynamic> toJson() => {
        "address": address,
        "is_active": isActive,
        "mail": mail,
        "phone": phone,
        "name": name,
        "gst": gst,
        "location": location,
        "id": id,
        "patients_count": patientsCount,
    };
}
