import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  Headline({Key? key, required this.category}) : super(key: key);

  String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            "See All",
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
