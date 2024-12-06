import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class FnbOrderScreen extends StatefulWidget {
  final Map<String, int> items;
  const FnbOrderScreen(this.items, {super.key});

  @override
  State<FnbOrderScreen> createState() => _FnbOrderScreenState();
}

class _FnbOrderScreenState extends State<FnbOrderScreen> {
  dynamic _items;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white,),
        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
        title: const Text(
          'FnB Order Detail',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(43, 43, 56, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                const SizedBox(height: 5),
                                const Text(
                                  'Your Order',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ..._items.entries.map((entry) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${entry.key}',
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Rp ${entry.value}',
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 350,
                              child: SfBarcodeGenerator(
                                value: DateTime.now().millisecondsSinceEpoch.toString(),
                                symbology: Code128(),
                                barColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              DateTime.now().millisecondsSinceEpoch.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Get Your FnB Instructions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              '1. Please go to the cinema of your choice and find go to cashier.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const Text(
              '2. Show your order code to cashier.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const Text(
              '3. The cashier will process your order.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}