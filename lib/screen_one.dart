import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie/constants.dart';
import 'package:movie/service/networking.dart';
import 'package:movie/utils/text.dart';
import 'package:movie/widgets/tranding_movie_list.dart';
import 'package:movie/widgets/popular_rated.dart';
import 'package:movie/widgets/tranding_tv_shows.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  void initState() {
    super.initState();
    loadTrandingMovies();
    loadPopularMovies();
    loadTrandingTvShows();
  }

  String movieName = "";
  List trandingMoviesList = [];
  List mostPopular = [];
  List trandingTvShows = [];

  loadTrandingMovies() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.themoviedb.org/3/trending/all/day?api_key=efb3667d02be86f8a10050487f45ba5f');

    var currentMoviesData = await networkHelper.loadCurrentMovies();
    setState(() {
      trandingMoviesList = currentMoviesData['results'];
    });
    //print('');
  }

  loadPopularMovies() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=efb3667d02be86f8a10050487f45ba5f&language=en-US&page=1');
    var currentMoviesData = await networkHelper.loadCurrentMovies();
    mostPopular = currentMoviesData['results'];
  }

  loadTrandingTvShows() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.themoviedb.org/3/tv/popular?api_key=efb3667d02be86f8a10050487f45ba5f&language=en-US&page=1');

    var currentMoviesData = await networkHelper.loadCurrentMovies();
    trandingTvShows = currentMoviesData['results'];
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        loadTrandingMovies();
        loadPopularMovies();
        loadTrandingTvShows();
        print('sob set');
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(kBackgroundColor),
          title: HeadModifierText(
            text: 'Flutter movie App',
            color: Colors.white,
            size: 20.0,
          ),
        ),
        body: ListView(
          children: <Widget>[
            ToptvShows(Toptv: trandingTvShows),
            PopularRated(popularRated: mostPopular),
            TrandingMovies(
              trandingMovies: trandingMoviesList,
            )
          ],
        ),
      ),
    );
  }
}
