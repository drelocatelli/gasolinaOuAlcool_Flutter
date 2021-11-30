import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var resultado = "";

  _calcular() {
    if(
        this._controllerAlcool.text.isNotEmpty &&
        this._controllerGasolina.text.isNotEmpty
    ) {
      setState(() {

        double precoGasolina = double.parse(_controllerGasolina.text.replaceAll(",", "."));
        double precoAlcool = double.parse(_controllerAlcool.text.replaceAll(",", "."));

        if((precoAlcool / precoGasolina) >= 0.7) {
          this.resultado = "É melhor abastecer com gasolina!";
        } else {
          this.resultado = "É melhor abastecer com álcool!";
        }

      });
    }else {
      setState(() {
        resultado = "Há campos nulos!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Alcool ou Gasolina"),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35, bottom: 10),
                child: Image.asset("images/logo.png", height: 80),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsetsDirectional.only(top: 30, bottom: 30),
                          child: Text("Saiba qual a melhor opção para abastecimento do seu carro", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Preço do Álcool",
                        ),
                        controller: this._controllerAlcool,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Preço da Gasolina",
                          ),
                          controller: this._controllerGasolina,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 45),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.indigo),
                          onPressed: (){this._calcular();},
                          child: Text("Verificar qual o melhor"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("$resultado"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
