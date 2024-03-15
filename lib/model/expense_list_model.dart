class ExpenseListModel {
  String? status;
  String? retStr;
  List<ExpenseTypeList>? expenseTypeList;

  ExpenseListModel({this.status, this.retStr, this.expenseTypeList});

  ExpenseListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    retStr = json['ret_str'];
    if (json['Expense List'] != null) {
      expenseTypeList = <ExpenseTypeList>[];
      json['Expense List'].forEach((v) {
        expenseTypeList!.add(new ExpenseTypeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['ret_str'] = this.retStr;
    if (this.expenseTypeList != null) {
      data['Expense List'] =
          this.expenseTypeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpenseTypeList {
  String? headId;
  String? headName;

  ExpenseTypeList({this.headId, this.headName});

  ExpenseTypeList.fromJson(Map<String, dynamic> json) {
    headId = json['head_id'];
    headName = json['head_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['head_id'] = this.headId;
    data['head_name'] = this.headName;
    return data;
  }
}