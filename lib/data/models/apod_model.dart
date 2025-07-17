class ApodModel {
  final String title;
  final String explanation;
  final String url;
  final String date;

  ApodModel({
    required this.title,
    required this.explanation,
    required this.url,
    required this.date,
  });

  factory ApodModel.fromJson(Map<String, dynamic> json) {
    return ApodModel(
      title: json['title'] ?? '',
      explanation: json['explanation'] ?? '',
      url: json['url'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
