import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class CircleButton extends StatelessWidget {
  Function() onPressed;
  bool disabled;

  CircleButton({
    required this.onPressed,
    this.disabled = false
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.3 : 1,
      child: Container(
        decoration: BoxDecoration(
          color: green1, 
          borderRadius: BorderRadius.circular(50)
        ),
        width: 50,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent.withOpacity(0.1),
          ),
          onPressed: disabled ? () {} : onPressed,
          child: ImageCustom(
            height: 21,
            width: 21,
            image: AssetImage(getIC("ic_delete_product.png")),
          ),
        ),
      ),
    );
  }
}
