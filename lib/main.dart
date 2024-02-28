import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soulive/screens/home/HomeScreen.dart';
import 'package:soulive/screens/commercial/CommercialScreen.dart';
import 'package:soulive/screens/mypage/MypageScreen.dart';
import 'package:soulive/screens/splash/splashScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:soulive/design/SoulliveIcon.dart';

void main() async {
  //await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class ScaffoldBottomNavigationBar extends StatelessWidget{
  const ScaffoldBottomNavigationBar({
    required this.navigationShell,
    Key? key,
  }): super(key: key ?? const ValueKey<String>('ScaffoldBottomNavigationBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        //디자인 나오면 추후 수정필요
        selectedItemColor: Colors.black,
        //디자인나오면 추후 수정
        selectedFontSize: 12,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: navigationShell.currentIndex != 0 ? SoulliveIcon.homeunFill() : SoulliveIcon.homeFill(),
              label: '홈'
          ),
          BottomNavigationBarItem(
              icon: navigationShell.currentIndex != 1 ? SoulliveIcon.secondunFill() : SoulliveIcon.secondFill(),
              label: '광고 상품'
          ),
          BottomNavigationBarItem(
              icon: navigationShell.currentIndex != 2 ? SoulliveIcon.mypageunFill() : SoulliveIcon.mypageFill(),
              label: '마이페이지'
          )
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int tappedIndex){
          navigationShell.goBranch(tappedIndex);
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget{
  MyApp({super.key});

  final GoRouter _router = GoRouter(
      initialLocation: '/splash',
      routes: <RouteBase>[
        GoRoute(
            path: '/splash',
            builder: (BuildContext context, GoRouterState state){
              return const SplashScreen();
            }
        ),
        StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell){
              return ScaffoldBottomNavigationBar(navigationShell: navigationShell);
            },
            branches: <StatefulShellBranch>[
              StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/home',
                      builder: (BuildContext context, GoRouterState state){
                        return const HomeScreen();
                      },
                      routes: const <RouteBase>[],
                    )
                  ]
              ),
              StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/commercial',
                      builder: (BuildContext context, GoRouterState state){
                        return const CommercialScreen();
                      },
                      routes: const <RouteBase>[],
                    )
                  ]
              ),
              StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/mypage',
                      builder: (BuildContext context, GoRouterState state){
                        return const MypageScreen();
                      },
                      routes: const <RouteBase>[],
                    ),
                  ],
              ),
            ],
        ),
      ],
  );
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }

}

