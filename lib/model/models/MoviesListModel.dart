class MoviesListModel {
  List<Movies>? movies;

  MoviesListModel({this.movies});

  MoviesListModel.fromJson(Map<String, dynamic> json) {
    movies = json["movies"] == null
        ? null
        : (json["movies"] as List).map((e) => Movies.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (movies != null) {
      _data["movies"] = movies
          ?.map((e) => e.toJson())
          .toList(); //'e' is the each item in the list
    }
    return _data;
  }
}

class Movies {
  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  String? contentRating;
  String? duration;
  String? releaseDate;
  int? averageRating;
  String? originalTitle;
  String? storyline;
  List<String>? actors;
  String? imdbRating;
  String? posterurl;

  Movies(
      {this.id,
      this.title,
      this.year,
      this.genres,
      this.ratings,
      this.poster,
      this.contentRating,
      this.duration,
      this.releaseDate,
      this.averageRating,
      this.originalTitle,
      this.storyline,
      this.actors,
      this.imdbRating,
      this.posterurl});

  Movies.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    year = json["year"];
    genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
    ratings = json["ratings"] == null ? null : List<int>.from(json["ratings"]);
    poster = json["poster"];
    contentRating = json["contentRating"];
    duration = json["duration"];
    releaseDate = json["releaseDate"];
    averageRating = json["averageRating"];
    originalTitle = json["originalTitle"];
    storyline = json["storyline"];
    actors = json["actors"] == null ? null : List<String>.from(json["actors"]);
    imdbRating = json["imdbRating"];
    posterurl = json["posterurl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["year"] = year;
    if (genres != null) {
      _data["genres"] = genres;
    }
    if (ratings != null) {
      _data["ratings"] = ratings;
    }
    _data["poster"] = poster;
    _data["contentRating"] = contentRating;
    _data["duration"] = duration;
    _data["releaseDate"] = releaseDate;
    _data["averageRating"] = averageRating;
    _data["originalTitle"] = originalTitle;
    _data["storyline"] = storyline;
    if (actors != null) {
      _data["actors"] = actors;
    }
    _data["imdbRating"] = imdbRating;
    _data["posterurl"] = posterurl;
    return _data;
  }
}
