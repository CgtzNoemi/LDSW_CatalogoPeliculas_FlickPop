class Character {
  final String name;
  final String imageUrl;

  Character({
    required this.name,
    required this.imageUrl,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      imageUrl: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
    );
  }
}




