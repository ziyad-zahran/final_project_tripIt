import 'package:flutter/material.dart';
import 'model.dart';

class BuildLocationItem extends StatelessWidget {
  const BuildLocationItem({Key? key, required this.locationItem})
      : super(key: key);
  final LocationItem locationItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(
              locationItem.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                locationItem.country,
                style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                locationItem.city,
                style: TextStyle(color: Colors.white, fontSize: 25,),
              ),
            ],
          ),
        ));
  }
}
