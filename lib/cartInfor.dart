import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_new/data.dart';

class CartInfor extends StatelessWidget {
  Widget text(String text){
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
  Widget text2(String text){
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
  }
  Widget _listServices(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text2('Services'),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            width: double.infinity,
            height: 75,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: services.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: new BoxDecoration(
                              color: services[index].color,
                              shape: BoxShape.circle
                          ),
                          child: services[index].icon,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(services[index].text),
                        )
                      ],
                    ),
                  );
                }
            ),
          ),
        )
      ],
    );
  }
  Widget _list(String name, List<dynamic> list){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text2(name),
                Icon(Icons.arrow_forward)
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: offers.length,
              itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image(
                      image: AssetImage(list[index].image),
                      fit: BoxFit.cover,
                      width: 140,
                      height: 80,
                    ),
                  );
              }
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          color: Colors.white,
          onPressed: (){},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/rubic.jpg'),
              fit: BoxFit.scaleDown,
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text('Balance'),
                  Text(
                    '\$18,240',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 33, fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: [
                      text('****    ****    ****    '),
                      Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: text('128\n9'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 360,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: Column(
                    children: <Widget>[
                      _listServices(),
                      _list('Offers', offers),
                      _list('Shopping', shopping)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
