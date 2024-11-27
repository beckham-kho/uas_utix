import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:uas_utix/api/api.dart';
import 'package:uas_utix/api_constants.dart';
import 'package:uas_utix/models/movie_genre.dart';
import 'package:uas_utix/models/movies_model.dart';
import 'package:uas_utix/screens/movie_detail_screen.dart';

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

  late Future<List<MovieModel>> nowPlayingMovies;

  @override
  void initState() {
    super.initState();
    nowPlayingMovies = Api().getNowPlayingMovies();
  }

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
                        'Paskal 23 - CGV - Bandung',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                    Column(
                      children: [
                        InkWell(
                          onTap: () {

                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Image.asset('img/menu_movies.png', width: 75,),
                        ),
                        const Text(
                          'Movies',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Image.asset('img/menu_fnb.png', width: 75,),
                        ),
                        const Text(
                          'FnB',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        InkWell (
                          onTap: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Image.asset('img/menu_promo.png', width: 75,),
                        ),
                        const Text(
                          'Promo',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Now Playing',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  child: FutureBuilder(
                    future: nowPlayingMovies,
                    builder: (context, snapshot) {
                      if(snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if(snapshot.hasData) {
                        return CarouselSlider.builder(
                          itemCount: 10,
                          itemBuilder: (context, itemIndex, pageViewIndex) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: 200,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => MovieDetailScreen(snapshot.data![itemIndex]))
                                    );
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${ApiConstants.imagePath}${snapshot.data![itemIndex].posterPath}',
                                  ),
                                )
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: 300,
                            autoPlay: true,
                            viewportFraction: 0.55,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            pauseAutoPlayOnManualNavigate: true,
                            pageSnapping: true,
                            autoPlayAnimationDuration: const Duration(seconds: 2)
                          ),
                        );
                      } else {
                        return const Center(child: RefreshProgressIndicator());
                      }
                    }
                  )
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
                CarouselSlider.builder(
                  itemCount: 3, 
                  itemBuilder: (context, itemIndex, pageViewIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: const Color.fromRGBO(43, 43, 56, 1),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 0.8,
                    pageSnapping: true,
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