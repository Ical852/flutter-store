import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/blocs/cubits/product_cubit.dart';
import 'package:flutterstore/screens/add_pages/add_category_page.dart';
import 'package:flutterstore/screens/add_pages/add_product_page.dart';
import 'package:flutterstore/screens/main_pages/home.dart';
import 'package:flutterstore/screens/search_pages/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => HomePage(),
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
