import 'package:flutter/material.dart';
import 'package:flutterstore/widgets/buttons/main_button_custom.dart';
import 'package:flutterstore/widgets/drawer_title_desc.dart';

class CreateDrawer extends StatelessWidget {
  const CreateDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          DrawerTitleDesc(
            title: "Create Product or Category",
            desc: "Choose what you want to create, choose product to create product, choose category to create category"
          ),
          SizedBox(height: 24),
          MainButtonCustom(
            title: "Create Category",
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/add-category");
            },
          ),
          SizedBox(height: 16),
          MainButtonCustom(
            title: "Create Product",
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/add-product");
            },
          ),
        ],
      ),
    );
  }
}
