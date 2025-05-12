class BookEntities {
  final String? image;
  final String title;
  final String? autherName;
  final num? price;
  final String bookId;
  final num? rating;

  BookEntities({
    required this.bookId,
    required this.image,
    required this.title,
    required this.autherName,
    required this.price,
    required this.rating,
  });
}
