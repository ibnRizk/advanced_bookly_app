import 'package:advanced_bookly_app/Features/home/domin/entities/book_entities.dart';
import 'package:advanced_bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntities>>> featchFeaturedBooks();
  Future<Either<Failure, List<BookEntities>>> featchNewestBooks();
}
