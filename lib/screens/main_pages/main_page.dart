import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/page_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/screens/main_pages/bottom_navigator.dart';
import 'package:flutterstore/screens/main_pages/create_drawer.dart';
import 'package:flutterstore/screens/main_pages/tabs/category/category_tab.dart';
import 'package:flutterstore/screens/main_pages/tabs/home/home_tab.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/view_models/main_pages/main_view_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  late MainViewModel mainVm = MainViewModel(context);
  var keyboardVisible = false;

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != keyboardVisible) {
      setState(() {
        keyboardVisible = newValue;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget ContentRender(String state) {
      if (state == "category") return CategoryTab();
      return HomeTab();
    }

    Widget BottomNavRender(String state) {
      if (keyboardVisible) return Container();
      return Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigator(
          currentPage: state,
          onPress: (set) {
            setState(() {
              mainVm.setNewPage(set);
            });
          },
          onUp: () => showDrawer(context, 270, CreateDrawer()),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PageCubit, String>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              color: whiteColor,
              child: Stack(
                children: [
                  ContentRender(state), 
                  BottomNavRender(state)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
