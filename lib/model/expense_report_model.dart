class ExpenseReportModel {
  String? status;
  String? retStr;
  List<ExpenseList>? expenseList;

  ExpenseReportModel({this.status, this.retStr, this.expenseList});

  ExpenseReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    retStr = json['ret_str'];
    if (json['expense_List'] != null) {
      expenseList = <ExpenseList>[];
      json['expense_List'].forEach((v) {
        expenseList!.add(new ExpenseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['ret_str'] = this.retStr;
    if (this.expenseList != null) {
      data['expense_List'] = this.expenseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpenseList {
  String? expenseDate;
  String? note;
  String? image;
  String? status;
  List<Expense>? expense;

  ExpenseList(
      {this.expenseDate, this.note, this.image, this.status, this.expense});

  ExpenseList.fromJson(Map<String, dynamic> json) {
    expenseDate = json['expense_date'];
    note = json['note'];
    image = json['image'];
    status = json['status'];
    if (json['expense'] != null) {
      expense = <Expense>[];
      json['expense'].forEach((v) {
        expense!.add(new Expense.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expense_date'] = this.expenseDate;
    data['note'] = this.note;
    data['image'] = this.image;
    data['status'] = this.status;
    if (this.expense != null) {
      data['expense'] = this.expense!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Expense {
  String? expenseName;
  String? expenseAmount;

  Expense({this.expenseName, this.expenseAmount});

  Expense.fromJson(Map<String, dynamic> json) {
    expenseName = json['expense_name'];
    expenseAmount = json['expense_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expense_name'] = this.expenseName;
    data['expense_amount'] = this.expenseAmount;
    return data;
  }
}