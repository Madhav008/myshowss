import 'package:flutter/material.dart';
import 'package:myshows/bloc/bloc.dart';
import 'package:myshows/model/model.dart';
import 'package:myshows/widgets/video_screen.dart';

class AllMoveisScreen extends StatefulWidget {
  @override
  _AllMoveisScreenState createState() => _AllMoveisScreenState();
}

class _AllMoveisScreenState extends State<AllMoveisScreen> {
  @override
  void initState() {

    super.initState();
    contactBloc..getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: contactBloc.subject.stream,
        builder: (context, snapshot) {
          List<Movie> movies = snapshot.data;
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                if (snapshot.hasData) {
                  return Card(
                    elevation: 0.3,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                  movies[index].link,
                                  movies[index].imglink,
                                  movies[index].desc,
                                  movies[index].name,
                                )),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 220.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(movies[index].imglink),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
