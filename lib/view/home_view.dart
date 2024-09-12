// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:viacep_flutter/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  // Instanciar o controller:
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Center(
          child: Text("Buscador de CEP",
          style: TextStyle(
            color: Colors.white
          ),
          ),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/images/mapa.png',
                width: 200,
                ),
            ),
            Text(
              'Buscar CEP',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: MaskedTextField(
                keyboardType: TextInputType.number,
                mask: "xxxxx-xxx",
                maxLength: 9,
                textFieldController: controller.entradaCep,
                onChange: (value) {},
                inputDecoration: InputDecoration(
                  hintText: "12345-000",
                  label: Text('CEP')
                ),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () async{
                    controller.resultado = await controller.buscarCep();
                  setState(() {
                    print(controller.resultado);
                  });
                },
                label: Text('Buscar',
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
                icon: Icon(Icons.search,
                  color: Colors.black ,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[300]
                  ),
              ),
              SizedBox(height: 40),
              Text(controller.resultado,
                style: TextStyle(
                  fontSize: 20
                ),
              )
          ],
         ),
        ),
    );
  }
}