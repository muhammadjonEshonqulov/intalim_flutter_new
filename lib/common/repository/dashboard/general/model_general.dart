class GeneralModel {
  Null? error;
  Null? message;
  int? status;
  Null? path;
  Data? data;
  Null? response;

  GeneralModel(
      {this.error,
        this.message,
        this.status,
        this.path,
        this.data,
        this.response});

  GeneralModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    status = json['status'];
    path = json['path'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['status'] = this.status;
    data['path'] = this.path;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['response'] = this.response;
    return data;
  }
}

class Data {
  int? oblId;
  String? oblName;
  int? districtsCount;
  int? streetsCount;
  int? housesCount;
  int? familiesCount;
  int? populationCount;
  int? maleCount;
  int? femaleCount;
  int? youthCount;

  Data(
      {this.oblId,
        this.oblName,
        this.districtsCount,
        this.streetsCount,
        this.housesCount,
        this.familiesCount,
        this.populationCount,
        this.maleCount,
        this.femaleCount,
        this.youthCount});

  Data.fromJson(Map<String, dynamic> json) {
    oblId = json['obl_id'];
    oblName = json['obl_name'];
    districtsCount = json['districts_count'];
    streetsCount = json['streets_count'];
    housesCount = json['houses_count'];
    familiesCount = json['families_count'];
    populationCount = json['population_count'];
    maleCount = json['male_count'];
    femaleCount = json['female_count'];
    youthCount = json['youth_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['obl_id'] = this.oblId;
    data['obl_name'] = this.oblName;
    data['districts_count'] = this.districtsCount;
    data['streets_count'] = this.streetsCount;
    data['houses_count'] = this.housesCount;
    data['families_count'] = this.familiesCount;
    data['population_count'] = this.populationCount;
    data['male_count'] = this.maleCount;
    data['female_count'] = this.femaleCount;
    data['youth_count'] = this.youthCount;
    return data;
  }
}