import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/product_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/product_bloc_model.dart';
import 'package:flutterstore/screens/detail_pages/detail_page.dart';
import 'package:flutterstore/screens/search_pages/search_input.dart';
import 'package:flutterstore/widgets/empty_products.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/view_models/search_pages/search_page_view_model.dart';
import 'package:flutterstore/widgets/category_list.dart';
import 'package:flutterstore/widgets/limit_drawer.dart';
import 'package:flutterstore/widgets/paginations/paginations.dart';
import 'package:flutterstore/widgets/product_cards/grid_card.dart';
import 'package:flutterstore/widgets/title_desc_limit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchPageViewModel searchVM = SearchPageViewModel(context);
  TextEditingController searchController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget SearchInputContent() {
      return SearchInput(
        searchController: searchController,
        onBack: () {
          searchVM.resetPagination();
          Navigator.pop(context);
        },
        onFieldSubmitted: (e) {
          setState(() {
            searchVM.setFilter(e);
          });
        },
      );
    }

    Widget CategoryContent() {
      return CategoryList(
        onAllProducts: () => setState(() {
          searchVM.setCategory(getDefaultCategory());
        }),
        onChoose: (category) => setState(() {
          searchVM.setCategory(category);
        }),
      );
    }

    Widget RenderPagination(ProductBlocModel state) {
      return Paginations(
        pages: state.resultProduct.pages,
        current: state.pagination.page,
        onLatest: () {
          setState(() {
            searchVM.setPage(1);
          });
        },
        onPrev: () {
          if (state.pagination.page != 1) {
            setState(() {
              searchVM.setPage(state.pagination.page - 1);
            });
          }
        },
        onChangePage: (page) {
          setState(() {
            searchVM.setPage(page);
          });
        },
        onNext: () {
          if (state.pagination.page != state.pagination.lastPage) {
            setState(() {
              searchVM.setPage(state.pagination.page + 1);
            });
          }
        },
        onEnd: () {
          setState(() {
            searchVM.setPage(state.pagination.lastPage);
          });
        },
      );
    }

    Widget LimitDrawerContent(state) {
      return Container(
        child: LimitDrawer(
          currentLimit: state.pagination.limit,
          onPress: (limit) => setState(() {
            searchVM.setLimit(limit);
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

    Widget MainContent() {
      return BlocConsumer<ProductCubit, ProductBlocModel>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.resultProduct.products.length < 1) {
            return EmptyProducts(
              desc: "Oops, looks like something went wrong or what you're looking for isn't here...",
              noBtn: true,
            );
          };
          return Container(
            child: Column(
              children: [
                RenderPagination(state),
                SizedBox(height: 20),
                GridView.builder(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 157/264,
                  ),
                  itemCount: state.resultProduct.products.length,
                  itemBuilder: (context, index) {
                    var product = state.resultProduct.products[index].product;
                    return GridCard(
                      product: product,
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(product)
                          )
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 72),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: WillPopScope(
        onWillPop: () async {
          searchVM.resetPagination();
          return true;
        },
        child: SafeArea(
          child: Column(
            children: [
              SearchInputContent(),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 16,),
                    CategoryContent(),
                    SizedBox(height: 16,),
                    LimitContent(),
                    SizedBox(height: 20,),
                    MainContent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}