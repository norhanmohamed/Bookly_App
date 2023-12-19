import 'package:bookly/Features/home/data/repo/home_repo_implement.dart';
import 'package:bookly/Features/search/presentation/manger/cubit/searched_book_cubit.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly/core/utils/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    Key? key,
    //  required this.bookModel,
  }) : super(key: key);
//  final BookModel bookModel;

  @override
  // void initState() {
  //   BlocProvider.of<SearchedBookCubit>(context).fetchSearchedBooks(
  //       category: widget.bookModel.volumeInfo.categories?[0] ?? '');
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchedBookCubit(getIt.get<HomeRepoImpl>()),
        child: const SafeArea(
            child: SearchViewBody(
                // bookModel: bookModel,
                )),
      ),
    );
  }
}
