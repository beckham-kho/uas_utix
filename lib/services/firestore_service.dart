import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference cinema = FirebaseFirestore.instance.collection('cinema');
  final CollectionReference ticketTransaction = FirebaseFirestore.instance.collection('ticket_transaction');
  final CollectionReference fnb = FirebaseFirestore.instance.collection('fnb');
  final CollectionReference fnbTransaction = FirebaseFirestore.instance.collection('fnb_transaction');
  final CollectionReference promo = FirebaseFirestore.instance.collection('promo');
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<QuerySnapshot> getCinema() {
    final cinemaStream = cinema.snapshots();
    return cinemaStream;
  }

  Stream<QuerySnapshot> getFnb() {
    final fnbStream = fnb.snapshots();
    return fnbStream;
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

  Future<void> addFnbTransaction(Map<String, dynamic> items, int totalPayment, String paymentMethod) {
    return fnbTransaction.add({
      'items': items,
      'totalPayment': totalPayment,
      'payment_method': paymentMethod
    });
  }

  Stream<QuerySnapshot> getTicketTransaction() {
    final ticketTransactionStream = ticketTransaction.snapshots();
    return ticketTransactionStream;
  }

  Stream<QuerySnapshot> getFnbTransaction() {
    final fnbTransactionStream = fnbTransaction.snapshots();
    return fnbTransactionStream;
  }

  Stream<QuerySnapshot> getPromo() {
    final promoStream = promo.snapshots();
    return promoStream;
  }
}
