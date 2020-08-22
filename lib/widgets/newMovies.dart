import 'package:flutter/material.dart';
import 'package:myshows/bloc/get_newmovies.dart';
import 'package:myshows/model/new_movis_model.dart';
import 'package:myshows/widgets/video_screen.dart';

class NewMoviesScreen extends StatefulWidget {
  _NewMoviesScreenState createState() => _NewMoviesScreenState();
}

class _NewMoviesScreenState extends State<NewMoviesScreen> {
  @override
  void initState() {
    super.initState();
    newMoviesBloc..getNewMovie();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NewMovie>>(
      stream: newMoviesBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildNewMovieWidget(snapshot);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }
}

Widget _buildLoadingWidget() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 25.0,
        width: 25.0,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 4.0,
        ),
      )
    ],
  ));
}

Widget _buildErrorWidget(String error) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Error occured: $error"),
    ],
  ));
}

Widget _buildNewMovieWidget(snapshot) {
  List<NewMovie> newMovie = snapshot.data;

  if (newMovie.length == 0) {
    return Container(
      child: Text("No New Movies"),
    );
  } else
    return Container(
      height: 270.0,
      padding: EdgeInsets.only(left: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newMovie.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              right: 10.0,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                            newMovie[index].link,
                            newMovie[index].imglink,
                            newMovie[index].desc,
                            newMovie[index].name),
                      )),
                  child: Container(
                    width: 120.0,
                    height: 180.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(newMovie[index].imglink),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    width: 100.0,
                    child: Text(
                      newMovie[index].name,
                      style: TextStyle(
                        height: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  newMovie[index].category,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
}
