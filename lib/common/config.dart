import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final BASE_URL = dotenv.env['BASE_URL'];
}