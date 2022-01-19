
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/modules/home/pages/home.page.dart';
import 'package:meow_app/modules/ramdom/pages/random.page.dart';
import 'package:meow_app/modules/settings/pages/settings.page.dart';

class InAppController extends GetxController {
  static InAppController instance = Get.find();

    List pages = [
    {
      'icon': Icons.home,
      'widget': HomePage(),
    },
    {
      'icon': Icons.shuffle,
      'widget': RandomPage(),
    },
    {
      'icon': Icons.settings,
      'widget': SettingsPage(),
    },
  ];
   
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  RxInt tabIndex = 0.obs;

  void changePage(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    tabIndex.value = index;
  }

}
