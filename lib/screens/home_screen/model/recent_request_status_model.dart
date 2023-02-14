class Recent {
  bool? status;
  String? message;
  List<Data>? data;

  Recent({this.status, this.message, this.data});

  Recent.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? childCodeChildCode;
  String? child;
  String? dob;
  bool? permission;

  Data(
      {this.id,
      this.childCodeChildCode,
      this.child,
      this.dob,
      this.permission});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    childCodeChildCode = json['child_code__child_code'];
    child = json['child'];
    dob = json['dob'];
    permission = json['permission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['child_code__child_code'] = this.childCodeChildCode;
    data['child'] = this.child;
    data['dob'] = this.dob;
    data['permission'] = this.permission;
    return data;
  }
}
