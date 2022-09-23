import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favourite",
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
        ),
      ),
    );
  }
}
