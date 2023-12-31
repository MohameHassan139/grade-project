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
    category: 'Sport',
    id: 1,
    imgUrl: imgList[0],
    title: 'fake news by me',
    
  ),
  NewsItem(
    author: 'mohamed hassa',
    category: 'madicale',
    id: 1,
    imgUrl: imgList[1],
    title: 'fake news by me',
  ),
  NewsItem(
    author: 'mohamed hassa',
    category: 'political',
    id: 1,
    imgUrl: imgList[2],
    title:
        'fake news by me and long text to test over full .............. webview_flutter _wkwebview  2.9.5 (3.9.1 available)',
  ),
  NewsItem(
    author: 'mohamed hassa',
    category: 'Sport',
    id: 1,
    imgUrl: imgList[3],
    title: 'fake news by me',
  ),
  NewsItem(
    author: 'mohamed hassa',
    category: 'econemmic',
    id: 1,
    imgUrl: imgList[4],
    title: 'fake news by me',
  ),
  NewsItem(
    author: 'CNNA',
    category: 'Science',
    id: 1,
    imgUrl: imgList[5],
    title: 'fake news by me',
  ),
];

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
