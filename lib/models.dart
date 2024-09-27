class Blog {
  final String id;
  final String name;
  final String location;

  const Blog({
    required this.id,
    required this.name,
    required this.location,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'name': String name,
        'location': String location,
      } =>
        Blog(
          id: id ,
          name: name,
          location: location,
        ),
      _ => throw const FormatException('Failed to load data.'),
    };
  }
}