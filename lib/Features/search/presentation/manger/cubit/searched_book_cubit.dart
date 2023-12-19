import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'searched_book_state.dart';

class SearchedBookCubit extends Cubit<SearchedBookState> {
  SearchedBookCubit(this.homeRepo) : super(SearchedBookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSearchedBooks({required String category}) async {
    emit(SearchedBooksLoading());
    var result = await homeRepo.fetchSearchedBooks(category: category);
    // ignore: non_constant_identifier_names
    result.fold((Failure) {
      emit(SearchedBookFailure(Failure.errMessage));
    }, (books) {
      emit(SearchedBookSuccess(books));
    });
  }
}
