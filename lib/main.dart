import 'package:banking/components/themes.dart';
import 'package:banking/firebase_options.dart';
import 'package:banking/layouts/home_layout.dart';
import 'package:banking/provider/global_provider.dart';
import 'package:banking/screens/login_screen.dart';
import 'package:banking/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GlobalProvider>(
      create: (_) => GlobalProvider(),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeLayout(),
        themeMode: Provider.of<GlobalProvider>(context).getTheme(),
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: {
          HomeLayout.routeName: (context) => const HomeLayout(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
        },
      ),
    );
  }
}
