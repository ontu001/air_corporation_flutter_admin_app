import 'package:air_corporation/common/variables.dart';
import 'package:air_corporation/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../widget/custom_drawer.dart';
import '../widget/my_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GetStorage userData = GetStorage();

  List itemList = [
    {
      "title": "New Order",
      "icon": Icons.shopping_basket_rounded,
      "page": "/OrderSubmitScreen",
    },
    {
      "title": "Order Report",
      "icon": Icons.report,
      "page": "/attendanceScreen",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: Text('Home Screen'),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.grey.shade200,
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('${userData.read("name")}'),
                    minLeadingWidth: 10,
                  ),
                ),
              ),
              Container(
                height: size.height,
                width: size.width,
                child: GridView.builder(
                    itemCount: itemList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (() {
                          final List<Map<String, dynamic>> selectedExpenseData =
                              [];
                          Get.toNamed(
                            '${itemList[index]["page"]}',
                            arguments: {
                              'expense_data': selectedExpenseData,
                            },
                          );
                        }),
                        child: Card(
                          elevation: 1.0,
                          color: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                itemList[index]['icon'],
                                size: size.height * 0.05,
                                color: Colors.black54,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                itemList[index]['title'],
                                textAlign: TextAlign.center,
                                style: myTextStyle(
                                  // size: size.width * 0.02,
                                  size: 12.5,
                                  clr: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
