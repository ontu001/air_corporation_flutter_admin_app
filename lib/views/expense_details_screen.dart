
import 'package:air_corporation/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/expense_report_model.dart';

import '../widget/my_text_style.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  ExpenseDetailsScreen({super.key});
  ExpenseList _item = Get.arguments['expense_details'];

//double  totalAmount=0.0;

  double totalAmount() {
    double sum = 0.0;
    //for (var totalExpense in _item.expense!.length)
    for (var index = 0; index < _item.expense!.length; index++) {
      sum += double.parse('${_item.expense![index].expenseAmount}');
      print('Total Amount : ${sum}');
    }
    return sum;
  }

  String _imageUrl =
      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.sproutsocial.com%2Fuploads%2F2017%2F02%2F10x-featured-social-media-image-size.png&tbnid=-VCM1w56w6u5VM&vet=12ahUKEwi5_M_Su5KAAxWzzqACHYyrBQYQMygKegUIARDKAQ..i&imgrefurl=https%3A%2F%2Fsproutsocial.com%2Finsights%2Fsocial-media-image-sizes-guide%2F&docid=aVwfeogQqK1XmM&w=780&h=460&q=image&ved=2ahUKEwi5_M_Su5KAAxWzzqACHYyrBQYQMygKegUIARDKAQ';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Expense Details'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.fromLTRB(10, 12, 10, 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 0.1)),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_item.expenseDate}',
                          style: myTextStyle(size: 16, clr: Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${_item.status}',
                          style: myTextStyle(
                              size: 14,
                              clr: Color.fromARGB(255, 51, 157, 210),
                              fw: FontWeight.bold),
                        ),
                      ],
                    ),
                    // trailing: GestureDetector(
                    //     onTap: ()
                    //     {
                    //       Get.dialog(
                    //         CustomImageDialog(
                    //           image: NetworkImage(_imageUrl),
                    //           aspectRatio: 0.5,
                    //         ),
                    //       );
                    //       print('clicked');
                    //     },
                    //     child: Icon(Icons.image_rounded)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _item.note.toString().isNotEmpty
                  ? Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Note : ${_item.note}',
                        style: TextStyle(color: Colors.black),
                        maxLines: 6,
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.ltr,
                      ),
                    )
                  : SizedBox(),
            SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: DataTable(
                  headingRowHeight: 42.0,
                  dataRowHeight: 35.0,
                  horizontalMargin: 12,
                  columnSpacing: 50.0,
                  headingTextStyle: myTextStyle(
                    clr: Colors.white,
                    fw: FontWeight.bold,
                    // size: 14.0,
                  ),
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Color.fromARGB(255, 135, 195, 224)),
                  dataRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  border: TableBorder.all(
                    width: 1.0,
                    color: Colors.black26,
                  ),
                  columns: [
                    DataColumn(
                      label: Expanded(
                        child: Center(child: Text('Expense Name')),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Center(child: Text('Expense Amount')),
                      ),
                    ),
                  ],
                  rows: [
                    for (var index = 0; index < _item.expense!.length; index++)
                      DataRow(
                        color: MaterialStateProperty.all(
                          index % 2 == 0
                              ? Colors.grey.shade300
                              : Colors.grey.shade400,
                        ),
                        cells: [
                          DataCell(
                            Container(
                              alignment: Alignment.center,
                              child: SelectableText(
                                "${_item.expense![index].expenseName}",
                              ),
                            ),
                          ),
                          DataCell(
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "${_item.expense![index].expenseAmount}",
                              ),
                            ),
                          ),
                        ],
                      ),
                    DataRow(
                        color: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 135, 195, 224)),
                        cells: [
                          DataCell(
                            Container(
                              alignment: Alignment.center,
                              child: SelectableText(
                                "Total Expense",
                                style: myTextStyle(
                                    clr: Colors.white, fw: FontWeight.bold),
                              ),
                            ),
                          ),
                          DataCell(
                            Container(
                              alignment: Alignment.center,
                              child: SelectableText("${totalAmount()}",
                                  style: myTextStyle(
                                      clr: Colors.white, fw: FontWeight.bold)),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  tabelRowData({
    String? title,
    String? data,
    Widget? rightChild,
  }) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text(
            "${title ?? ''}",
            style: myTextStyle(
              clr: Colors.grey,
              size: 15.0,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
          child: rightChild ??
              SelectableText(
                "${data ?? ''}",
                style: myTextStyle(clr: Colors.grey, size: 15.0),
                textAlign: TextAlign.start,
              ),
        )
      ],
    );
  }
}
