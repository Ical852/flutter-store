import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/blocs/cubits/product_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_bloc_model.dart';
import 'package:flutterstore/models/product_bloc_model.dart';
import 'package:flutterstore/screens/detail_pages/detail_page.dart';
import 'package:flutterstore/screens/main_pages/tabs/home/partials/empty_products.dart';
import 'package:flutterstore/screens/main_pages/tabs/home/partials/home_header.dart';
import 'package:flutterstore/screens/main_pages/tabs/home/partials/limit_drawer.dart';
import 'package:flutterstore/view_models/main_pages/home_view_model.dart';
import 'package:flutterstore/widgets/category_item.dart';
import 'package:flutterstore/widgets/paginations/paginations.dart';
import 'package:flutterstore/widgets/product_cards/home_card.dart';
import 'package:flutterstore/widgets/title_desc_limit.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late HomeViewModel homeVM = HomeViewModel(context);

  @override
  void initState() {
    super.initState();
    homeVM.refreshProducts();
  }

  @override
  Widget build(BuildContext context) {
    Widget CategoryContent() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocConsumer<CategoryCubit, CategoryBlocModel>(
            listener: (context, state) {},
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CategoryItem(
                    title: "All Products",
                    current: state.current.name,
                    onPress: () => setState(() {
                      homeVM.setCategory(getDefaultCategory());
                    }),
                  ),
                  Row(
                    children: state.categories.map((category) {
                      return CategoryItem(
                        title: category.name,
                        current: state.current.name,
                        onPress: () => setState(() {
                          homeVM.setCategory(category);
                        }),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    Widget LimitDrawerContent(state) {
      return Container(
        child: LimitDrawer(
          currentLimit: state.pagination.limit,
          onPress: (limit) => setState(() {
            homeVM.setLimit(limit);
          }),
        ),
      );
    }

    Widget LimitContent() {
      return BlocConsumer<ProductCubit, ProductBlocModel>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: TitleDescLimit(
              title: "All Products",
              desc: "All products from klontong store",
              limit: state.pagination.limit.toString(),
              isEmpty: state.resultProduct.products.length < 1,
              onPress: () {
                showDrawer(context, 357, LimitDrawerContent(state));
              },
            ),
          );
        },
      );
    }

    Widget RenderPagination(ProductBlocModel state) {
      return Paginations(
        pages: state.resultProduct.pages,
        current: state.pagination.page,
        onLatest: () {
          setState(() {
            homeVM.setPage(1);
          });
        },
        onPrev: () {
          if (state.pagination.page != 1) {
            setState(() {
              homeVM.setPage(state.pagination.page - 1);
            });
          }
        },
        onChangePage: (page) {
          setState(() {
            homeVM.setPage(page);
          });
        },
        onNext: () {
          if (state.pagination.page != state.pagination.lastPage) {
            setState(() {
              homeVM.setPage(state.pagination.page + 1);
            });
          }
        },
        onEnd: () {
          setState(() {
            homeVM.setPage(state.pagination.lastPage);
          });
        },
      );
    }

    Widget MainContent() {
      return BlocConsumer<ProductCubit, ProductBlocModel>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.resultProduct.products.length < 1) return EmptyProducts();
          return Container(
            child: Column(
              children: [
                RenderPagination(state),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.resultProduct.products.length,
                  itemBuilder: (context, index) {
                    var product = state.resultProduct.products[index];
                    return HomeCard(
                      product: product.product,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(product.product)));
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 172,
                ),
              ],
            ),
          );
        },
      );
    }

    return Container(
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeHeader(
            onSeach: () => setState(() {
              homeVM.resetPagination();
            }),
          ),
          SizedBox(
            height: 16,
          ),
          CategoryContent(),
          SizedBox(
            height: 16,
          ),
          LimitContent(),
          SizedBox(
            height: 20,
          ),
          MainContent()
        ],
      )),
    );
  }
}
