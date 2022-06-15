import 'package:blco_api/Page/home_page.dart';
import 'package:blco_api/bloc/weather_bloc.dart';
import 'package:blco_api/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedStorage storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  ///jaha pani child hos we can acess block
  ///
  HydratedBlocOverrides.runZoned(
      () => runApp(MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => WeatherBloc(),
            ),
            BlocProvider(
              create: (context) => ThemeCubit(),
            ),
          ], child: MyApp())),
      storage: storage);
}

class AppSettings {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          themeMode: state ? ThemeMode.light : ThemeMode.dark,
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          navigatorKey: AppSettings.navigatorKey,
          home: const HomePage(),
        );
      },
    );
  }
}
