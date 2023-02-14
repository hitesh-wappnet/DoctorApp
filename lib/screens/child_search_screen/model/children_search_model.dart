class SearchChildren {
  bool? status;
  String? message;
  Data? data;

  SearchChildren({this.status, this.message, this.data});

  SearchChildren.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? name;
  String? childCode;
  String? dob;

  Data({this.name, this.childCode, this.dob});

  Data.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    childCode = json["child code"];
    dob = json["dob"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["child code"] = childCode;
    _data["dob"] = dob;
    return _data;
  }
}
