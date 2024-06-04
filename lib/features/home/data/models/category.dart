class Category {
  String? title;
  List<String>? selections;

  Category({required this.title, required this.selections});

  Category.fromJson(Map<String, dynamic> data) {
    title = data['title'] ?? '';
    selections = data['selections'] ?? [''];
  }
}
