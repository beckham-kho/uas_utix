import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uas_utix/api_constants.dart';
import 'package:uas_utix/models/movies_model.dart';
import 'package:uas_utix/screens/booking_screen.dart';
import 'package:uas_utix/services/firestore_service.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieModel apiData;
  const MovieDetailScreen(this.apiData, {super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  List<bool> isExpanded = [false, false];
  List<bool> isSelected = [true, false, false, false, false, false, false];

  final date = List<DateTime>.generate(7, (i) {
    DateTime date = DateTime.now().add(Duration(days: i));
    return date;
  });
  DateTime selectedDate = DateTime.now();
  String selectedCinemaName = '';
  String selectedHour = '';
  int selectedPrice = 0;

  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${ApiConstants.imagePath}${widget.apiData.backdropPath}',
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: const Color.fromRGBO(204, 204, 204, 1),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.apiData.originalTitle,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_rounded,
                        color: Colors.yellow,
                        size: 30
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${widget.apiData.voteAverage.toStringAsPrecision(2)}/10',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.apiData.overview,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(43, 43, 56, 1),
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ToggleButtons(
                          color: Colors.white,
                          selectedColor: Colors.white,
                          fillColor: const Color.fromRGBO(247, 67, 70, 1),
                          splashColor: const Color.fromRGBO(247, 67, 70, 1),
                          borderRadius: BorderRadius.circular(5),
                          isSelected: isSelected,
                          children: List.generate(date.length, (int i) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(
                                    '${DateFormat('EEE').format(date[i])},',
                                  ),
                                  Text(
                                    DateFormat('MMMM dd').format(date[i]),
                                  ),
                                ],
                              ),
                            );
                          }),
                          onPressed: (int newIndex) {
                            selectedDate = date[newIndex];
                            setState(() {
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
                  const SizedBox(height: 20),
                  StreamBuilder<QuerySnapshot>(
                    stream: firestoreService.getCinema(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List cinemaList = snapshot.data!.docs;

                        return ExpansionPanelList(
                          expandIconColor: Colors.white,
                          animationDuration: const Duration(milliseconds: 300),
                          children: [
                            for (int i = 0; i < cinemaList.length; i++)
                              ExpansionPanel(
                                backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
                                headerBuilder: (context, isExpanded) {
                                  return ListTile(
                                    title: Text(
                                      cinemaList[i]['place_name'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                },
                                body: Padding(
                                  padding: const EdgeInsets.only(right: 15, left: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Reguler 2D',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Rp ${cinemaList[i]['price'].toString()}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        children: [
                                          for (int j = 0; j < (cinemaList[i]['hour'].length/2).ceil(); j++)
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  if (j < (cinemaList[i]['hour'].length/2).ceil())
                                                    Expanded(
                                                      child: TextButton(
                                                        onPressed: () {
                                                          selectedCinemaName = cinemaList[i]['place_name'];
                                                          selectedHour = cinemaList[i]['hour'][j];
                                                          selectedPrice = cinemaList[i]['price'];
                                                          Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                              builder: (context) => BookingScreen(widget.apiData.title, widget.apiData.posterPath, selectedDate, selectedCinemaName, selectedHour, selectedPrice),
                                                            ),
                                                          );
                                                        },
                                                        style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              const Color.fromRGBO(247, 67, 70, 1),
                                                        ),
                                                        child: Text(
                                                          cinemaList[i]['hour'][j],
                                                          style: const TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  const SizedBox(width: 10),
                                                  if (j + (cinemaList[i]['hour'].length/2).ceil() < cinemaList[i]['hour'].length)
                                                    Expanded(
                                                      child: TextButton(
                                                        onPressed: () {
                                                          selectedCinemaName = cinemaList[i]['place_name'];
                                                          selectedHour = cinemaList[i]['hour'][j];
                                                          selectedPrice = cinemaList[i]['price'];
                                                          Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                              builder: (context) => BookingScreen(widget.apiData.title, widget.apiData.posterPath, selectedDate, selectedCinemaName, selectedHour, selectedPrice),
                                                            ),
                                                          );
                                                        },
                                                        style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              const Color.fromRGBO(247, 67, 70, 1),
                                                        ),
                                                        child: Text(
                                                          cinemaList[i]['hour'][j + (cinemaList[i]['hour'].length/2).ceil()],
                                                          style: const TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                                isExpanded: isExpanded[i],
                                canTapOnHeader: true,
                              ),
                          ],
                          dividerColor: Colors.grey,
                          expansionCallback: (index, isExpand) {
                            setState(() {
                              isExpanded[index] = !isExpanded[index];
                            });
                          },
                        );
                      } else {
                        return const Text('Cinema data not found');
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



