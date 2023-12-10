import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hockey_quiz/gsdfcsd.dart';
import 'package:hockey_quiz/base/app_theme.dart';
import 'package:hockey_quiz/fdsafdas.dart';
import 'package:hockey_quiz/screens/bonus.dart';
import 'package:hockey_quiz/screens/main/main_screen.dart';
import 'package:hockey_quiz/screens/boarding/boarding_screen.dart';
import 'package:hockey_quiz/screens/params/params_screen.dart';
import 'package:hockey_quiz/screens/splash/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 9),
    minimumFetchInterval: const Duration(seconds: 9),
  ));

  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await NotificationServiceFb().activate();

  final bd = await SharedPreferences.getInstance();

  runApp(MyApp(bd: bd));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.bd});
  final SharedPreferences bd;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: bd,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const InScreen(),
      ),
    );
  }
}

class InScreen extends StatefulWidget {
  const InScreen({super.key});

  @override
  State<InScreen> createState() => _InScreenState();
}

class _InScreenState extends State<InScreen> {
  late final SharedPreferences _bd;
  var _showOnBoard = false;
  var _loading = true;
  String? _bonus;

  @override
  void initState() {
    super.initState();
    _bd = context.read<SharedPreferences>();
    _init();
  }

  Future<void> _init() async {
    // await Future.delayed(const Duration(seconds: 2));
    rati(_bd);

    final bonus = FirebaseRemoteConfig.instance.getString('winner');

    if (!bonus.contains('isWinner')) {
      setState(() {
        _loading = false;
        _bonus = bonus;
      });
      return;
    }

    final onBoard = _bd.getBool('onBoard') ?? false;

    if (!onBoard) {
      setState(() {
        _loading = false;
        _showOnBoard = true;
      });

      return;
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const SplashPage();
    }

    if (_showOnBoard) {
      return const BoardingScreen();
    }

    if (_bonus != null) {
      return BonusPage(bStr: _bonus!);
    }

    return const MainScreen();
  }
}
