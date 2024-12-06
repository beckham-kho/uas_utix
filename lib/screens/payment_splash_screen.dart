import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas_utix/screens/ticket_screen.dart';

class PaymentSplashScreen extends StatefulWidget {
  final String title;
  final String poster;
  final DateTime selectedDate;
  final String selectedCinemaName;
  final String selectedHour;
  final int selectedPrice;
  final List<String> selectedSeats;
  const PaymentSplashScreen(this.title, this.poster, this.selectedDate,this.selectedCinemaName,this.selectedHour, this.selectedPrice, this.selectedSeats, {super.key});

  @override
  State<PaymentSplashScreen> createState() => _PaymentSplashScreenState();
}

class _PaymentSplashScreenState extends State<PaymentSplashScreen> with SingleTickerProviderStateMixin {
  dynamic _title;
  dynamic _poster;
  dynamic _date;
  dynamic _cinemaPlace;
  dynamic _hour;
  dynamic _price;
  dynamic _seats;

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

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => TicketScreen(_title, _poster, _date, _cinemaPlace, _hour, _price, _seats))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(22, 22, 33, 1),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250,
              child: Icon(
                Icons.check_circle_outlined,
                size: 250,
                color: Color.fromRGBO(247, 67, 70, 1)
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Payment Success',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'Your Payment Has Been Verified',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        )
      ),
    );
  }
}