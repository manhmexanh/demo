import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../base/state_view.dart';
import '../send_money_controller.dart';

class SendMoneyView extends View {
  @override
  _SendMoneyViewState createState() => _SendMoneyViewState();
}

class _SendMoneyViewState
    extends ViewState<SendMoneyView, SendMoneyController> {
  @override
  Widget buildPage(context) {
    return GestureDetector(onTap: () {
      FocusScope.of(context).requestFocus(new FocusNode());
    }, child: Obx(() {
      final status = controller.status.value;
      return SafeArea(
          child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  }),
              backgroundColor: Color.fromRGBO(250, 252, 255, 0),
              title: Text(
                'Send Money',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              actions: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 28,
                    width: 28,
                    child: Image.network(
                      'https://wallpapercave.com/wp/wp1827510.jpg',
                      height: 28,
                      width: 28,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromRGBO(74, 39, 243, 1),
                      const Color.fromRGBO(68, 75, 177, 1)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(120),
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 60),
                  child: TextField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search a person or business',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(146, 155, 161, 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (text) {
                      controller.filterContacts.clear();
                      controller.filterContacts.addAll(controller.contacts
                          .where((e) => e.name
                              .toLowerCase()
                              .contains(text.toLowerCase())));
                      controller.keyword(text);
                    },
                  ),
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 32, 20, 16),
                  child: Text(
                    'Contacts',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: checkStatus(
                  status: status,
                  child: ListView.builder(
                    itemCount: controller.filterContacts.length,
                    itemBuilder: (context, index) {
                      final contact = controller.filterContacts[index];
                      return Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://wallpapercave.com/wp/wp1827510.jpg'),
                          ),
                          title: Text(
                            contact.name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(
                            contact.role,
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(66, 66, 66, 1)),
                          ),
                        ),
                      );
                    },
                  ),
                ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 24),
              width: 180,
              height: 47,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 25,
                    offset: Offset(0, 3))
              ]),
              child: FlatButton(
                color: Color.fromRGBO(116, 114, 222, 1),
                onPressed: () {
                  print('pressed');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.code,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Scan QR Code',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.24),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ));
    }));
  }
}

checkStatus({Status status, Widget child}) {
  if (status == Status.loading) {
    return CircularProgressIndicator();
  }
  if (status == Status.error) {
    return Text('Error on connection :(');
  }
  return child;
}
