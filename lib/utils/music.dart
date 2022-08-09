class Music {
  final String title;
  final String imageURL;
  final String author;
  final bool isPopular;
  final bool isLatest;
  final String time;
  final bool isFavourite;

  Music({
    required this.title,
    required this.imageURL,
    required this.author,
    required this.isPopular,
    required this.isLatest,
    required this.time,
    required this.isFavourite,
  });
}

List<Music> songs = [
  Music(
      title: 'The Drum',
      imageURL: 'assets/images/the_drum.png',
      author: 'Alan Walker',
      isPopular: true,
      isLatest: false,
      time: '03 : 12',
      isFavourite: false),
  Music(
      title: 'Hope',
      imageURL: 'assets/images/hope.png',
      author: 'XXXTentacion',
      isPopular: true,
      isLatest: false,
      time: '02 : 46',
      isFavourite: false),
  Music(
      title: 'Infinity',
      imageURL: 'assets/images/infinity.png',
      author: 'Jaymes Young',
      isPopular: true,
      isLatest: true,
      time: '03 : 23',
      isFavourite: false),
  Music(
      title: 'Sunset Sun Sky',
      imageURL: 'assets/images/sunset_sun_sky.png',
      author: 'Walsan Robert',
      isPopular: false,
      isLatest: true,
      time: '03 : 23',
      isFavourite: false),
  Music(
      title: 'Dream On',
      imageURL: 'assets/images/dream_on.png',
      author: 'Roger Terry',
      isPopular: true,
      isLatest: true,
      time: '04 : 44',
      isFavourite: false),
  Music(
      title: 'Let Me Down Slowly',
      imageURL: 'assets/images/let_me_down_slowly.png',
      author: 'Alec Benjamin',
      isPopular: true,
      isLatest: true,
      time: '03 : 23',
      isFavourite: false),
  Music(
      title: 'Stay',
      imageURL: 'assets/images/stay.png',
      author: 'Justin Bieber',
      isPopular: false,
      isLatest: true,
      time: '02 : 46',
      isFavourite: false)
];
