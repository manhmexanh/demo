import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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

class Services{
  String text;
  Icon icon;
  Color color;
  Services({this.icon, this.text, this.color});
}

List<Services> services = [
  Services(text: 'Send', icon: Icon(Icons.arrow_upward, color: Colors.blue), color: Colors.cyan[50]),
  Services(text: 'Request', icon: Icon(Icons.arrow_downward, color: Colors.green), color: Colors.cyan[50]),
  Services(text: 'Recharge', icon: Icon(Icons.offline_bolt, color: Colors.red), color: Colors.pink[50]),
  Services(text: 'Link3', icon: Icon(Icons.attach_money, color: Colors.blue), color: Colors.cyan[50]),
  Services(text: 'Car', icon: Icon(Icons.directions_car, color: Colors.orange[900]), color: Colors.yellow[100]),
  Services(text: 'Alarm', icon: Icon(Icons.access_alarm, color: Colors.lightGreen[900]), color: Colors.lime[50]),
  Services(text: 'Clean', icon: Icon(Icons.directions_boat, color: Colors.green[900]), color: Colors.teal[50]),
];

class Offers{
  String image;
  Offers({this.image});
}

List<Offers> offers = [
  Offers(image: 'assets/BlackBoard1.jpg'),
  Offers(image: 'assets/Boa1.jpg'),
  Offers(image: 'assets/Buggi.jpg'),
  Offers(image: 'assets/BunCha.jpg'),
  Offers(image: 'assets/candy.png'),
  Offers(image: 'assets/Captain.jpg'),
  Offers(image: 'assets/cars.jpg'),
  Offers(image: 'assets/Chaien.jpg'),
  Offers(image: 'assets/China.jpg'),
  Offers(image: 'assets/Doraemon.jpg'),
];

class Shopping{
  String image;
  Shopping({this.image});
}

List<Shopping> shopping = [
  Shopping(image: 'assets/Gao black.png'),
  Shopping(image: 'assets/Gao blue.jpg'),
  Shopping(image: 'assets/Gao red.jpg'),
  Shopping(image: 'assets/Gao yellow.png'),
  Shopping(image: 'assets/Iron.jpg'),
  Shopping(image: 'assets/Kaido1.png'),
  Shopping(image: 'assets/Katakuri1.png'),
  Shopping(image: 'assets/lamborghini.jpg'),
  Shopping(image: 'assets/logo1.jpg'),
  Shopping(image: 'assets/logo.jpg'),
  Shopping(image: 'assets/Luffy.jpg'),
  Shopping(image: 'assets/Marco1.jpg'),
  Shopping(image: 'assets/Maria.jpg'),
];