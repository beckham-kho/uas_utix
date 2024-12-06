import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:uas_utix/screens/fnb_payment_screen.dart';
import 'package:uas_utix/services/firestore_service.dart';

class FnbScreen extends StatefulWidget {
  const FnbScreen({super.key});

  @override
  State<FnbScreen> createState() => _FnbScreenState();
}

class _FnbScreenState extends State<FnbScreen> {
  final FirestoreService firestoreService = FirestoreService();
  Map<String, int> itemCounter = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white,),
        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
        title: const Text(
          'Food n Beverage',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                  stream: firestoreService.getFnb(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List fnbList = snapshot.data!.docs;

                      return SizedBox(
                        height:  MediaQuery.sizeOf(context).height-250,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: 
                              SizedBox(
                                width: 100,
                                height: 200,
                                child: Image.asset(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    fnbList[index]['image'],
                                  ),
                              ),
                              trailing: CustomizableCounter(
                                borderColor: const Color.fromRGBO(247, 67, 70, 1),
                                backgroundColor: const Color.fromRGBO(247, 67, 70, 1),
                                borderWidth: 5,
                                borderRadius: 10,
                                buttonText: "Add",
                                textColor: Colors.white,
                                textSize: 22,
                                count: 0,
                                step: 1,
                                minCount: 0,
                                incrementIcon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                decrementIcon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onIncrement: (count) {
                                  setState(() {
                                    itemCounter[fnbList[index]['name']] = (count.toInt() * fnbList[index]['price']).toInt();
                                  });
                                },
                                onDecrement: (count) {
                                  itemCounter[fnbList[index]['name']] = (count.toInt() * fnbList[index]['price']).toInt();
                                },
                              ),
                              title: Text(
                                fnbList[index]['name'],
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white
                                ),
                              ),
                              subtitle: Text(
                                'Rp ${fnbList[index]['price'].toString()}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white
                                ),
                              ),
                            );
                          },
                          itemCount: fnbList.length,
                        ),
                      );
                    } else {
                      return const Text('Cinema data not found');
                    }
                  },
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 20,
                  color: const Color.fromRGBO(247, 67, 70, 1),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FnbPaymentScreen(itemCounter)),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}