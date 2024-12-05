import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:uas_utix/api_constants.dart';

class TicketScreen extends StatefulWidget {
  final String title;
  final String poster;
  final DateTime selectedDate;
  final String selectedCinemaName;
  final String selectedHour;
  final int selectedPrice;
  final List<String> selectedSeats;
  const TicketScreen(this.title, this.poster, this.selectedDate,this.selectedCinemaName,this.selectedHour, this.selectedPrice, this.selectedSeats, {super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white,),
        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
        title: const Text(
          'Ticket Detail',
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
                  height: MediaQuery.of(context).size.height * 0.6,
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
                            const SizedBox(width: 20),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _title,
                                    style: const  TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    _cinemaPlace,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
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
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _seats.join(', '),
                                    style: const TextStyle(
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
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: SfBarcodeGenerator(
                                value: DateTime.now().millisecondsSinceEpoch.toString(),
                                symbology: QRCode(),
                                barColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Kode Tiket: ${DateTime.now().millisecondsSinceEpoch.toString()}',
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
              'Ticket Scanning Instructions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              '1. Please go to the cinema of your choice and find the ticket machine.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const Text(
              '2. Point your QR code ticket to parallel to the scanner.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const Text(
              '3. Press the confirm button on the ticket machine.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const Text(
              '4. Wait for the process to finish, the movie ticket will be printed soon.',
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
