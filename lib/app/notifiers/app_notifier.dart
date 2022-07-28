import 'dart:convert';

import 'package:books/core/api/api.dart';
import 'package:books/core/model/Books.dart';
import 'package:books/core/model/DetailModel.dart';
import 'package:flutter/cupertino.dart';

class AppNotifier extends ChangeNotifier {
  final BookApi bookApi = BookApi();
//Main api Books
  Future<Books> getBookData() async {
    var res = await bookApi.getBooks();
    //print(res);
    var data = jsonDecode(res);
    // print(data["items"][0]["volumeInfo"]["authors"]);
    // data["items"];

    return Books.fromJson(data);
  }

//Anime Books
  Future<Books> getBookData2() async {
    var res = await bookApi.getBooks2();
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

//Adventure Books
  Future<Books> getBookData3() async {
    var res = await bookApi.getBooks3();
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

  //Novel
  Future<Books> getBookData4() async {
    var res = await bookApi.getBooks4();
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

  //Horror Books
  Future<Books> getBookData5() async {
    var res = await bookApi.getBooks5();
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

//Searching Books
  Future<Books> searchBookData({required String searchBook}) async {
    var res = await bookApi.searchBooks(searchBook: searchBook);
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

//Showing Particular Book Details
  Future<DetailModel> showBookData({required String id}) async {
    var res = await bookApi.showBooksDetails(id: id);
    //print(res);
    var data = jsonDecode(res);

    return DetailModel.fromJson(data);
  }
}
