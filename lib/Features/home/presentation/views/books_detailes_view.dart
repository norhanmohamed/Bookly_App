import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/Manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_detailes-view-body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksDetailsView extends StatefulWidget {
  const BooksDetailsView({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  State<BooksDetailsView> createState() => _BooksDetailsViewState();
}

class _BooksDetailsViewState extends State<BooksDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo.categories?[0] ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BooksDetailsViewBODY(
        bookModel: widget.bookModel,
      )),
    );
  }
}
