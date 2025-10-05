import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:movies/model/Categories.dart';
// import 'package:movies/model/NewReleases.dart';
import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/model/Categories.dart';
import 'package:movies_app/model/NewReleases.dart';

// import 'api_constants.dart';

class ApiManager {
  static Future<MoviesResponse> getPopular() async {
    /// https://api.themoviedb.org/3/movie/popular
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi,
        {"api_key": ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MoviesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MoviesResponse> searchMovie(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.searchApi,
        {"api_key": ApiConstants.apiKey, "query": query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MoviesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MoviesResponse> getNewReleases() async {
    /// https://api.themoviedb.org/3/movie/upcoming
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newReleasesApi,
        {"api_key": ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MoviesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MoviesResponse> getRecommended() async {
    /// https://api.themoviedb.org/3/movie/upcoming
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.recommendedApi,
        {"api_key": ApiConstants.apiKey});

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MoviesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MoviesResponse> getSimilar(int movieId) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl,
        '${ApiConstants.similarApi}$movieId${ApiConstants.similarApi2}',
        {"api_key": ApiConstants.apiKey});
    try {
      // print(movieId);
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      // print(json);
      return MoviesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Categories> getNameOfCategory() async {
    ///https://api.themoviedb.org/3/genre/movie/list
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.category,
        {"api_key": ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return Categories.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MoviesResponse> getBrowseCategories(int categoryId) async {
    /// https://api.themoviedb.org/3/discover/movie

    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.browseCategories,
        {"api_key": ApiConstants.apiKey, "with_genres": categoryId.toString()});

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print(json);
      return MoviesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
