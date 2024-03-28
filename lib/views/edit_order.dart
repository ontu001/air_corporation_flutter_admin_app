import 'package:air_corporation/controller/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import '../common/constant.dart';
import '../widget/custom_text_fied_for_addorder_editorder.dart';

class EditOrder extends StatefulWidget {
  final int id;

  const EditOrder({super.key, required this.id});

  @override
  State<EditOrder> createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {
  @override
  Widget build(BuildContext context) {
    String? _selectedPayment;
    String? _selectedOrder;
    TextEditingController _customerPhoneNumberController = TextEditingController();
    TextEditingController _customerNameController = TextEditingController();
    TextEditingController _districtController = TextEditingController();
    TextEditingController _addressController = TextEditingController();
    TextEditingController _paidStatusController = TextEditingController();
    TextEditingController _orderNoteController = TextEditingController();
    TextEditingController _6Controller = TextEditingController();
    TextEditingController _7Controller = TextEditingController();
    TextEditingController _8Controller = TextEditingController();
    TextEditingController _9Controller = TextEditingController();
    TextEditingController _10Controller = TextEditingController();
    TextEditingController _11Controller = TextEditingController();
    TextEditingController _12Controller = TextEditingController();
    TextEditingController _13Controller = TextEditingController();
    TextEditingController _14Controller = TextEditingController();
    TextEditingController _15Controller = TextEditingController();
      final orderController =
        Get.find<OrderController>(); // Access the controller
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
      // body: Padding(
      //   padding: const EdgeInsets.all(10.0),
      //   child: Expanded(
      //     child: ListView(
      //       scrollDirection: Axis.vertical,
      //       children: [
      //         Text("Order Information"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text("Order Information"),
      //
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Customer Phone Number",
      //           controller: _1Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Customer Name",
      //           controller: _2Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "District",
      //           controller: _3Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Customer Address",
      //           controller: _4Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Payment Status",
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Order form",
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Order Note",
      //           controller: _5Controller,
      //         ),
      //
      //         SizedBox(
      //           height: 10,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "contact name",
      //
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text("Product Information"),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Product Name",
      //           controller: _6Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Buy Price",
      //           controller: _7Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "mrp price",
      //           controller: _8Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "sell price",
      //           controller: _9Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Quantity",
      //           controller: _10Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "size",
      //           controller: _11Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Color",
      //           controller: _12Controller,
      //         ),
      //         ElevatedButton( style:
      //         ElevatedButton.styleFrom(backgroundColor: Colors.orange),onPressed: () {}, child: Text("ADD")),
      //         SizedBox(
      //           height: 40,
      //         ),
      //         Text("Regular Price : 0bdt"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text("Discount : 0bdt"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text("Offer Price : 0bdt"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Advanced Payment",
      //           controller: _13Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Delivery Charge",
      //           controller: _14Controller,
      //         ),
      //         CustomTextFiledforAddAndEditOrder(
      //           hintText: "Discount price",
      //           controller: _15Controller,
      //         ),
      //         Text("Payable Price: 0bdt"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //      Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: ,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),



     body:    Padding(
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Text("Order Information",style: kTextStyleBold,),
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
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: DropdownButton<String>(
                    hint: Text('Payment Status'),
                    value: _selectedPayment,
                    onChanged: (newValue ){
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
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: DropdownButton<String>(
                    hint: Text('Order From'),
                    value: _selectedOrder,
                    onChanged: (newValue ){
                      setState(() {
                        _selectedOrder = newValue;
                      });
                    },
                    items: <String>['Messenger', 'Whatsapp', 'Facebook', 'Message', 'Phone', 'Website', 'Landing page', 'Others'].map((String value) {
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
                Text("Product Infromation",style: kTextStyleBold,),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "contact name",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "Product Name",
                  controller: _6Controller,
                ),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "Buy Price",
                  controller: _7Controller,
                ),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "Mrp price",
                  controller: _8Controller,
                ),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "Sell price",
                  controller: _9Controller,
                ),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "Quantity",
                  controller: _10Controller,
                ),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "size",
                  controller: _11Controller,
                ),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "Color",
                  controller: _12Controller,
                ),



                // Order add api will be call here
                ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    onPressed: () {
                      // Order add api will be call here
                    },
                    child: Text("ADD")),
                // ========================



                SizedBox(
                  height: 40.0,
                ),
                Text("Regular Price : 0 tk",style: kTextStyleBold1,),
                SizedBox(
                  height: 10,
                ),
                Text("Discount : 0 tk",style: kTextStyleBold1,),
                SizedBox(
                  height: 10,
                ),
                Text("Offer Price :   0 tk",style: kTextStyleBold1,),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "Advanced Payment",
                  controller: _13Controller,
                ),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "Delivery Charge",
                  controller: _14Controller,
                ),
                CustomTextFiledforAddAndEditOrder(
                  hintText: "Discount price",
                  controller: _15Controller,
                ),





                Text("Payable Price: 0 tk",style: kTextStyleBold1,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () async {
                        var orderCreteBody = {
                          "customer_name": _customerNameController.text,
                          "phone_number":_customerPhoneNumberController.text,
                          "address_details": _addressController.text,
                          "district": _districtController.text,
                          "order_note": _orderNoteController.text,
                          "paid_status": _paidStatusController.text, // paid
                          "order_from": "message", // daraz
                          "special_discount": 10,
                          "advance_payment": 50,
                          "delivery_charge": 50,
                          "items": [
                            {
                              "product_name": "Product 1",
                              "product_color": "Red",
                              "product_size": "L",
                              "quantity": 1,
                              "buy_price": 100,
                              "mrp": 200,
                              "sell_price": 150
                            },
                            {
                              "product_name": "Product 1",
                              "product_color": "Green",
                              "product_size": "XL",
                              "quantity": 2,
                              "buy_price": 600,
                              "mrp": 700,
                              "sell_price": 700
                            },
                            {
                              "product_name": "Product 1",
                              "product_color": "Blue",
                              "product_size": "M",
                              "quantity": 3,
                              "buy_price": 1400,
                              "mrp": 1800,
                              "sell_price": 1700
                            }
                          ]
                        };

                        //print("object");
                        // bool result =
                        await orderController.orderCreate(orderCreteBody);
                       // if (result == true) {
                        //   Get.snackbar("Order Added", "Order Added Successfully");

                        //   // setState(() {
                        //   //  orderController.fetchOrders();

                        //   // });


                        // } else {
                        //   Get.snackbar("Failed", "Something went worng!",
                        //       colorText: Colors.red);
                        // }
                      },
                      child: Text(
                        "Update Order",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
              ],
            ),
          ),
        )
    );
  }
}




























