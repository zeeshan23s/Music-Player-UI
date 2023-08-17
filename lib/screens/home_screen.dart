import 'package:flutter/material.dart';
import 'package:music_app/models/songs.dart';
import 'package:music_app/services/song_controller.dart';
import 'package:music_app/utils/categories.dart';
import 'package:music_app/utils/music.dart';
import 'package:music_app/widget/categories_container.dart';
import 'package:music_app/widget/latest_container.dart';
import 'package:music_app/widget/popular_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Music> popularSongs = songs.where((song) => song.isPopular).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              RadialGradient(colors: [Color(0xFF36474F), Color(0xFF28353B)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: 30 * MediaQuery.of(context).size.height / 740,
                left: 10 * MediaQuery.of(context).size.width / 360,
                right: 10 * MediaQuery.of(context).size.width / 360,
                bottom: 2 * MediaQuery.of(context).size.height / 740),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10 * MediaQuery.of(context).size.width / 360),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Category',
                          style: Theme.of(context).textTheme.headline1),
                      const Icon(Icons.favorite)
                    ],
                  ),
                ),
                SizedBox(
                  height: 150 * MediaQuery.of(context).size.height / 740,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) =>
                          CategoriesContainer(category: categories[index])),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10 * MediaQuery.of(context).size.width / 360),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Latest',
                          style: Theme.of(context).textTheme.headline1),
                      Text('See more',
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                ),
                SizedBox(
                    height: 190 * MediaQuery.of(context).size.height / 740,
                    child: FutureBuilder<List<Songs>>(
                        future: SongController.latestSongs(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (!snapshot.hasData) {
                            return const Center(
                              child: Text('No data available'),
                            );
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) =>
                                  LatestContainer(song: snapshot.data![index]),
                            );
                          }
                        })),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10 * MediaQuery.of(context).size.width / 360),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular',
                          style: Theme.of(context).textTheme.headline1),
                      Text('See more',
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                ),
                SizedBox(
                    height: 190 * MediaQuery.of(context).size.height / 740,
                    child: FutureBuilder<List<Songs>>(
                        future: SongController.popularSongs(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (!snapshot.hasData) {
                            return const Center(
                              child: Text('No data available'),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) =>
                                  PopularContainer(song: snapshot.data![index]),
                            );
                          }
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
