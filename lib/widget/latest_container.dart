import 'package:flutter/material.dart';
import 'package:music_app/screens/item_screen.dart';
import 'package:music_app/utils/music.dart';

class LatestContainer extends StatelessWidget {
  final Music music;
  const LatestContainer({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(song: music)));
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: 140 * MediaQuery.of(context).size.height / 740,
              width: 140 * MediaQuery.of(context).size.width / 360,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(music.imageURL)),
                  borderRadius: BorderRadius.circular(
                      30 * MediaQuery.of(context).size.height / 740))),
          SizedBox(height: 5 * MediaQuery.of(context).size.height / 740),
          Padding(
            padding: EdgeInsets.only(
                left: 10 * MediaQuery.of(context).size.width / 360),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(music.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 14)),
                Text(music.author,
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
