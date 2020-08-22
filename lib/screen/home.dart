import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshows/model/model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:myshows/widgets/newMovies.dart';
import 'package:myshows/widgets/video_screen.dart';
import 'package:page_indicator/page_indicator.dart';
import '../styles/theame.dart' as Style;
import '../bloc/bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);
  @override
  void initState() {
    super.initState();
    contactBloc..getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(
          EvaIcons.menu2Outline,
          color: Colors.white,
        ),
        title: Text("Movies"),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.searchOutline,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: [
          StreamBuilder(
            stream: contactBloc.subject.stream,
            builder: (context, snapshot) {
              List<Movie> contact = snapshot.data;
              if (snapshot.hasData) {
                return Container(
                  height: 220.0,
                  child: PageIndicatorContainer(
                    align: IndicatorAlign.bottom,
                    length: contact.take(5).length,
                    indicatorSpace: 8.0,
                    padding: const EdgeInsets.all(5.0),
                    indicatorColor: Style.Colors.titleColor,
                    indicatorSelectorColor: Style.Colors.secondColor,
                    shape: IndicatorShape.circle(size: 5.0),
                    pageView: PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: contact.take(10).length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => MyHomePage(contact[index].link,contact[index].imglink,contact[index].desc),)),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: contact[index].name,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 220.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              contact[index].imglink)),
                                    )),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      stops: [
                                        0.0,
                                        0.9
                                      ],
                                      colors: [
                                        Style.Colors.mainColor.withOpacity(1.0),
                                        Style.Colors.mainColor.withOpacity(0.0)
                                      ]),
                                ),
                              ),
                              Positioned(
                                  bottom: 0.0,
                                  top: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Icon(
                                    FontAwesomeIcons.playCircle,
                                    color: Style.Colors.secondColor,
                                    size: 40.0,
                                  )),
                              Positioned(
                                  bottom: 30.0,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    width: 250.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          contact[index].name,
                                          style: TextStyle(
                                              height: 1.5,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ));
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Container(
              height: 25,
              width: MediaQuery.of(context).size.width / 4,
              child: Text(
                "New Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          NewMoviesScreen(),
          
        ],
      ),
    );
  }
}
