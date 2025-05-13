import 'package:advanced_bookly_app/Features/home/domin/entities/book_entities.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../../../../core/use_cases/use_case.dart';
import '../repos/home_repo.dart';

class FetchNewestdBooksUseCase extends UseCase<List<BookEntities>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewestdBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntities>>> call([NoParam? param]) async {
    return await homeRepo.featchNewestBooks();
  }
}
