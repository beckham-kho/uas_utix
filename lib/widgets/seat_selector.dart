import 'package:flutter/material.dart';

class BuildSeats {
  static Widget availableSeat() {
    return 
    Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
  static Widget selectedSeat() {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 67, 70, 1),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  static Widget reservedSeat() {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}