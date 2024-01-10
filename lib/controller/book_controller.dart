import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/book_model.dart';
//
// class BooksProvider with ChangeNotifier {
//   List<Book> _books = [];
//
//   List<Book> get books => _books;
//
//   Future<void> fetchBooks(String query) async {
//     final response = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query'));
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> decodedData = json.decode(response.body);
//       if (decodedData['items'] != null) {
//         _books = decodedData['items']
//             .map<Book>((bookData) => Book.fromJson(bookData))
//             .toList();
//         notifyListeners();
//       }
//     } else {
//       throw Exception('Failed to load books');
//     }
//   }
// }

class BooksProvider with ChangeNotifier {
  List<Book> _books = [];
  int _startIndex = 0; // Track the start index for pagination

  List<Book> get books => _books;

  Future<void> fetchMoreBooks(String query) async {
    final response = await http.get(
        Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query&startIndex=$_startIndex'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      if (decodedData['items'] != null) {
        final List<Book> newBooks = decodedData['items']
            .map<Book>((bookData) => Book.fromJson(bookData))
            .toList();
        _books.addAll(newBooks);
        _startIndex += newBooks.length; // Update the start index for next pagination
        notifyListeners();
      }
    } else {
      throw Exception('Failed to load more books');
    }
  }
}
