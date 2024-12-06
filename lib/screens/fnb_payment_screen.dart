import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uas_utix/screens/fnb_payment_splash_screen.dart';
import 'package:uas_utix/services/firestore_service.dart';

class FnbPaymentScreen extends StatefulWidget {
  final Map<String, dynamic> items;
  const FnbPaymentScreen(this.items, {super.key});

  @override
  State<FnbPaymentScreen> createState() => _FnbPaymentScreenState();
}

class _FnbPaymentScreenState extends State<FnbPaymentScreen> {
  FirestoreService firestoreService = FirestoreService();
  dynamic _items;
  List<String> paymentMethod = ['QRIS', 'Transfer Bank', 'Dana', 'Gopay', 'OVO'];
  List<bool> isSelected = [true, false, false, false, false];
  String selectedPaymentMethod = 'QRIS';

  @override
  void initState() {
    super.initState();
    _items = widget.items;
  }

  double getTotalPayment() {
    double total = 0;
    _items.forEach((key, value) {
      if (value is Map && value['price'] != null) {
        total += value['price'];
      } else if (value is num) {
        total += value;
      }
    });

    return total;
  }

  @override
  Widget build(BuildContext context) {
    double totalPayment = getTotalPayment();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
        title: const Text(
          'FnB Payment',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 0.3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 5),
                      const Text(
                        'Order List',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Rp ${totalPayment.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 0.3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        ToggleButtons(
                          direction: Axis.vertical,
                          color: Colors.white,
                          selectedColor: Colors.white,
                          fillColor: const Color.fromRGBO(247, 67, 70, 1),
                          splashColor: const Color.fromRGBO(247, 67, 70, 1),
                          isSelected: isSelected,
                          children: List.generate(paymentMethod.length, (int i) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(paymentMethod[i]),
                            );
                          }),
                          onPressed: (int newIndex) {
                            setState(() {
                              selectedPaymentMethod = paymentMethod[newIndex];
                              for (int i = 0; i < isSelected.length; i++) {
                                if (i == newIndex) {
                                  isSelected[i] = true;
                                } else {
                                  isSelected[i] = false;
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(247, 67, 70, 1),
            child: TextButton(
              onPressed: () {
                firestoreService.addFnbTransaction(
                  _items,
                  totalPayment.toInt(),
                  selectedPaymentMethod
                );

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FnbPaymentSplashScreen(_items)),
                );
              },
              child: const Text(
                'PAY FNB ORDER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
