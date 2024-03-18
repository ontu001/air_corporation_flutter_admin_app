class OrderUpdateModel {
  bool? success;
  String? message;
  Result? result;

  OrderUpdateModel({this.success, this.message, this.result});

  OrderUpdateModel.fromJson(Map<String, dynamic> json) {
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
  int? buyPrice;
  int? mrp;
  int? sellPrice;
  int? discount;
  int? specialDiscount;
  int? deliveryCharge;
  int? netPrice;
  int? advancePayment;
  int? payablePrice;
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
  List<OrderDetails>? orderDetails;

  Result(
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
      this.orderDetails});

  Result.fromJson(Map<String, dynamic> json) {
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
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
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
    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  int? id;
  int? orderId;
  int? productId;
  String? productName;
  String? productColor;
  String? productSize;
  int? quantity;
  String? buyPrice;
  String? mrp;
  String? sellPrice;
  String? discount;
  String? createdAt;
  Null? updatedAt;

  OrderDetails(
      {this.id,
      this.orderId,
      this.productId,
      this.productName,
      this.productColor,
      this.productSize,
      this.quantity,
      this.buyPrice,
      this.mrp,
      this.sellPrice,
      this.discount,
      this.createdAt,
      this.updatedAt});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    quantity = json['quantity'];
    buyPrice = json['buy_price'];
    mrp = json['mrp'];
    sellPrice = json['sell_price'];
    discount = json['discount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_color'] = this.productColor;
    data['product_size'] = this.productSize;
    data['quantity'] = this.quantity;
    data['buy_price'] = this.buyPrice;
    data['mrp'] = this.mrp;
    data['sell_price'] = this.sellPrice;
    data['discount'] = this.discount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
