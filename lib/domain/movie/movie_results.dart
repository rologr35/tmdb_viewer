

class PageResults<T> {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<T> results;

  PageResults({required this.page, required this.totalPages, required this.results, required this.totalResults});

  factory PageResults.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) => PageResults(
      page: json['page'],
      results: (json['results'] as List<dynamic>)
      .map((item) => fromJsonT(item as Map<String, dynamic>))
      .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results']
  );
}