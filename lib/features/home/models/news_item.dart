class NewsItem {
  final int id;
  final String title;
  final String imgUrl;
  final String category;
  final String author;
  final String time;
  final bool isFovarite;

  NewsItem({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.category,
    required this.author,
    this.time = '6 minte ago',
    this.isFovarite = false,
  });

  NewsItem copyWith({
    int? id,
    String? title,
    String? imgUrl,
    String? category,
    String? author,
    String? time,
    bool? isFovarite,
  }) {
    return NewsItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      category: category ?? this.category,
      author: author ?? this.author,
      isFovarite: isFovarite ?? this.isFovarite,
    );
  }
}

List<NewsItem> news = [
  NewsItem(
    author: 'mohamed hassa',
    category: 'bedroom',
    id: 1,
    imgUrl: imgList[0],
    title: 'fake news by me',
  ),
  NewsItem(
    author: 'mohamed hassa',
    category: 'salon',
    id: 1,
    imgUrl: imgList[1],
    title: 'fake news by me',
  ),
  NewsItem(
    author: 'mohamed hassa',
    category: 'sallon',
    id: 1,
    imgUrl: imgList[2],
    title:
        'fake news by me and long text to test over full .............. webview_flutter _wkwebview  2.9.5 (3.9.1 available)',
  ),
  NewsItem(
    author: 'mohamed hassa',
    category: 'live room',
    id: 1,
    imgUrl: imgList[3],
    title: 'fake news by me',
  ),
  NewsItem(
    author: 'mohamed hassa',
    category: 'live room',
    id: 1,
    imgUrl: imgList[4],
    title: 'fake news by me',
  ),
  NewsItem(
    author: 'CNNA',
    category: 'salon',
    id: 1,
    imgUrl: imgList[5],
    title: 'fake news by me',
  ),
];

final List<String> imgList = [
  'https://ledworld.com.au/wp-content/uploads/2018/08/LEDWorldParisRoseHairArtistrySalon05-1030x688.jpg',
  'https://ledworld.com.au/wp-content/uploads/2018/08/LEDWorldParisRoseHairArtistrySalon05-1030x688.jpg',
  'https://ledworld.com.au/wp-content/uploads/2018/11/Paris-Rose-Hair-Salon-3-599x374.jpg',
  'https://ledworld.com.au/wp-content/uploads/2018/08/LEDWorldParisRoseHairArtistrySalon15.jpg',
  'https://hendrxhair.co/wp-content/uploads/2018/04/ISKA_028.jpg',
  'https://hendrxhair.co/wp-content/uploads/2018/04/ISKA_028.jpg',
];
