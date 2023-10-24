import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfilx/application/downloads/downloads_bloc.dart';
import 'package:netfilx/application/fast_laugh/fastlaugh_bloc.dart';
import 'package:netfilx/application/home/home_bloc.dart';
import 'package:netfilx/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netfilx/application/search/search_bloc.dart';
import 'package:netfilx/core/colors.dart';
import 'package:netfilx/domain/core/di/injection.dart';
import 'package:netfilx/presentation/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastlaughBloc>()),
        BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: kWhiteColor,
            ),
            bodyText2: TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
        home: MainPage(),
      ),
    );
  }
}
