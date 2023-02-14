class Notifications {
  bool? status;
  String? message;
  List<Data>? data;

  Notifications({this.status, this.message, this.data});

  Notifications.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? title;
  String? description;
  bool? status;
  String? requestType;
  String? childCode;
  String? doctor;
  String? doctorName;
  String? viewdataPermission;
  String? vaccine;
  String? permission;
  String? addPermission;

  Data(
      {this.title,
      this.description,
      this.status,
      this.requestType,
      this.childCode,
      this.doctor,
      this.doctorName,
      this.viewdataPermission,
      this.vaccine,
      this.permission,
      this.addPermission});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    status = json['status'];
    requestType = json['request_type'];
    childCode = json['child_code'];
    doctor = json['doctor'];
    doctorName = json['doctor_name'];
    viewdataPermission = json['viewdata_permission'];
    vaccine = json['vaccine'];
    permission = json['permission'];
    addPermission = json['add_permission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['request_type'] = this.requestType;
    data['child_code'] = this.childCode;
    data['doctor'] = this.doctor;
    data['doctor_name'] = this.doctorName;
    data['viewdata_permission'] = this.viewdataPermission;
    data['vaccine'] = this.vaccine;
    data['permission'] = this.permission;
    data['add_permission'] = this.addPermission;
    return data;
  }
}
