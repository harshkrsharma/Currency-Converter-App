import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 81;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilt');

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
      borderRadius: BorderRadius.circular(5),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print('Settings button clicked');
              }
            },
            icon: const Icon(Icons.settings),
            color: Colors.black,
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              TextField(
                controller: textEditingController,

                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Please Enter The Amount In USD',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white60,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),

              // button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 81;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
