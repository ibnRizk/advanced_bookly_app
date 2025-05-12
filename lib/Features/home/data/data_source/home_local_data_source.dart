import '../../presentation/views/domin/entities/book_entities.dart';

abstract class HomeLocalDataSource {
  List<BookEntities> featchFeaturedBooks();
  List<BookEntities> featchNewestBooks();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntities> featchFeaturedBooks() {
    throw UnimplementedError();
  }

  @override
  List<BookEntities> featchNewestBooks() {
    throw UnimplementedError();
  }
}
