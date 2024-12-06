import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas_utix/screens/fnb_order_screen.dart';
import 'package:uas_utix/screens/home_screen.dart';
import 'package:uas_utix/screens/login_screen.dart';
import 'package:uas_utix/screens/ticket_screen.dart';

class FnbPaymentSplashScreen extends StatefulWidget {
  final Map<String, dynamic> items;
  const FnbPaymentSplashScreen(this.items, {super.key});

  @override
  State<FnbPaymentSplashScreen> createState() => _FnbPaymentSplashScreenState();
}

class _FnbPaymentSplashScreenState extends State<FnbPaymentSplashScreen> with SingleTickerProviderStateMixin {
  dynamic _items;

  @override
  void initState() {
    super.initState();
    _items = widget.items;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => FnbOrderScreen(_items))
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