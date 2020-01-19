class Store {
  final String id;
  final String slug;
  final String name;
  final String description;
  final String logo;
  final String banner;
  final String type;

  Store({this.id, this.slug, this.name, this.description, this.logo, this.banner, this.type});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
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