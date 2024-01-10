class Book {
  final String title;
  final String author;
  final String thumbnailUrl;

  Book({required this.title, required this.author, required this.thumbnailUrl});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['volumeInfo']['title'],
      author: json['volumeInfo']['authors'] != null ? json['volumeInfo']['authors'][0] : 'Unknown',
      thumbnailUrl: json['volumeInfo']['imageLinks'] != null
          ? json['volumeInfo']['imageLinks']['thumbnail']
          : ['smallThumbnail'],
    );
  }
}
