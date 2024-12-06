import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uas_utix/api_constants.dart';
import 'package:uas_utix/screens/payment_splash_screen.dart';
import 'package:uas_utix/services/firestore_service.dart';

class TicketPaymentScreen extends StatefulWidget {
  final String title;
  final String poster;
  final DateTime selectedDate;
  final String selectedCinemaName;
  final String selectedHour;
  final int selectedPrice;
  final List<String> selectedSeats;
  final int totalPrice;
  const TicketPaymentScreen(this.title, this.poster, this.selectedDate,this.selectedCinemaName,this.selectedHour, this.selectedPrice, this.selectedSeats, this.totalPrice, {super.key});

  @override
  State<TicketPaymentScreen> createState() => _TicketPaymentScreenState();
}

class _TicketPaymentScreenState extends State<TicketPaymentScreen> {
  final FirestoreService firestoreService = FirestoreService();
  dynamic _title;
  dynamic _poster;
  dynamic _date;
  dynamic _cinemaPlace;
  dynamic _hour;
  dynamic _price;
  dynamic _seats;
  dynamic _totalPrice;
  int adminFee = 2000;
  int totalPayment = 0;
  List<String> paymentMethod = ['QRIS', 'Transfer Bank', 'Dana', 'Gopay', 'OVO'];
  List<bool> isSelected = [true, false, false, false, false];
  String selectedPaymentMethod = 'QRIS';

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _poster = widget.poster;
    _date = widget.selectedDate;
    _cinemaPlace = widget.selectedCinemaName;
    _hour = widget.selectedHour;
    _price = widget.selectedPrice;
    _seats = widget.selectedSeats;
    _totalPrice = widget.totalPrice;
    totalPayment = _totalPrice + adminFee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white,),
        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
        title: const Text(
          'Ticket Payment',
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 100,
                        height: 150,
                        color: const Color.fromRGBO(43, 43, 56, 1),
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          '${ApiConstants.imagePath}$_poster',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                _cinemaPlace,
                                style: const  TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                DateFormat('MMMM dd, yyyy').format(_date),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                ' | ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                _hour,
                                style: const  TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _seats.join(', '),
                            style: const  TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 0.3,
                        color: Colors.white
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Ticket Price',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            _price.toString(),
                            style: const  TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Admin Fee',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            adminFee.toString(),
                            style: const  TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
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
                            totalPayment.toString(),
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
                        color: Colors.white
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
                          children: 
                            List.generate(paymentMethod.length, (int i) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(paymentMethod[i]),
                              );
                            }),
                          onPressed: (int newIndex) {
                            setState(() {
                              selectedPaymentMethod = paymentMethod[newIndex];
                              for (int i=0; i<isSelected.length; i++) {
                                if(i == newIndex) {
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
                firestoreService.addTicketTransaction(
                  _cinemaPlace,
                  _title,
                  _date.toString(),
                  _price.toString(),
                  _hour,
                  FirestoreService().getCurrentUserEmail() ?? "user@gmail.com",
                  totalPayment,
                  selectedPaymentMethod
                );

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PaymentSplashScreen(_title, _poster, _date, _cinemaPlace, _hour, _price, _seats))
                );
              },
              child: const Text(
                'PAY TICKET',
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
    );
  }
}

