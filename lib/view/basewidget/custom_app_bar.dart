import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';

PreferredSizeWidget CustomAppBar({required String text}) {
  return PreferredSize(
      preferredSize: Size(double.infinity, 40),
      child: AppBar(
        title: Text(text),
        centerTitle: false,
        elevation: 0,
        backgroundColor: ColorResources.AppBar,
      ));
}
