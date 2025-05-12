import 'package:advanced_bookly_app/Features/home/presentation/views/domin/entities/book_entities.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntitiesAdapter());
  await Hive.openBox<BookEntities>(kFeaturedBooks);
  await Hive.openBox<BookEntities>(kNewsetBooks);
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
    );
  }
}
