import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  }
class _HomeScreenState extends State<HomeScreen> {
  //nanti pas mau pakai search harus pake onChange
  // final List<Product> _productList = productList;
  // List<Product> _foundProduct = [];
  
  // @override
  // void initState() {
  //   _foundProduct = _productList;
  //   super.initState();
  // }

  // void _runFilter(String enteredKeyword) {
  //   List<Product> results = [];
  //   if(enteredKeyword.isEmpty) {
  //     results = _productList;
  //   } else {
  //     results = _productList.where((product) => product.title.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
  //   }

  //   setState(() {
  //     _foundProduct = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white,),
        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
        title: Image.asset('img/logo_utix.png', width: 75),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(247, 67, 70, 1),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      Text(
                        'Jakarta',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Image.asset('img/logo_utix.png', width: 75,),
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Image.asset('img/logo_utix.png', width: 75,),
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Image.asset('img/logo_utix.png', width: 75,),
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Image.asset('img/logo_utix.png', width: 75,),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Now Playing',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white
                      ),
                    ),
                    InkWell(
                      child: const Text(
                        'See More',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(247, 67, 70, 1),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: MediaQuery.of(context).size.width/3-20,
                            color: const Color.fromRGBO(43, 43, 56, 1),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  //diisi poster film
                                  Text('Poster Film'),
                                ],
                              ),
                            ),
                          ),
                        )
                      );
                    },
                    itemCount: 10,
                  ),
                ),
                const SizedBox(height: 20,),
                const Center(
                  child: Text(
                    'Judul Film',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Special Offer Just for You!',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: MediaQuery.of(context).size.width-40,
                            color: const Color.fromRGBO(43, 43, 56, 1),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  //diisi gambar iklan
                                  Text('Gambar Iklan'),
                                ],
                              ),
                            ),
                          ),
                        )
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}