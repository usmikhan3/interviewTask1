import 'package:get/get.dart';
import 'package:projects/presentation/screens/home/home_screen.dart';
import 'package:projects/presentation/screens/login/login_screen.dart';
import 'package:projects/presentation/screens/splash/splash_screen.dart';

class RouteHelper{

  static const String splashPage = '/splash';
  static const String loginPage = '/login';
  static const String homePage = '/';


  static String getSplash()=>'$splashPage';
  static String getLogin()=>'$loginPage';
  static String getHome()=>'$homePage';



  static List<GetPage> routes = [
    GetPage(name: splashPage, page: (){
      return SplashScreen();
    }),

    GetPage(
        transition: Transition.leftToRightWithFade,
        name: loginPage,
        page: (){

          return LoginScreen();

        }),

    GetPage(
        transition: Transition.leftToRightWithFade,
        name: homePage, page: (){
      return HomeScreen();
    }),
  ];
}