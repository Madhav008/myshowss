// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<NewMovie> newmovieFromJson(String str) => List<NewMovie>.from(json.decode(str).map((x) => NewMovie.fromJson(x)));

String newmovieToJson(List<NewMovie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewMovie {
    NewMovie({
        this.name,
        this.link,
        this.imglink,
        this.category,
        this.desc,
    });

    String name;
    String link;
    String imglink;
    String category;
    String desc;

    factory NewMovie.fromJson(Map<String, dynamic> json) => NewMovie(
        name: json["name"],
        link: json["link"],
        imglink: json["imglink"],
        category: json["category"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "imglink": imglink,
        "category": category,
        "desc": desc,
    };
}
