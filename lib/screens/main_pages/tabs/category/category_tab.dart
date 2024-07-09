import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_bloc_model.dart';
import 'package:flutterstore/screens/main_pages/tabs/category/partials/empty_category.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/view_models/main_pages/category_view_model.dart';
import 'package:flutterstore/widgets/image_custom.dart';
import 'package:flutterstore/widgets/screens/main/category/category_card.dart';
import 'package:flutterstore/widgets/title_desc_limit.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  late CategoryViewModel categoryVM = CategoryViewModel(context);
  TextEditingController searchController = TextEditingController(text: "");
  var confirm = "Are you sure to delete this category?";

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearchChanged);
  }

  void onSearchChanged() {
    setState(() {
      categoryVM.filterCategory(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget RenderEmpty() {
      return Container(
          margin: EdgeInsets.only(top: 128, bottom: 128),
          child: EmptyCategory());
    }

    Widget SearchBar() {
      return Container(
        height: 50,
        decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [getBoxShadow(1.5)],
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Search Categories",
                  labelStyle:
                      regular.regularF.copyWith(color: black1.withOpacity(0.4)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 14)),
              controller: searchController,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 14),
                child: ImageCustom(
                  height: 20,
                  width: 20,
                  image: AssetImage(getIC("ic_search.png")),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget CategoriesTitle() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: TitleDescLimit(
            isEmpty: true,
            title: "All Categories",
            desc: "All product categories from klontong store",
            limit: "",
            onPress: () {}),
      );
    }

    Widget CategoryList(CategoryBlocModel state) {
      var categories =
          state.filtered.length > 0 ? state.filtered : state.categories;

      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            var category = categories[index];
            return CategoryCard(
              category: category,
              onDelete: (category) {
                showConfirm(context, confirm, () {
                  setState(() {
                    categoryVM.deleteCategory(category);
                  });
                }, () {});
              },
            );
          });
    }

    Widget MainContent() {
      return BlocConsumer<CategoryCubit, CategoryBlocModel>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.categories.isEmpty) return RenderEmpty();
          return Container(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                SearchBar(),
                SizedBox(
                  height: 24,
                ),
                CategoriesTitle(),
                SizedBox(
                  height: 8,
                ),
                CategoryList(state),
              ],
            ),
          );
        },
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Text(
              "Categories",
              style: regular.black1S.semiBold,
            ),
            MainContent(),
            SizedBox(
              height: 172,
            ),
          ],
        ),
      ),
    );
  }
}
