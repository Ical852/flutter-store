import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/blocs/cubits/product_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/product_model.dart';
import 'package:flutterstore/screens/add_pages/product/partials/category_drawer.dart';
import 'package:flutterstore/screens/add_pages/product/partials/category_input.dart';
import 'package:flutterstore/screens/add_pages/product/partials/price_drawer.dart';
import 'package:flutterstore/screens/add_pages/product/partials/price_input.dart';
import 'package:flutterstore/view_models/add_pages/add_product_view_model.dart';
import 'package:flutterstore/widgets/buttons/main_button_custom.dart';
import 'package:flutterstore/widgets/header.dart';
import 'package:flutterstore/widgets/text_inputs/main_input_custom.dart';
import '../../../shared/constants.dart';

class AddProductPage extends StatefulWidget {
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController productNameController = TextEditingController(text: "");
  TextEditingController productDescController = TextEditingController(text: "");
  TextEditingController productPriceController = TextEditingController(text: "");
  TextEditingController imageUrlController = TextEditingController(text: "");
  TextEditingController skuController = TextEditingController(text: "");
  TextEditingController weightController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController(text: "");
  TextEditingController widthController = TextEditingController(text: "");
  TextEditingController lengthController = TextEditingController(text: "");

  late var addProductVM = AddProductViewModel(context);
  bool isButtonDisabled = true;
  var currentPrice = 0;
  late var category = context.read<CategoryCubit>().state.categories[0];

  @override
  void initState() {
    super.initState();
    productNameController.addListener(_validateInput);
    productDescController.addListener(_validateInput);
    productPriceController.addListener(_validateInput);
    imageUrlController.addListener(_validateInput);
    skuController.addListener(_validateInput);
    weightController.addListener(_validateInput);
    heightController.addListener(_validateInput);
    widthController.addListener(_validateInput);
    lengthController.addListener(_validateInput);
  }

  @override
  void dispose() {
    productNameController.removeListener(_validateInput);
    productDescController.removeListener(_validateInput);
    productPriceController.removeListener(_validateInput);
    imageUrlController.removeListener(_validateInput);
    skuController.removeListener(_validateInput);
    weightController.removeListener(_validateInput);
    heightController.removeListener(_validateInput);
    widthController.removeListener(_validateInput);
    lengthController.removeListener(_validateInput);

    productNameController.dispose();
    productDescController.dispose();
    productPriceController.dispose();
    imageUrlController.dispose();
    skuController.dispose();
    weightController.dispose();
    heightController.dispose();
    widthController.dispose();
    lengthController.dispose();

    super.dispose();
  }

  void _validateInput() {
    setState(() {
      isButtonDisabled = 
        productNameController.text.isEmpty ||
        productDescController.text.isEmpty ||
        productPriceController.text.isEmpty ||
        imageUrlController.text.isEmpty ||
        skuController.text.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty ||
        widthController.text.isEmpty ||
        lengthController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    void setFastPrice(price, stateSetter) {
      this.productPriceController.text = price.toString();
      setState(() {
        currentPrice = price;
      });
      stateSetter(() {
        currentPrice = price;
      });
      Navigator.pop(context);
    }
    void showPriceDrawer() {
      return showDrawer(
        context,
        341,
        PriceDrawer(
          setFastPrice: setFastPrice,
          isPriceActive: (price) => currentPrice == price,
        ),
      );
    }

    void setCategory(cat, setState) {
      this.setState(() {
        category = cat;
      });
      setState(() {
        category = cat;
      });
      Navigator.pop(context);
    }
    void showCategoryDrawer(state) {
      return showDrawer(
        context,
        350,
        CategoryDrawer(
          state: state,
          setCategory: setCategory,
          isCategoryActive: (cat) => category == cat,
        ),
      );
    }

    void createProduct() {
      var products = context.read<ProductCubit>().state.pagination.products;
      var product = ProductModel(
        int.parse(weightController.text),
        int.parse(widthController.text),
        int.parse(lengthController.text),
        int.parse(heightController.text),
        int.parse(productPriceController.text),
        category,
        generateProductId(products),
        skuController.text,
        productNameController.text,
        productDescController.text,
        imageUrlController.text,
      );
      addProductVM.createProduct(product);
    }

    Widget CategoryInputContent() {
      return CategoryInput(
        category: category,
        showCategoryDrawer: showCategoryDrawer,
      );
    }

    Widget PriceInputContent() {
      return PriceInput(
        productPriceController: productPriceController,
        showPriceDrawer: showPriceDrawer,
        onChanged: (value) {
          this.setState(() {
            if (value.isNotEmpty) {
              currentPrice = int.parse(value);
            }
          });
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(children: [
          Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: ListView(
                      children: [
                        SizedBox(height: 30),
                        Header(title: "Create Products"),
                        SizedBox(height: 32),
                        MainInputCustom(
                          title: "Product Name",
                          hint: "Input product name",
                          controller: productNameController,
                        ),
                        SizedBox(height: 20),
                        MainInputCustom(
                          title: "Product Description",
                          hint: "Input product description",
                          controller: productDescController,
                        ),
                        SizedBox(height: 20),
                        PriceInputContent(),
                        SizedBox(height: 20),
                        CategoryInputContent(),
                        SizedBox(height: 20),
                        MainInputCustom(
                          title: "Image Url",
                          hint: "Input image url",
                          controller: imageUrlController,
                        ),
                        SizedBox(height: 20),
                        MainInputCustom(
                          title: "Sku",
                          hint: "Input product sku",
                          controller: skuController,
                        ),
                        SizedBox(height: 20),
                        MainInputCustom(
                          title: "Weight (kg)",
                          hint: "Input product weight",
                          controller: weightController,
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        MainInputCustom(
                          title: "Height (cm)",
                          hint: "Input product height",
                          controller: heightController,
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        MainInputCustom(
                          title: "Width (cm)",
                          hint: "Input product width",
                          controller: widthController,
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        MainInputCustom(
                          title: "Length (cm)",
                          hint: "Input product length",
                          controller: lengthController,
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 32),
                        MainButtonCustom(
                          title: 'Create Product',
                          onPressed: () {
                            setState(() {
                              createProduct();
                            });
                          },
                          disabled: isButtonDisabled,
                        ),
                        SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
