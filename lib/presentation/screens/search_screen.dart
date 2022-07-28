import 'package:books/presentation/screens/books_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../app/constants/constants.dart';
import '../../app/notifiers/app_notifier.dart';
import '../../core/model/Books.dart';
import 'detail_screen.dart';

class CustomSearchDelegate extends SearchDelegate {
  final _random = math.Random();
  String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
    // return [
    //   IconButton(
    //       onPressed: () {
    //         query = "";
    //       },
    //       icon: const Icon(Icons.clear))
    // ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Consumer<AppNotifier>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.searchBookData(searchBook: query),
          builder: (context, AsyncSnapshot<Books> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Opps! Try again later!"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.items?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    id: snapshot.data?.items?[index].id,
                                    boxColor: AppColors.lightBlue,
                                  )));
                    },
                    leading: Image.network(
                        "${snapshot.data?.items?[index].volumeInfo?.imageLinks?.thumbnail ?? errorLink}"),
                    title: Text(
                      "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Not Found"}",
                    ),
                    subtitle: Text(
                      "${snapshot.data?.items![index].volumeInfo?.title}",
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.black,
              ),
            );
          },
        );
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    return Consumer<AppNotifier>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.searchBookData(searchBook: "Biography"),
          builder: (context, AsyncSnapshot<Books> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Opps! Try again later!"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      id: snapshot.data?.items?[index].id,
                                      boxColor: AppColors.lightBlue,
                                    )));
                      },
                      leading: Image.network(
                          "${snapshot.data?.items?[index].volumeInfo?.imageLinks?.thumbnail ?? errorLink}"),
                      title: Text(
                        "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Not Found"}",
                      ),
                      subtitle: Text(
                          "${snapshot.data?.items![index].volumeInfo?.title}"));
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.black,
              ),
            );
          },
        );
      },
    );
    throw UnimplementedError();
  }
}
