import 'package:flutter/material.dart';
import 'package:menuapp/config/app_routes.dart';
import 'package:menuapp/util/providers/offer_provider.dart';
import 'package:menuapp/util/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:menuapp/util/providers/category_provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => OfferProvider()..loadFromFile()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.pages,
    );
  }
}
