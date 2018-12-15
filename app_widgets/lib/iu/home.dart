import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30.0, left: 10.0),
            color: Colors.deepOrangeAccent,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Margarita",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                        color: Colors.amber,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "Tomate, Mussarela",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                        color: Colors.amber,
                      ),
                    ))
                  ],
                ),
                PizzaImageWidget(),
                OrderButton(),
              ],
            )));
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/image-pizza.png');
    Image image = Image(
      image: pizzaAsset,
      width: 250.0,
      height: 250.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 50.0),
    );
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: RaisedButton(
        child: Text('Finalizar pedido!'),
        color: Colors.lightGreen,
        elevation: 5.0,
        onPressed: () {
          order(context);
        },
      ),
    );
    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Pedido Completo"),
      content: Text("Obrigado pelo seu pedido"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) => alert);
  }
}
