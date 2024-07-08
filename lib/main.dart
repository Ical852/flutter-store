import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/blocs/cubits/product_cubit.dart';
import 'package:flutterstore/blocs/cubits/search_cubit.dart';
import 'package:flutterstore/screens/add_pages/add_category_page.dart';
import 'package:flutterstore/screens/add_pages/add_product_page.dart';
import 'package:flutterstore/screens/main_pages/main_page.dart';
import 'package:flutterstore/screens/search_pages/search_page.dart';
import 'package:flutterstore/screens/splash_page.dart';
import 'package:flutterstore/shared/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: green1));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashPage(),
          "/main": (context) => MainPage(),
          "/add-category": (context) => AddCategoryPage(),
          "/add-product": (context) => AddProductPage(),
          "/search": (context) => SearchPage()
        },
        initialRoute: "/",
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text("Unknown Route")),
              body: Center(child: Text("Unknown Route")),
            ),
          );
        },
      ),
    );
  }
}
