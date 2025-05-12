import 'package:advanced_bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:advanced_bookly_app/core/utils/api_service.dart';

import '../../presentation/views/domin/entities/book_entities.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntities>> featchFeaturedBooks();
  Future<List<BookEntities>> featchNewestBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp(this.apiService);
  @override
  Future<List<BookEntities>> featchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming',
    );
    List<BookEntities> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntities>> featchNewestBooks() async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=subject:medical&sorting=newest',
    );
    List<BookEntities> books = getBooksList(data);
    return books;
  }

  List<BookEntities> getBooksList(Map<String, dynamic> data) {
    List<BookEntities> books = [];
    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
