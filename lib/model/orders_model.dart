class OrdersModel {
  bool? success;
  String? message;
  Result? result;

  OrdersModel({this.success, this.message, this.result});

  OrdersModel.fromJson(Map<String, dynamic> json) {
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
  List<Data>? data;
  Links? links;
  Meta? meta;

  Result({this.data, this.links, this.meta});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? buyPrice;
  String? mrp;
  String? sellPrice;
  String? discount;
  String? specialDiscount;
  String? deliveryCharge;
  String? netPrice;
  String? advancePayment;
  String? payablePrice;
  String? courierPayable;
  String? paidStatus;
  String? phoneNumber;
  String? customerName;
  String? district;
  String? addressDetails;
  String? orderFrom;
  String? orderNote;
  Null? trackingId;
  Null? courierName;
  String? createdAt;
  int? statusId;
  Status? status;
  Status? createdBy;
  Status? updatedBy;

  Data(
      {this.id,
        this.buyPrice,
        this.mrp,
        this.sellPrice,
        this.discount,
        this.specialDiscount,
        this.deliveryCharge,
        this.netPrice,
        this.advancePayment,
        this.payablePrice,
        this.courierPayable,
        this.paidStatus,
        this.phoneNumber,
        this.customerName,
        this.district,
        this.addressDetails,
        this.orderFrom,
        this.orderNote,
        this.trackingId,
        this.courierName,
        this.createdAt,
        this.statusId,
        this.status,
        this.createdBy,
        this.updatedBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyPrice = json['buy_price'];
    mrp = json['mrp'];
    sellPrice = json['sell_price'];
    discount = json['discount'];
    specialDiscount = json['special_discount'];
    deliveryCharge = json['delivery_charge'];
    netPrice = json['net_price'];
    advancePayment = json['advance_payment'];
    payablePrice = json['payable_price'];
    courierPayable = json['courier_payable'];
    paidStatus = json['paid_status'];
    phoneNumber = json['phone_number'];
    customerName = json['customer_name'];
    district = json['district'];
    addressDetails = json['address_details'];
    orderFrom = json['order_from'];
    orderNote = json['order_note'];
    trackingId = json['tracking_id'];
    courierName = json['courier_name'];
    createdAt = json['created_at'];
    statusId = json['status_id'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    createdBy = json['created_by'] != null
        ? new Status.fromJson(json['created_by'])
        : null;
    updatedBy = json['updated_by'] != null
        ? new Status.fromJson(json['updated_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buy_price'] = this.buyPrice;
    data['mrp'] = this.mrp;
    data['sell_price'] = this.sellPrice;
    data['discount'] = this.discount;
    data['special_discount'] = this.specialDiscount;
    data['delivery_charge'] = this.deliveryCharge;
    data['net_price'] = this.netPrice;
    data['advance_payment'] = this.advancePayment;
    data['payable_price'] = this.payablePrice;
    data['courier_payable'] = this.courierPayable;
    data['paid_status'] = this.paidStatus;
    data['phone_number'] = this.phoneNumber;
    data['customer_name'] = this.customerName;
    data['district'] = this.district;
    data['address_details'] = this.addressDetails;
    data['order_from'] = this.orderFrom;
    data['order_note'] = this.orderNote;
    data['tracking_id'] = this.trackingId;
    data['courier_name'] = this.courierName;
    data['created_at'] = this.createdAt;
    data['status_id'] = this.statusId;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    if (this.updatedBy != null) {
      data['updated_by'] = this.updatedBy!.toJson();
    }
    return data;
  }
}

class Status {
  int? id;
  String? name;

  Status({this.id, this.name});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null? prev;
  Null? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
