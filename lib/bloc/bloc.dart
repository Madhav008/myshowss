import 'package:myshows/model/model.dart';
import 'package:rxdart/rxdart.dart';
import '../repository/respositry.dart';
class ContactListBloc {


  final BehaviorSubject<List<Movie>> _subject =
      BehaviorSubject<List<Movie>>();

  getContacts() async {
    List<Movie> response = await getContact();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<Movie>> get subject => _subject;
  
}
final contactBloc = ContactListBloc();