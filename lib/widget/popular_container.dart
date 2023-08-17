import 'package:flutter/material.dart';
import 'package:music_app/models/songs.dart';
import 'package:music_app/screens/item_screen.dart';

class PopularContainer extends StatelessWidget {
  final Songs song;
  const PopularContainer({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ItemScreen(song: song)));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(children: [
          Container(
              height: 60 * MediaQuery.of(context).size.height / 740,
              width: 90 * MediaQuery.of(context).size.width / 360,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(song.artworkUrl100!),
                      fit: BoxFit.fill))),
          SizedBox(width: 10 * MediaQuery.of(context).size.width / 360),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(song.trackName!,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 14)),
              Text(song.artistName!,
                  style: Theme.of(context).textTheme.bodyText1),
              Text('00:30',
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
