import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/global_witgets/header.widget.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            AppHeaderWidget(title: 'Settings', showDivider: true),
            SwitchListTile(
              title: Text('Dark mode'),
              value: AppController.instance.isDarkMode.value,
              onChanged: (v) {
                if (v) {
                  AppController.instance.goDark();
                } else {
                  AppController.instance.goLight();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
