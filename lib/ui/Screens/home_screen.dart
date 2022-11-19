import 'package:flutter/material.dart';
import 'package:flutterapi/models/movie.dart';
import 'package:flutterapi/services/api_service.dart';
import 'package:flutterapi/utile/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> ?movies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
  }
  void getMovies(){
  ApiService().getPopularMovie(pageNumber: 1).then((movielist){
 setState(() {
   movies = movielist;
 });
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Image.asset('asset/images/net3.png'),
      ),
      body: ListView(
        children: [
          Container(
            color: kPrimaryColor,
            height: 500,
            child: movies== null ? const Center():Image.network(movies![0].posterURL()),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Tendances actuelles",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 110,
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.yellow,
                    child: Center(
                      child: Text(index.toString()),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Films actuellement au cinema",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 320,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 220,
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.blue,
                    child: Center(
                      child: Text(index.toString()),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Ils arrivent bientot",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 110,
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.green,
                    child: Center(
                      child: Text(index.toString()),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
