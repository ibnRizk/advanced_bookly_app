import 'package:advanced_bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:advanced_bookly_app/Features/home/domin/entities/book_entities.dart';
import 'package:advanced_bookly_app/Features/home/domin/use_cases/fetch_featured_books_use_case.dart';
import 'package:advanced_bookly_app/Features/home/domin/use_cases/fetch_newest_books_use_case.dart';
import 'package:advanced_bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:advanced_bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/home/presentation/manger/cubit/newset_books_cubit.dart';
import 'constants.dart';
import 'core/functions/setup_server_locator.dart';
import 'core/utils/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntitiesAdapter());
  await Hive.openBox<BookEntities>(kFeaturedBooks);
  await Hive.openBox<BookEntities>(kNewsetBooks);
  setupServerLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => FeaturedBooksCubit(
                FetchFeaturedBooksUseCase(gitIt.get<HomeRepoImpl>()),
              ),
        ),
        BlocProvider(
          create:
              (context) => NewsetBooksCubit(
                FetchNewestdBooksUseCase(gitIt.get<HomeRepoImpl>()),
              ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
