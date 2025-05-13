import 'package:advanced_bookly_app/Features/home/data/data_source/home_local_data_source.dart';
import 'package:advanced_bookly_app/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:advanced_bookly_app/Features/home/presentation/views/domin/entities/book_entities.dart';
import 'package:advanced_bookly_app/Features/home/presentation/views/domin/repos/home_repo.dart';
import 'package:advanced_bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntities>>> featchFeaturedBooks() async {
    try {
      var booksList = homeLocalDataSource.featchFeaturedBooks();
      if (booksList.isEmpty) {
        return right(booksList);
      }

      var books = await homeRemoteDataSource.featchFeaturedBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntities>>> featchNewestBooks() async {
    try {
      var booksList = homeLocalDataSource.featchNewestBooks();
      if (booksList.isEmpty) {
        return right(booksList);
      }

      var books = await homeRemoteDataSource.featchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
