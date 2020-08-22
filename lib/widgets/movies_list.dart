import '../styles/theame.dart' as Style;

import 'package:flutter/material.dart';
import 'package:myshows/model/new_movis_model.dart';

class MoviesList extends StatefulWidget {
  final List<NewMovie> movie;
  MoviesList({Key key, @required this.movie}) : super(key: key);
  @override
  _MoviesListState createState() => _MoviesListState(movie);
}

class _MoviesListState extends State<MoviesList>
    with SingleTickerProviderStateMixin {
  final List<NewMovie> movie;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: movie.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  _MoviesListState(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307.0,
      child: DefaultTabController(
          length: movie.length,
          child: Scaffold(
            backgroundColor: Style.Colors.mainColor,
            appBar: PreferredSize(
              child: AppBar(
                backgroundColor: Style.Colors.mainColor,
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Style.Colors.secondColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  unselectedLabelColor: Style.Colors.titleColor,
                  labelColor: Colors.white,
                  isScrollable: true,
                  tabs: movie.map((mov) {
                    return Container(
                        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                        child:  Text(mov.name.toUpperCase(),style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold
                        ),),
                    );
                  }).toList(),
                ),
              ),
              preferredSize: Size.fromHeight(50.0),
            ),
            body: TabBarView(children: null,
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),),
          )),
    );
  }
}
