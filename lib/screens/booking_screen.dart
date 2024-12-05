import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uas_utix/screens/ticket_payment_screen.dart';
import 'package:uas_utix/widgets/seat_selector.dart';

class BookingScreen extends StatefulWidget {
  final String title;
  final String poster;
  final DateTime selectedDate;
  final String selectedCinemaName;
  final String selectedHour;
  final int selectedPrice;

  const BookingScreen(this.title, this.poster, this.selectedDate,this.selectedCinemaName,this.selectedHour, this.selectedPrice, {super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  dynamic _title;
  dynamic _poster;
  dynamic _date;
  dynamic _cinemaPlace;
  dynamic _hour;
  dynamic _price;
  List<String> selectedSeats = [];
  int totalPrice = 0;
  
  var seatStatus = [
    [1, 1, 1, 0, 1, 1, 1],
    [1, 1, 1, 0, 1, 1, 1],  
    [1, 1, 1, 0, 1, 1, 1],
    [1, 1, 1, 0, 1, 1, 1],
    [1, 1, 1, 0, 1, 1, 1],  
    [1, 1, 1, 0, 1, 1, 1],
  ];


  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _poster = widget.poster;
    _date = widget.selectedDate;
    _cinemaPlace = widget.selectedCinemaName;
    _hour = widget.selectedHour;
    _price = widget.selectedPrice;
  }

  Widget _seat() {
    return Column(
      children: [
        for(int i=0; i<6; i++) 
          Container(
          margin: EdgeInsets.only(top: i == 3 ? MediaQuery.of(context).size.height * 0.02 : 0),
          child: Row(
            children: [
              for(int j=0; j<9; j++)
              Expanded(
                flex: j == 0 || j == 8 ? 2 : 1,
                child: j == 0 || j == 4 || j == 8 ? 
                Container() : 
                GestureDetector(
                  onTap: () {
                    setState(() {
                      String seatNumber = '${String.fromCharCode(65 + i)}$j';
                      if (seatStatus[i][j - 1] == 1) {
                        seatStatus[i][j - 1] = 2;
                        selectedSeats.add(seatNumber);
                      } else if (seatStatus[i][j - 1] == 2) {
                        seatStatus[i][j - 1] = 1;
                        selectedSeats.remove(seatNumber);
                      }
                      totalPrice =  (selectedSeats.length * _price).toInt();
                    });
                  },
                  child: Container(
                    height: 30,
                    margin: const EdgeInsets.all(5),
                    child: seatStatus[i][j - 1] == 1 ? BuildSeats.availableSeat() 
                    : seatStatus[i][j - 1] == 2 ? BuildSeats.selectedSeat() 
                    : BuildSeats.reservedSeat()
                  ),
                ),
              ),
            ]
          )
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
        title: const Text(
          'Book Ticket',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cinema Detail',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      _cinemaPlace,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      ' - ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Bandung',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      DateFormat('MMMM dd, yyyy').format(_date),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      ' | ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _hour,
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
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'CINEMA SCREEN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(60),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.transparent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 1]
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 6,
                            color: Colors.white
                          )
                        )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: _seat(),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Available',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Unavailable',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(247, 67, 70, 1),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Selected',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            color: const Color.fromRGBO(43, 43, 56, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Seat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        selectedSeats.isEmpty ? '-' : selectedSeats.join(", "),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: 3,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Total Price',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        selectedSeats.isEmpty ? 'Rp 0' : totalPrice.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TicketPaymentScreen(_title, _poster, _date, _cinemaPlace, _hour, _price, selectedSeats, totalPrice))
                );
              },
              child: const Text(
                'PICK SEAT',
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