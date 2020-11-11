import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/view.dart';
import 'package:flutter_base/app/page/payment/payment_controller.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaymentView extends ViewStateLess<PaymentController> {
  final RefreshController _refreshController = RefreshController();

  @override
  Future<bool> willPopCallBack() {
    return super.willPopCallBack();
  }

  @override
  Widget buildPage(context) {
    controller.fetchDataFromApi();
    return Scaffold(
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                margin: EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      verticalDirection: VerticalDirection.down,

                      children: [
                        Icon(Icons.arrow_back, size: 24,color: Colors.white,),
                        Text('Payment',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w800),),
                        Image.network('https://picsum.photos/250?image=9',width: 28,height: 28,)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20,bottom: 35),
                      height: 95,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                          // hintText: 'Search payment options',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Search payment options',
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    )
                  ],
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        child: Icon(Icons.lightbulb, size: 30,color: Colors.yellow,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.pink[100],
                        ),
                        width: 61,
                        height: 61,
                      ),
                      Container(
                        child: Text('Electric',style: TextStyle(fontSize: 16),),
                        margin: EdgeInsets.symmetric(vertical: 10),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Icon(Icons.water_damage, size: 30,color: Colors.tealAccent,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo[200],
                        ),
                        width: 61,
                        height: 61,
                      ),
                      Container(
                        child: Text('Water',style: TextStyle(fontSize: 16),),
                        margin: EdgeInsets.symmetric(vertical: 10),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Icon(Icons.wifi, size: 30,color: Colors.indigoAccent,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[350],
                        ),
                        width: 61,
                        height: 61,
                      ),
                      Container(
                        child: Text('Internet',style: TextStyle(fontSize: 16),),
                        margin: EdgeInsets.symmetric(vertical: 10),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Icon(Icons.payments_outlined, size: 30,color: Colors.cyan,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.teal[100],
                        ),
                        width: 61,
                        height: 61,
                      ),
                      Container(
                        child: Text('Payment',style: TextStyle(fontSize: 16),),
                        margin: EdgeInsets.symmetric(vertical: 10),
                      )
                    ],
                  ),

                ],
              ),
              color: Colors.grey[200],
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Text('Mostly Used', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    padding: EdgeInsets.only(left: 20,bottom: 10),
                  )
                ],
              ),
              color: Colors.grey[200],
            ),
            Expanded(
                child: Obx(() =>
                    SmartRefresher(
                      header: WaterDropMaterialHeader(),
                      controller: _refreshController,
                      onRefresh: () {
                        controller.fetchDataFromApi(
                            action: () => _refreshController.refreshCompleted()
                        );
                      },
                      child: ListView.builder(
                        itemCount: controller.listCrypto.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.network(
                                          'https://picsum.photos/250?image=9',
                                          width: 56, height: 56,)
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text('Name: ' + controller.listCrypto[index].name,
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                                            margin: EdgeInsets.symmetric(vertical: 6),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text('Symbol: ' + controller.listCrypto[index].symbol),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text('Price: ' + controller.listCrypto[index].quote.uSD.price.toString())
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                          }
                      )
                    ))
            ),
            Container(
              decoration: BoxDecoration(color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(30)),
              height: 47,
              width: 182,
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.qr_code,size: 24,color: Colors.white,),
                      Text('Scan QR Code', style: TextStyle(color: Colors.white, fontSize: 18),)
                    ],
                  )
              ),
            )
          ],
        )
    );
  }
}
