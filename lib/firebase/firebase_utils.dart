import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/model/NewReleases.dart';
// import 'package:movies/model/NewReleases.dart';

class FirebaseUtils {
  static CollectionReference<Movie> getMoviesCollection() {
    return FirebaseFirestore.instance.collection('movies').withConverter<Movie>(
          fromFirestore: (snapshot, option) => Movie.fromJson(snapshot.data()!),
          toFirestore: (movie, options) => movie.toJson(),
        );
  }

  static Future<void> addMovieToFireStore(Movie movie) {
    var movieCollection = getMoviesCollection();
    var docRef = movieCollection.doc(movie.id.toString());
    print(movie.id);
    print(movie.title);
    return docRef.set(movie);
  }

  static Future<List<Movie>> getAllMoviesFromFireStore() async {
    QuerySnapshot<Movie> querySnapshot =
        await FirebaseUtils.getMoviesCollection().get();
    var list = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    return list;
  }

  static Future<bool> isInWatchList(int movieId) async {
    var moviesList = await getAllMoviesFromFireStore();
    var sameIdList = moviesList.where((movie) {
      return movie.id == movieId;
    }).toList();
    if (sameIdList.isNotEmpty) {
      return true;
    }
    return false;
  }

  static Future<void> deleteMovieFromFireStore(Movie movie, int movieId) {
    return getMoviesCollection().doc(movie.id.toString()).delete();
  }
}
