import 'package:hive/hive.dart';
part 'book_entities.g.dart';

@HiveType(typeId: 0)
class BookEntities {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? autherName;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final String bookId;
  @HiveField(5)
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
