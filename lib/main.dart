import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/components/cinema/cinema_details_view.dart';
import 'views/details/film_details_view.dart';
import 'services/providers/app_bar_provider.dart';
import 'services/providers/cinemas_provider.dart';
import 'services/providers/home_tabs_provider.dart';
import 'services/providers/nav_bar_provider.dart';
import 'views/home/home_view.dart';

import 'services/models/cinema_model.dart';
import '../services/utils/color.dart' as color;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const UgcApp());
}

// <> UgcApp()
class UgcApp extends StatefulWidget {
  // <> Constructor
  const UgcApp({Key? key}) : super(key: key);

  @override
  State<UgcApp> createState() => _UgcAppState();
}

// <> _UgcAppState()
class _UgcAppState extends State<UgcApp> {
  // =
  final CinemasProvider cinemaProvider = CinemasProvider();

  // {} initState
  @override
  void initState() {
    super.initState();
  }

  // <> Build
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider.value(value: FilmsProvider()),
        // ChangeNotifierProvider.value(value: CinemasProvider()),
        ChangeNotifierProvider.value(value: NavBarProvider()),
        ChangeNotifierProvider.value(value: HomeTabsProvider()),
        ChangeNotifierProvider.value(value: AppBarProvider()),
      ],
      child: MaterialApp(
        title: 'UGC App Demo',
        debugShowCheckedModeBanner: false,
        // <> Theme
        theme: ThemeData(
          // <> BottomNavigationBar
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 5,
            backgroundColor: color.bkg,
            selectedItemColor: color.primary,
            unselectedItemColor: color.label,
            unselectedLabelStyle: TextStyle(fontFamily: 'Uniform'),
          ),

          // <> AppBar
          appBarTheme: const AppBarTheme(
            backgroundColor: color.bkg,
            shadowColor: color.shadow,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: color.primary,
            ),
          ),

          // <> TextTheme
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Uniform',
              color: color.bkg,
              fontSize: 20,
            ),
            // NOTE : DisplayLarge

            displayMedium: TextStyle(
              fontFamily: 'Uniform',
              color: color.primary,
              fontSize: 20,
            ),
            // NOTE : DisplayMedium

            displaySmall: TextStyle(
              fontFamily: 'Uniform',
              color: color.label,
              fontSize: 18,
            ),
            // NOTE : DisplaySmall

            bodyMedium: TextStyle(
              fontFamily: 'Uniform',
              color: color.text,
              fontSize: 20,
            ),
            // NOTE : BodyMedium

            bodySmall: TextStyle(
              fontFamily: 'Uniform',
              color: color.text,
              fontSize: 18,
            ),
            // NOTE : BodySmall

            labelLarge: TextStyle(
              fontFamily: 'Uniform',
              color: color.bkg,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            // NOTE : LabelLarge

            labelMedium: TextStyle(
              fontFamily: 'Uniform',
              color: color.bkg,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            // NOTE : LabelMedium

            labelSmall: TextStyle(
              fontFamily: 'Uniform',
              color: color.bkg,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            // NOTE : LabelSmall

            titleLarge: TextStyle(
              fontFamily: 'Uniform',
              color: color.text,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            // NOTE : TitleLarge

            titleMedium: TextStyle(
              fontFamily: 'Uniform',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            // NOTE : TitleMedium

            titleSmall: TextStyle(
              fontFamily: 'Uniform',
              color: Colors.black,
              fontSize: 16,
            ),
            // NOTE : TitleSmall
          ),

          // <> TabBarTheme
          tabBarTheme: const TabBarTheme(
            labelColor: color.secondary,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: color.secondary,
                  width: 2,
                ),
              ),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding:
                EdgeInsets.only(bottom: 10, top: 0, left: 0, right: 0),
          ),

          // <> ElevatedButtonTheme
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              elevation: MaterialStateProperty.resolveWith((states) => 0),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => color.darkerBox),
            ),
          ),

          // <> TextButtonTheme
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith(
                (states) => color.primary.withOpacity(0.1),
              ),
            ),
          ),

          // <> Divider
          dividerColor: color.primary,

          // <> Scaffold
          scaffoldBackgroundColor: color.bkg,
        ),

        // <!> HomeView()
        // home: const Stream(),

        initialRoute: HomeView.route,
        routes: {
          HomeView.route: (context) => const HomeView(),
        },

        onGenerateRoute: (settings) {
          switch (settings.name) {
            case FilmDetailsView.route:
              final String id = settings.arguments as String;
              return MaterialPageRoute(
                builder: (context) => FilmDetailsView(
                  filmId: id,
                ),
              );
            case CinemaDetailsView.route:
              final CinemaModel cinema = settings.arguments as CinemaModel;
              return MaterialPageRoute(
                builder: (context) => CinemaDetailsView(cineId: cinema.id),
              );
          }
          return null;
        },
      ),
    );
  }
}
