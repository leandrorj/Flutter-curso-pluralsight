import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String name = '';
  final _currencies = ['Dollars', 'Euros', 'Reais'];
  final double _formDistance = 5.0;
  String _currency = 'Dollars';
  TextEditingController distanceController = TextEditingController();
  TextEditingController kmLitroController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          title: Text("Calcula Combustível"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                  top: _formDistance,
                  bottom: _formDistance,
                ),
                child: TextField(
                  controller: distanceController,
                  decoration: InputDecoration(
                      labelText: 'Distancia',
                      hintText: 'e.g. 124',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                )),
            Padding(
                padding: EdgeInsets.only(
                  top: _formDistance,
                  bottom: _formDistance,
                ),
                child: TextField(
                  controller: kmLitroController,
                  decoration: InputDecoration(
                      labelText: 'Km/litro',
                      hintText: 'e.g. 17',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                )),
            Padding(
                padding: EdgeInsets.only(
                  top: _formDistance,
                  bottom: _formDistance,
                ),
                child: Row(children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: precoController,
                    decoration: InputDecoration(
                      labelText: 'Preco',
                      hintText: 'e.g. 165',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  )),
                  Container(
                    width: _formDistance * 5,
                  ),
                  Expanded(
                      child: DropdownButton<String>(
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: _currency,
                          onChanged: (String value) {
                            _onDropdownChanged(value);
                          }))
                ])),
            Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        onPressed: () {
                          setState(() {
                            result = _calculate();
                          });
                        },
                        child: Text(
                          'Submit',
                          textScaleFactor: 1.5,
                        ))),
                Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).buttonColor,
                        textColor: Theme.of(context).primaryColorDark,
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        },
                        child: Text(
                          'Reset',
                          textScaleFactor: 1.5,
                        )))
              ],
            ),
            Text(result),
          ]),
        ));
  }

  _onDropdownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _preco = double.parse(precoController.text);
    double _kmLitro = double.parse(kmLitroController.text);
    double _total = _distance / _kmLitro * _preco;
    String _result =
        'O total de sua viagem é ' + _total.toStringAsFixed(2) + ' ' + _currency;

    return _result;
  }

  void _reset() {
    distanceController.text = '';
    kmLitroController.text = '';
    precoController.text = '';
    setState(() {
      result = '';
    });
  }
}
