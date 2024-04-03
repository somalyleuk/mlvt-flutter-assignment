import 'package:get/get.dart';
import 'package:testapp/presentation/views/faqs_view/faqs_view.dart';
import 'package:testapp/presentation/views/home_view/home_view.dart';
import 'package:testapp/presentation/views/unknown_view/unknown_view.dart';

// class AppRouter {
//   static final List<GetPage> router = [
//     GetPage(name: '/', page: () => const HomeView()),
//     GetPage(name: '/faqs_screen', page: () => const FAQSView()),
//   ];
//   static final unknownRoute =
//       GetPage(name: '/unknow', page: () => const UnknownView());
//   static const initialRoute = '/';
// }

class AppRouter {
  static get home => '/home';
  static get faqs => '/faqs';
  static get unknow => '/unknow';
  static get initialRoute => '/';
}

List<GetPage> router = [
  GetPage(
    name: AppRouter.home,
    page: () => const HomeView(),
  ),
  GetPage(
    name: AppRouter.faqs,
    page: () => const FAQSView(),
  ),
  GetPage(
    name: AppRouter.unknow,
    page: () => const UnknownView(),
  ),
];
