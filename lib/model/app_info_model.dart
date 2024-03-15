class AppsInfoModel {
  String? status;
  String? retStr;
  List<AppList>? appList;

  AppsInfoModel({this.status, this.retStr, this.appList});

  AppsInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    retStr = json['ret_str'];
    if (json['app_list'] != null) {
      appList = <AppList>[];
      json['app_list'].forEach((v) {
        appList!.add(new AppList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['ret_str'] = this.retStr;
    if (this.appList != null) {
      data['app_list'] = this.appList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppList {
  String? userName;
  String? appsName;
  String? appsDownloadLink;
  String? companyName;
  String? appIcon;

  AppList(
      {this.userName,
      this.appsName,
      this.appsDownloadLink,
      this.companyName,
      this.appIcon});

  AppList.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    appsName = json['apps_name'];
    appsDownloadLink = json['apps_download_link'];
    companyName = json['company_name'];
    appIcon = json['app_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['apps_name'] = this.appsName;
    data['apps_download_link'] = this.appsDownloadLink;
    data['company_name'] = this.companyName;
    data['app_icon'] = this.appIcon;
    return data;
  }
}
