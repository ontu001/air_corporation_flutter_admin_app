import 'package:air_corporation/controller/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import '../common/constant.dart';
import '../widget/custom_text_fied_for_addorder_editorder.dart';

class EditOrder extends StatefulWidget {
   int id;
   var index;
   var phoneNumber;

   EditOrder({super.key, required this.id, required this.index, required this.phoneNumber});

  @override
  State<EditOrder> createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {

  String? _selectedPayment;
  String? _selectedOrder;
 // var orderController = Get.find<OrderController>(); // Access the controller
  OrderController orderController = OrderController();


 


 @override
  Widget build(BuildContext context) {

   

       TextEditingController _customerPhoneNumberController = 
  TextEditingController(text: widget.phoneNumber);

    // TextEditingController();
  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _orderNoteController = TextEditingController();
  TextEditingController _contactNameController = TextEditingController();
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _buyPriceController = TextEditingController();
  TextEditingController _mrpPriceController = TextEditingController();
  TextEditingController _sellPriceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _sizeController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _advancedPaymentController = TextEditingController();
  TextEditingController _deliveryChargeController = TextEditingController();
  TextEditingController _discountPriceController = TextEditingController();

    List<Map<String, dynamic>> productItems = [];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
        title: Text(
          "Edit Order",
          style: TextStyle(fontWeight: FontWeight.w900, color: kPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Text(
                "Order Information",
                style: kTextStyleBold,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Customer Phone Number",
                controller: _customerPhoneNumberController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Customer Name",
                controller: _customerNameController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "District",
                controller: _districtController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Customer Address",
                controller: _addressController,
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0)),
                child: DropdownButton<String>(
                  hint: Text('Payment Status'),
                  value: _selectedPayment,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedPayment = newValue;
                    });
                  },
                  items: <String>['paid', 'unpaid'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0)),
                child: DropdownButton<String>(
                  hint: Text('Order From'),
                  value: _selectedOrder,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOrder = newValue;
                    });
                  },
                  items: <String>[
                    'Messenger',
                    'Whatsapp',
                    'Facebook',
                    'Message',
                    'Phone',
                    'Website',
                    'Landing page',
                    'Others'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              CustomTextFiledforAddAndEditOrder(
                hintText: "Order Note",
                controller: _orderNoteController,
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                "Product Infromation",
                style: kTextStyleBold,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "contact name",
                controller: _contactNameController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Product Name",
                controller: _productNameController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Buy Price",
                controller: _buyPriceController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Mrp price",
                controller: _mrpPriceController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Sell price",
                controller: _sellPriceController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Quantity",
                controller: _quantityController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "size",
                controller: _sizeController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Color",
                controller: _colorController,
              ),

              // Order add api will be call here
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    Map<String, dynamic> productObject = {
                      "product_name": _productNameController.text,
                      "product_color": _colorController.text,
                      "product_size": _sizeController.text,
                      "quantity": _quantityController.text,
                      "buy_price": _buyPriceController.text,
                      "mrp": _mrpPriceController.text,
                      "sell_price": _sellPriceController.text,
                    };

                    productItems.add(productObject);
                  },
                  child: Text("ADD")),
              // ========================

              SizedBox(
                height: 40.0,
              ),
              Text(
                "Regular Price : 0 tk",
                style: kTextStyleBold1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Discount : 0 tk",
                style: kTextStyleBold1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Offer Price :   0 tk",
                style: kTextStyleBold1,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Advanced Payment",
                controller: _advancedPaymentController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Delivery Charge",
                controller: _deliveryChargeController,
              ),
              CustomTextFiledforAddAndEditOrder(
                hintText: "Discount price",
                controller: _discountPriceController,
              ),

              Text(
                "Payable Price: 0 tk",
                style: kTextStyleBold1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () async {
                      print(productItems);
                      // String jsonString = jsonEncode(items);
                      // var itemObject = ProductModel.toJson(jsonString);

                      var orderUpdateBody = {
                        "customer_name": _customerNameController.text,
                        "phone_number": _customerPhoneNumberController.text,
                        "address_details": _addressController.text,
                        "district": _districtController.text,
                        "order_note": _orderNoteController.text,
                        "paid_status": _selectedPayment, // paid
                        "order_from": _selectedOrder, // daraz
                        "special_discount": _discountPriceController.text,
                        "advance_payment": _advancedPaymentController.text,
                        "delivery_charge": _deliveryChargeController.text,
                        "status_id": 2,
                        "items": productItems
                       
                      };

                      //print("object");
                      // bool result =
                      await orderController.orderUpdate(widget.id, orderUpdateBody);
                     // orderCreate(orderCreteBody);
                      // if (result == true) {
                      //   Get.snackbar("Order Added", "Order Added Successfully");
                      // } else {
                      //   Get.snackbar("Failed", "Something went worng!",
                      //       colorText: Colors.red);
                      // }
                    },
                    child: Text(
                      "UPDATE ORDER",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }



}




























