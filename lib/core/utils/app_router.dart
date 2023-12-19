import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repo/home_repo_implement.dart';
import 'package:bookly/Features/home/presentation/Manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/books_detailes_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/presentation/views/SplashView.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/core/utils/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  // ignore: constant_identifier_names
  static const KHomeView = '/homeView';
  // ignore: constant_identifier_names
  static const KBooksDetails = '/booksDetailsView';

  static const KSearchview = '/SearchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KBooksDetails,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BooksDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: KSearchview,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}

 // GoRoute(
      //     path: KSearchview,
      //     builder: (context, state) => BlocProvider(
      //           create: (context) =>
      //               SearchedBookCubit(getIt.get<HomeRepoImpl>()),
      //           // child: SearchView(
      //           // //  bookModel: state.extra as BookModel,
      //           ),
      //         )),
