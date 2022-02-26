import 'package:banking/firebase_options.dart';
import 'package:banking/layouts/home_layout.dart';
import 'package:banking/providers/bottom_nav_bar_provider.dart';
import 'package:banking/providers/card_provider.dart';
import 'package:banking/providers/register_provider.dart';
import 'package:banking/providers/transactions_provider.dart';
import 'package:banking/providers/user_provider.dart';
import 'package:banking/screens/edit_profile_screen.dart';
import 'package:banking/screens/home_screen.dart';
import 'package:banking/screens/login_screen.dart';
import 'package:banking/screens/register_screen.dart';
import 'package:banking/screens/settings_screen.dart';
import 'package:banking/screens/stats_screen.dart';
import 'package:banking/screens/transfer_money_screen.dart';
import 'package:banking/screens/wallet_screen.dart';
import 'package:banking/shared/theme/theme_provider.dart';
import 'package:banking/shared/theme/themes.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<RegisterProvider>(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider<CardProvider>(
          create: (_) => CardProvider(),
        ),
        ChangeNotifierProvider<BottomNavBarProvider>(
          create: (_) => BottomNavBarProvider(),
        ),
        ChangeNotifierProvider<TransactionsProvider>(
          create: (_) => TransactionsProvider(),
        ),
      ],
      builder: (BuildContext context, Widget? _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        themeMode: Provider.of<ThemeProvider>(context).getTheme(),
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: {
          HomeLayout.routeName: (context) => const HomeLayout(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          StatsScreen.routeName: (context) => const StatsScreen(),
          WalletScreen.routeName: (context) => const WalletScreen(),
          SettingsScreen.routeName: (context) => const SettingsScreen(),
          EditProfileScreen.routeName: (context) => const EditProfileScreen(),
          TransferMoneyScreen.routeName: (context) => TransferMoneyScreen(),
        },
      ),
    );
  }
}
