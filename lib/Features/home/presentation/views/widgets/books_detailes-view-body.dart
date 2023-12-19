import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/Custom_Appbar_books_details.dart';
import 'package:bookly/Features/home/presentation/views/widgets/Featured_list_view_item.dart';
import 'package:bookly/Features/home/presentation/views/widgets/booksRating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_actions.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BooksDetailsViewBODY extends StatelessWidget {
  const BooksDetailsViewBODY({Key? key, required this.bookModel})
      : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomAppbarBooksDetails(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .2),
                  child: FeaturedListViewItem(
                      imgUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  bookModel.volumeInfo.title!,
                  style:
                      Styles.tesxtStyle30.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: .9,
                  child: Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.tesxtStyle18.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BooksRating(
                  rating: bookModel.volumeInfo.averageRating ?? 0,
                  count: bookModel.volumeInfo.ratingsCount ?? 0,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                BooksActions(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.tesxtStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBooksListView(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
