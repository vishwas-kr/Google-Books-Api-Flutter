import 'package:http/http.dart' as http;

class BookApi {
  Future getBooks() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=Fiction&maxResults=40"),
      // headers: headers,
    );

    var body = response.body;
    //print(body);
    return body;
  }

  Future searchBooks({required String searchBook}) async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=$searchBook&maxResults=39"),
      // headers: headers,
    );

    var body = response.body;
    //print(body);
    return body;
  }

  Future showBooksDetails({required String id}) async {
    final response = await http.get(
      Uri.parse("https://www.googleapis.com/books/v1/volumes/$id"),
    );

    var body = response.body;
    //print(body);
    return body;
  }

//Amine Books
  Future getBooks2() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=amine+manga&maxResults=39"),
    );

    var body = response.body;
    //print(body);
    return body;
  }

//Adventure Books
  Future getBooks3() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=action+adventure&maxResults=39"),
    );

    var body = response.body;
    //print(body);
    return body;
  }

  //Novel
  Future getBooks4() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=novel&maxResults=39"),
    );

    var body = response.body;
    //print(body);
    return body;
  }

  //Horror Books
  Future getBooks5() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=horroe&maxResults=39"),
    );

    var body = response.body;
    //print(body);
    return body;
  }
}
