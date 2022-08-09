class Category {
  String title;
  String imageURl;

  Category({required this.title, required this.imageURl});
}

List<Category> categories = [
  Category(title: 'Rock Music', imageURl: 'assets/images/rock_music.png'),
  Category(title: 'Hip Hop Music', imageURl: 'assets/images/hip_hop_music.png'),
  Category(title: 'Jazz Music', imageURl: 'assets/images/jazz_music.png'),
  Category(title: 'Rap Music', imageURl: 'assets/images/rap_music.png')
];
