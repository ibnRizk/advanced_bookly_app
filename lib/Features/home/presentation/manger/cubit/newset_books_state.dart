part of 'newset_books_cubit.dart';

abstract class NewsetBooksState {}

final class NewsetBooksInitial extends NewsetBooksState {}

final class NewsetBookssLoading extends NewsetBooksState {}

final class NewsetBooksFailure extends NewsetBooksState {
  final String errMessage;

  NewsetBooksFailure(this.errMessage);
}

final class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookEntities> books;

  NewsetBooksSuccess(this.books);
}
