import 'package:flutter/material.dart';
import 'package:music_app/screens/item_screen.dart';
import 'package:music_app/utils/music.dart';

class PopularContainer extends StatelessWidget {
  final Music music;
  const PopularContainer({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ItemScreen(song: music)));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(children: [
          Container(
              height: 60 * MediaQuery.of(context).size.height / 740,
              width: 90 * MediaQuery.of(context).size.width / 360,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(music.imageURL), fit: BoxFit.fill))),
          SizedBox(width: 10 * MediaQuery.of(context).size.width / 360),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(music.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 14)),
              Text(music.author, style: Theme.of(context).textTheme.bodyText1),
              Text(music.time,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 8, fontWeight: FontWeight.w200)),
            ],
          )
        ]),
      ),
    );
  }
}
