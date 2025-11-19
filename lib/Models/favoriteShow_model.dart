class FavoriteshowModel {
  final int? id;
  final String title;
  final String genre;
  final String imageUrl;

  const FavoriteshowModel({
    this.id,
    required this.title,
    required this.genre,
    required this.imageUrl,
  });

  FavoriteshowModel copyWith({
    int? id,
    String? title,
    String? genre,
    String? imageUrl,
  }) {
    return FavoriteshowModel(
      id: id ?? this.id,
      title: title ?? this.title,
      genre: genre ?? this.genre,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
