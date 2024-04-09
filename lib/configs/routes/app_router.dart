import 'package:get/get.dart';
import 'package:mlvt_flutter_assignment/views/screens/faqs_screen/faqs_screen.dart';
import 'package:mlvt_flutter_assignment/views/screens/home_screen/home_screen.dart';
import 'package:mlvt_flutter_assignment/views/screens/unknown/unknown.dart';

class AppRouter {
  static final List<GetPage> router = [
    GetPage(name: '/', page: () => const HomeScreen()),
    GetPage(name: '/faqs_screen', page: () => const FAQSScreen()),
  ];

  static final unknownRoute =
      GetPage(name: '/unknow', page: () => const Unknown());

  static const initialRoute = '/';
}
