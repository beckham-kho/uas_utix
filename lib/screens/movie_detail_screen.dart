import 'package:flutter/material.dart';
import 'package:uas_utix/api_constants.dart';
import 'package:uas_utix/models/movies_model.dart';
import 'package:uas_utix/screens/booking_screen.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieModel apiData;
  const MovieDetailScreen(this.apiData, {super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool _expanded = false;
  List<bool> isSelected = [true, false, false, false, false];

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
                      borderRadius: BorderRadius.circular(10),
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
                          borderRadius: BorderRadius.circular(10),
                          isSelected: isSelected,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Mon, 25 Nov'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Tue, 26 Nov'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Wed, 27 Nov'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Thu, 28 Nov'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Fri, 29 Nov'),
                            ),
                          ],
                          onPressed: (int newIndex) {
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
                  ExpansionPanelList(
                    expandIconColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    children: [
                      ExpansionPanel(
                        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
                        headerBuilder: (context, isExpanded) {
                          return const ListTile(
                            title: Text(
                              'Paskal 23 CGV',
                              style: TextStyle(
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
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Reguler 2D',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    'Rp. 40.000',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => const BookingScreen())
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(247, 67, 70, 1),
                                      ),
                                      child: const Text(
                                        '10.00',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => const BookingScreen())
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(247, 67, 70, 1),
                                      ),
                                      child: const Text(
                                        '10.00',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        isExpanded: _expanded,
                        canTapOnHeader: true,
                      ),
                    ],
                    dividerColor: Colors.grey,
                    expansionCallback: (panelIndex, isExpanded) {
                      _expanded = !_expanded;
                      setState(() {});
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
