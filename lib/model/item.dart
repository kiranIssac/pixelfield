class Item {
  final int id;
  final String title;
  final String image;

  Item({required this.id, required this.title,required this.image});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
     image: json['image']
    );
  }
}
