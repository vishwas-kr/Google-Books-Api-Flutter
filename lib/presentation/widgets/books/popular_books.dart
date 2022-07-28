import 'package:books/core/model/Books.dart';
import 'package:books/presentation/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/constants.dart';
import '../../../app/notifiers/app_notifier.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AppNotifier>(context);
    return FutureBuilder(
        future: data.getBookData(),
        builder: (context, AsyncSnapshot<Books> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Opps! Try again later!"),
            );
          }
          if (snapshot.hasData) {
            // print(snapshot.data?.items![0].id);
            return LayoutBuilder(builder: (context, constraints) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                //itemCount: snapshot.data?.totalItems,
                itemCount: 30,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    id: snapshot.data?.items![index].id,
                                  )));
                    },
                    child: Container(
                      //width: width / 1.5,
                      width: constraints.maxWidth * 0.8,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Card(
                                elevation: 2,
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  //height: height * 0.18,
                                  // width: 100,
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth * 0.30,

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                      image: NetworkImage(
                                          "${snapshot.data?.items![index].volumeInfo?.imageLinks?.thumbnail}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: constraints.maxWidth * 0.03),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Censored"}",
                                    // maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        ?.copyWith(
                                          fontSize:
                                              constraints.maxWidth * 0.038,
                                        )),
                                Text(
                                    "${snapshot.data?.items![index].volumeInfo?.title}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(
                                            fontSize:
                                                constraints.maxWidth * 0.048)),
                                Text(
                                  "${snapshot.data?.items![index].volumeInfo!.categories?.length != 0 ? snapshot.data?.items![index].volumeInfo!.categories![0] : "Unknown"}",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                          fontSize:
                                              constraints.maxWidth * 0.038),
                                ),
                                const Spacer(),
                                Container(
                                  height: constraints.maxHeight * 0.2,
                                  width: constraints.maxWidth * 0.18,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    "\$${snapshot.data?.items![index].volumeInfo?.pageCount ?? "96.9"}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                const Spacer(
                                  flex: 2,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            });
          }
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.black,
          ));
        });
  }
}
