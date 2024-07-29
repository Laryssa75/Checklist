//import 'dart:io';
import 'package:flutter/material.dart';

enum StatusPagamento { pendente, pago, reembolso }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escolha de Pagamento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String _escolha = '';
  StatusPagamento? _status;

  void _handleChoice(int choice) {
    setState(() {
      _status = StatusPagamento.values[choice - 1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha de Pagamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Escolha a forma de pagamento:\n'
                '1 - Pendente\n'
                '2 - Pago\n'
                '3 - Reembolso\n'),
            TextField(
              onChanged: (value) {
                setState(() {
                  _escolha = value;
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o número da escolha',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int? escolhaInt = int.tryParse(_escolha);
                if (escolhaInt != null &&
                    escolhaInt >= 1 &&
                    escolhaInt <= StatusPagamento.values.length) {
                  _handleChoice(escolhaInt);
                } else {
                  setState(() {
                    _status = null;
                  });
                }
              },
              child: const Text('Confirmar'),
            ),
            const SizedBox(height: 20),
            _status != null
                ? Text('Você escolheu: ${_status.toString().split('.').last}')
                : const Text('Escolha inválida ou não feita.'),
          ],
        ),
      ),
    );
  }
}



//código para usar no console do dart sem ser web, pois não importa biblioteca
// void main() {
//     print('Escolha um dos números para selecionar a forma de pagamento\n'
//           '1 - Pendente\n'
//           '2 - Pago\n'
//           '3 - Reembolso\n');
  
//   //Ler a entrada do usuário
//   String? escolha = stdin.readLineSync();
  
//   //Converter a entrada do usuário para um índice
//   int? indice = int.tryParse(escolha ?? '');
  
  
//   if(indice != && indice >= 1 && indice <= StatusPagamento.values.length) {
//     //Ajustar o índice para corresponder ao índice de enum (0-based)
//     StatusPagamento status = StatusPagamento.values[indice - 1];
  
//   //Lidar com o caso selecionado
//   switch(status) {
//     case StatusPagamento.pendente:
//       print('Pagamento pendente.');
//       //TODO: Handle this case.
//       break;
//     case StatusPagamento.pago:
//       print('Pagamento realizado.');
//       //TODO: Handle this case
//       break;
//     case StatusPagamento.reembolso:
//       print('Pagamento reembolsado.');
//       //TODO: Handle this case
//       break;
//   }
    
//     } else {
//       print('Escolhaa inválida.');
//     }
  

// }
