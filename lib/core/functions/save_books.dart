import 'package:hive/hive.dart';

import '../../Features/home/domin/entities/book_entities.dart';

void safeData(List<BookEntities> books, String boxname) {
  var box = Hive.box(boxname);
  box.addAll(books);
}
