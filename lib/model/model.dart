// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
    Movie({
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

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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
