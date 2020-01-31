class Category {
  final String slug;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;


  Category({this.slug, this.name, this.description, this.createdAt, this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']
    );
  }
}