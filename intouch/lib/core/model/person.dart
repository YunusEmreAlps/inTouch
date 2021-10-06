// Dart imports:
import 'dart:convert';

List<Person> personFromJson(String str) =>
    List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String personToJson(List<Person> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Person {
  Person({
    this.registeredAt,
    this.name,
    this.twitterHandle,
    this.github,
    this.linkedin,
    this.interests,
    this.goals,
    this.slug,
    this.avatar,
    this.displayInterests,
    this.isHireable,
    this.mail,
    this.stackoverflow,
  });

  String registeredAt;
  String name;
  String twitterHandle;
  String github;
  String linkedin;
  String interests;
  String goals;
  String slug;
  String avatar;
  String displayInterests;
  bool isHireable;
  String mail;
  String stackoverflow;

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      registeredAt: json["registered_at"],
      name: json["name"],
      twitterHandle: json["twitter_handle"],
      github: json["github"],
      linkedin: json["linkedin"],
      interests: json["interests"],
      goals: json["goals"],
      slug: json["slug"],
      avatar: json["avatar"],
      displayInterests: json["displayInterests"],
      isHireable: json["isHireable"],
      mail: json["mail"] == null ? null : json["mail"],
      stackoverflow:json["stackoverflow"] == null ? null : json["stackoverflow"],
    );
  }

    Map<String, dynamic> toJson() => {
        "registered_at": registeredAt,
        "name": name,
        "twitter_handle": twitterHandle,
        "github": github,
        "linkedin": linkedin,
        "interests": interests,
        "goals": goals,
        "slug": slug,
        "avatar": avatar,
        "displayInterests": displayInterests,
        "isHireable": isHireable,
        "mail": mail == null ? null : mail,
        "stackoverflow": stackoverflow == null ? null : stackoverflow,
    };
}
