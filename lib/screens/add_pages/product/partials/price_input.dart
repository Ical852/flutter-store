import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterstore/widgets/image_custom.dart';
import 'package:flutterstore/widgets/text_inputs/input_with_button_custom.dart';

// ignore: must_be_immutable
class PriceInput extends StatelessWidget {
  TextEditingController productPriceController;
  Function(String) onChanged;
  Function() showPriceDrawer;

  PriceInput({
    super.key,
    required this.productPriceController,
    required this.onChanged,
    required this.showPriceDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return InputWithButtonCustom(
      onChanged: onChanged,
      inputType: TextInputType.number,
      title: "Product Price",
      hint: "Input Product Price",
      controller: productPriceController,
      onPress: showPriceDrawer,
      iconContent: ImageCustom(
        height: 21,
        width: 21,
        image: AssetImage('assets/icons/ic_money.png'),
      ),
    );
  }
}