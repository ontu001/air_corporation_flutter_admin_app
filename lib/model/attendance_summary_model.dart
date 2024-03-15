class AttendanceSummaryModel {
  String? status;
  String? retStr;
  List<AttendanceSummary>? attendanceSummary;

  AttendanceSummaryModel({this.status, this.retStr, this.attendanceSummary});

  AttendanceSummaryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    retStr = json['ret_str'];
    if (json['Attendance Summary'] != null) {
      attendanceSummary = <AttendanceSummary>[];
      json['Attendance Summary'].forEach((v) {
        attendanceSummary!.add(new AttendanceSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['ret_str'] = this.retStr;
    if (this.attendanceSummary != null) {
      data['Attendance Summary'] =
          this.attendanceSummary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttendanceSummary {
  int? inLate;
  String? empName;
  String? address;
  String? lat;
  int? outLate;
  String? outTime;
  String? outReason;
  String? longitude;
  String? empId;
  String? inTime;
  String? inDate;
  String? inReason;

  AttendanceSummary(
      {this.inLate,
      this.empName,
      this.address,
      this.lat,
      this.outLate,
      this.outTime,
      this.outReason,
      this.longitude,
      this.empId,
      this.inTime,
      this.inDate,
      this.inReason});

  AttendanceSummary.fromJson(Map<String, dynamic> json) {
    inLate = json['in_late'];
    empName = json['emp_name'];
    address = json['address'];
    lat = json['lat'];
    outLate = json['out_late'];
    outTime = json['out_time'];
    outReason = json['out_reason'];
    longitude = json['longitude'];
    empId = json['emp_id'];
    inTime = json['in_time'];
    inDate = json['in_date'];
    inReason = json['in_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['in_late'] = this.inLate;
    data['emp_name'] = this.empName;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['out_late'] = this.outLate;
    data['out_time'] = this.outTime;
    data['out_reason'] = this.outReason;
    data['longitude'] = this.longitude;
    data['emp_id'] = this.empId;
    data['in_time'] = this.inTime;
    data['in_date'] = this.inDate;
    data['in_reason'] = this.inReason;
    return data;
  }
}