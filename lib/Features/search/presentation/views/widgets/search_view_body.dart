import 'package:bookly/Features/search/presentation/manger/cubit/searched_book_cubit.dart';
import 'package:bookly/Features/search/presentation/views/widgets/cucstom_search%20Text_field.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_results_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    Key? key,
    // required this.bookModel,
  }) : super(key: key);
  //final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (data) {
              var sub;
              sub = data;
              BlocProvider.of<SearchedBookCubit>(context)
                  .fetchSearchedBooks(category: sub);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Results',
            style: Styles.tesxtStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(child: SearchResultsListView()),
        ],
      ),
    );
  }
}
