import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _textEditingControllerAlcool = TextEditingController();
  TextEditingController _textEditingControllerGasolina = TextEditingController();
  var _textoResultado = "";

  void _calcular() {
    var _precoGasolina = double.tryParse(_textEditingControllerGasolina.text);
    var _precoAlcool = double.tryParse(_textEditingControllerAlcool.text);


    if(_precoGasolina == null || _precoAlcool == null) {
      setState(() {
        _textEditingControllerGasolina.clear();
        _textEditingControllerAlcool.clear();
        _textoResultado = "Número inválido, utilize números com ponto. Ex: 1.59";
      });
    }else {
      if(_precoAlcool / _precoGasolina >= 0.7) {
        setState(() {
          _textEditingControllerGasolina.clear();
          _textEditingControllerAlcool.clear();
          _textoResultado = "Abasteça com Gasolina";
        });
      } else {
        setState(() {
          _textEditingControllerGasolina.clear();
          _textEditingControllerAlcool.clear();
          _textoResultado = "Abasteça com Álcool";

        });
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.indigo,

      ),
      body: Container(
        //padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual é a melhor opção para o abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Alcool, Ex: 1.59",
                  labelStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                style: TextStyle(
                    fontSize: 20
                ),
                controller: _textEditingControllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina, Ex: 3.59",
                  labelStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                style: TextStyle(
                    fontSize: 20
                ),
                controller: _textEditingControllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 15,
                      ),

                    ),
                    onPressed: _calcular
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
