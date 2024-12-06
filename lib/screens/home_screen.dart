import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:uas_utix/api/api.dart';
import 'package:uas_utix/api_constants.dart';
import 'package:uas_utix/models/movie_genre.dart';
import 'package:uas_utix/models/movies_model.dart';
import 'package:uas_utix/providers/auth_provider.dart';
import 'package:uas_utix/screens/fnb_screen.dart';
import 'package:uas_utix/screens/movie_detail_screen.dart';
import 'package:uas_utix/screens/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  }
class _HomeScreenState extends State<HomeScreen> {
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
                        'Bandung',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
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
                        return Center(child: Text(snapshot.error.toString(), style: const TextStyle(color: Colors.white)));
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
                                  child: Column(
                                    children: [
                                      Image.network(
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                        '${ApiConstants.imagePath}${snapshot.data![itemIndex].posterPath}',
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        snapshot.data![itemIndex].title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: 500,
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