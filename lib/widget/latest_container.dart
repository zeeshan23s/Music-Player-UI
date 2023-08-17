import 'package:flutter/material.dart';
import 'package:music_app/models/songs.dart';
import 'package:music_app/screens/item_screen.dart';

class LatestContainer extends StatelessWidget {
  final Songs song;
  const LatestContainer({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(song: song)));
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: 140 * MediaQuery.of(context).size.height / 740,
              width: 140 * MediaQuery.of(context).size.width / 360,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(song.artworkUrl100!),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(
                      30 * MediaQuery.of(context).size.height / 740))),
          SizedBox(height: 5 * MediaQuery.of(context).size.height / 740),
          Padding(
            padding: EdgeInsets.only(
                left: 10 * MediaQuery.of(context).size.width / 360),
            child: SizedBox(
              width: 50 * MediaQuery.of(context).size.width / 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(song.trackName!,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(fontSize: 14),
                      overflow: TextOverflow.ellipsis),
                  Text(song.artistName!,
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
