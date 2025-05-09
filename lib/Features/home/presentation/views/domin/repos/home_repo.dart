import 'package:advanced_bookly_app/Features/home/presentation/views/domin/entities/book_entities.dart';

abstract class HomeRepo {
  Future<BookEntities> featchFeaturedBooks();
  Future<BookEntities> featchNewestBooks();
}
