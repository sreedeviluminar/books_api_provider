import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/book_controller.dart';
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final booksProvider = Provider.of<BooksProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Books API Example'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               hintText: 'Search books',
//               prefixIcon: Icon(Icons.search),
//             ),
//             onSubmitted: (value) {
//               booksProvider.fetchBooks(value);
//             },
//           ),
//           Expanded(
//             child: Consumer<BooksProvider>(
//               builder: (context, booksProvider, child) {
//                 final books = booksProvider.books;
//                 return ListView.builder(
//                   itemCount: books.length,
//                   itemBuilder: (context, index) {
//                     final book = books[index];
//                     return ListTile(
//                       leading: Image.network(book.thumbnailUrl),
//                       title: Text(book.title),
//                       subtitle: Text(book.author),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Books API Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search books',
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                booksProvider.fetchMoreBooks(value);
              },
            ),
          ),
          Expanded(
            child: Consumer<BooksProvider>(
              builder: (context, booksProvider, child) {
                final books = booksProvider.books;
                return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return ListTile(
                      leading: Image.network(book.thumbnailUrl),
                      title: Text(book.title),
                      subtitle: Text(book.author),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Load more books
              booksProvider.fetchMoreBooks('your_query');
            },
            child: Text('Load More'),
          ),
        ],
      ),
    );
  }
}