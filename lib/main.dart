import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meow_app/core/themes/theme.dart';
import 'package:meow_app/routes/app_pages.dart';
import 'common/dependency_injection.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    dotenv.load(fileName: '.env'),
    DependencyInjection.init(),
  ]);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Suivi",
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
