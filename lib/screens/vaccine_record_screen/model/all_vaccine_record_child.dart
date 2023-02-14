class VaccineDetail {
  bool? status;
  String? message;
  List<Data>? data;

  VaccineDetail({this.status, this.message, this.data});

  VaccineDetail.fromJson(Map<String, dynamic> json) {
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
  String? vaccineName;
  String? vaccineManufactureName;
  bool? isVaccineted;
  String? remainingDays;
  String? dateOfVaccine;
  String? doctor;
  String? note;

  Data(
      {this.vaccineName,
      this.vaccineManufactureName,
      this.isVaccineted,
      this.remainingDays,
      this.dateOfVaccine,
      this.doctor,
      this.note});

  Data.fromJson(Map<String, dynamic> json) {
    vaccineName = json['vaccine_name'];
    vaccineManufactureName = json['vaccine_manufacture_name'];
    isVaccineted = json['is_vaccineted'];
    remainingDays = json['remaining_days'];
    dateOfVaccine = json['date_of_vaccine'];
    doctor = json['doctor'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vaccine_name'] = this.vaccineName;
    data['vaccine_manufacture_name'] = this.vaccineManufactureName;
    data['is_vaccineted'] = this.isVaccineted;
    data['remaining_days'] = this.remainingDays;
    data['date_of_vaccine'] = this.dateOfVaccine;
    data['doctor'] = this.doctor;
    data['note'] = this.note;
    return data;
  }
}
