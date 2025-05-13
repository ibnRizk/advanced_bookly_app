import 'package:advanced_bookly_app/Features/home/domin/use_cases/fetch_newest_books_use_case.dart';
import 'package:bloc/bloc.dart';

import '../../../domin/entities/book_entities.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewestdBooksUseCase) : super(NewsetBooksInitial());
  final FetchNewestdBooksUseCase fetchNewestdBooksUseCase;
  Future<void> featchFeaturedBooks() async {
    emit(NewsetBooksInitial());

    var result = await fetchNewestdBooksUseCase.call();
    result.fold(
      (failure) {
        emit(NewsetBooksFailure(failure.errorMessage));
      },
      (books) {
        emit(NewsetBooksSuccess(books));
      },
    );
  }
}
