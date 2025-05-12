import 'package:advanced_bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../presentation/views/domin/entities/book_entities.dart';

abstract class HomeLocalDataSource {
  List<BookEntities> featchFeaturedBooks();
  List<BookEntities> featchNewestBooks();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntities> featchFeaturedBooks() {
    var box = Hive.box<BookEntities>(kFeaturedBooks);
    return box.values.toList();
  }

  @override
  List<BookEntities> featchNewestBooks() {
    var box = Hive.box<BookEntities>(kNewsetBooks);
    return box.values.toList();
  }
}
