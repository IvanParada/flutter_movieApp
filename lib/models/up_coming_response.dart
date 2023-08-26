import 'dart:convert';

import 'package:app_pelicula/models/models.dart';

class UpComingResponse {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  UpComingResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpComingResponse.fromJson(String str) =>
      UpComingResponse.fromMap(json.decode(str));

  factory UpComingResponse.fromMap(Map<String, dynamic> json) => UpComingResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
