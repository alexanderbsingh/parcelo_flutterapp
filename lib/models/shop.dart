class Shop {
  final String id;
  final String slug;
  final String name;
  final String description;
  final String logo;
  final String banner;
  final String type;

  Shop({this.id, this.slug, this.name, this.description, this.logo, this.banner, this.type});

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      logo: json['logo'],
      banner: json['banner'],
      type: json['type'],
    );
  }
}