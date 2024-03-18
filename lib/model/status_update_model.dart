class StatusUpdateModel {
  bool? success;
  String? message;
  Result? result;

  StatusUpdateModel({this.success, this.message, this.result});

  StatusUpdateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  String? name;
  String? bgColor;
  String? textColor;

  Result({this.id, this.name, this.bgColor, this.textColor});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bgColor = json['bg_color'];
    textColor = json['text_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bg_color'] = this.bgColor;
    data['text_color'] = this.textColor;
    return data;
  }
}
