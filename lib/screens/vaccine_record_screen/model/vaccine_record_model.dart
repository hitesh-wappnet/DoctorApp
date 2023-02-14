class getAllChildVaccineRecords {
  bool? status;
  String? message;
  Data? data;

  getAllChildVaccineRecords({this.status, this.message, this.data});

  getAllChildVaccineRecords.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? childCode;
  String? firstName;
  String? lastName;
  String? middelName;
  String? dateOfBirth;
  String? gender;
  List<Vaccine>? vaccine;

  Data(
      {this.childCode,
      this.firstName,
      this.lastName,
      this.middelName,
      this.dateOfBirth,
      this.gender,
      this.vaccine});

  Data.fromJson(Map<String, dynamic> json) {
    childCode = json['child_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middelName = json['middel_name'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    if (json['vaccine'] != null) {
      vaccine = <Vaccine>[];
      json['vaccine'].forEach((v) {
        vaccine!.add(new Vaccine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child_code'] = this.childCode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middel_name'] = this.middelName;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    if (this.vaccine != null) {
      data['vaccine'] = this.vaccine!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vaccine {
  int? id;
  String? vaccineName;
  bool? isVaccineted;
  String? dateOfVaccine;

  Vaccine({this.id, this.vaccineName, this.isVaccineted, this.dateOfVaccine});

  Vaccine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vaccineName = json['vaccine_name'];
    isVaccineted = json['is_vaccineted'];
    dateOfVaccine = json['date_of_vaccine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vaccine_name'] = this.vaccineName;
    data['is_vaccineted'] = this.isVaccineted;
    data['date_of_vaccine'] = this.dateOfVaccine;
    return data;
  }
}
