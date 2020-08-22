import 'package:myshows/model/new_movis_model.dart';
import 'package:rxdart/rxdart.dart';
import '../repository/respositry.dart';
class NewMovieListBloc {


  final BehaviorSubject<List<NewMovie>> _subject =
      BehaviorSubject<List<NewMovie>>();

  getNewMovie() async {
    List<NewMovie> response = await getNewMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<NewMovie>> get subject => _subject;
  
}
final newMoviesBloc = NewMovieListBloc();