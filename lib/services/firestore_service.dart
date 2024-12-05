import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference cinema = FirebaseFirestore.instance.collection('cinema');
  final CollectionReference ticketTransaction = FirebaseFirestore.instance.collection('ticket_transaction');
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<QuerySnapshot> getCinema() {
    final cinemaStream = cinema.snapshots();
    return cinemaStream;
  }

  Future<void> addTicketTransaction(String place, String title, String date, String price, String hour, String email, int totalPayment, String paymentMethod) {
    return ticketTransaction.add({
      'place': place,
      'title': title,
      'date': date,
      'price': price,
      'hour': hour,
      'email': email,
      'totalPayment': totalPayment,
      'payment_method': paymentMethod
    });
  }

  String? getCurrentUserEmail() {
    final User? user = auth.currentUser;
    return user?.email;
  }
}
