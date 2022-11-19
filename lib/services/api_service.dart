import 'package:dio/dio.dart';
import 'package:flutterapi/models/movie.dart';
import 'package:flutterapi/services/api.dart';

class ApiService {
  final Api api = Api();
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
// creation d'url
// paramettre present pour chaque requete
    String _url = api.baseURL + path;
    Map<String, dynamic> query = {
      'api_key': api.apikey,
      'language': 'fr-FR',
    };
// si params n'est pas null on ajoute son contenu à query
    if (params != null) {
      query.addAll(params);
    }
// on fait l'appel a api
    final response = await dio.get(_url, queryParameters: query);
// on verifie si le statuscode est bien 200 cad que la requete a reussie  avec succès
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getPopularMovie({required int pageNumber}) async {
    Response response = await getData('/movie/popular', params: {
      'page': pageNumber, 
    });
    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data['results'];
      List<Movie> movies = [];
      for (Map<String, dynamic> json in results) {
        Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;
    } else {
      throw response;
    }
  }
}
