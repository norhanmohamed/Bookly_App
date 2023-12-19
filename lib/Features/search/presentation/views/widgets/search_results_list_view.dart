import 'package:bookly/Features/home/presentation/views/widgets/Featured_list_view_item.dart';
import 'package:bookly/Features/search/presentation/manger/cubit/searched_book_cubit.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_%20error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBookCubit, SearchedBookState>(
      builder: (context, state) {
        if (state is SearchedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.width * .9,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.KBooksDetails,
                          extra: state.books[index]);
                    },
                    child: FeaturedListViewItem(
                      imgUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SearchedBookFailure) {
          return CustomErrorWidget(
              errMessage: 'There is no book in this title');
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
