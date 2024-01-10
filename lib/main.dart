
import 'package:books_api_provider/widget/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/book_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BooksProvider(),
      child: MaterialApp(
        title: 'Google Books API Example',
        home: HomeScreen(),
      ),
    );
  }
}
/*
*
ChangeNotifierProvider is a widget provided by the Provider package.
* It's used to provide an instance of a ChangeNotifier (or any class that extends ChangeNotifier)
* to the widget tree.
* create parameter in ChangeNotifierProvider
* expects a function that returns an instance of the provided class.
* In this case, it creates an instance of BooksProvider and provides it to the entire app.
* */
///In Provider, widgets that consume data are typically wrapped within
///Consumer widgets or use Provider.of to access the provided data.
///Consumers (widgets) subscribe to changes in the provided data and
///rebuild their UI when that data changes.
///This helps in efficiently updating only the necessary parts of the UI.