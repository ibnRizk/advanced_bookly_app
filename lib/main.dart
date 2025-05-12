import 'package:advanced_bookly_app/Features/home/presentation/views/domin/entities/book_entities.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';

void main() async {
  Hive.registerAdapter(BookEntitiesAdapter());
  await Hive.openBox(kFeaturedBooks);
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
    );
  }
}
