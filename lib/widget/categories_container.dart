import 'package:flutter/material.dart';
import 'package:music_app/utils/categories.dart';

class CategoriesContainer extends StatelessWidget {
  final Category category;
  const CategoriesContainer({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150 * MediaQuery.of(context).size.height / 740,
          width: 245 * MediaQuery.of(context).size.width / 360,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(category.imageURl)),
              borderRadius: BorderRadius.circular(
                  30 * MediaQuery.of(context).size.height / 740)),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 35 * MediaQuery.of(context).size.height / 740,
            width: 240 * MediaQuery.of(context).size.width / 360,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xFF36474F).withOpacity(0.3),
                  const Color(0xFF2C3A40).withOpacity(0.3)
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        30 * MediaQuery.of(context).size.height / 740),
                    bottomRight: Radius.circular(
                        30 * MediaQuery.of(context).size.height / 740))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 8 * MediaQuery.of(context).size.height / 740,
                  horizontal: 20 * MediaQuery.of(context).size.width / 360),
              child: Text(category.title,
                  style: Theme.of(context).textTheme.headline2),
            ),
          ),
        ),
      ],
    );
  }
}
