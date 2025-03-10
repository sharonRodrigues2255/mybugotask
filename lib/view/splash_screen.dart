import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_screen_async_provider.dart';
import 'package:flutter_application_1/view/bottom_navigation_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeScreenAsyncProvider>(context, listen: false).refresh().then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return BottomNavigationScreen();
          },
        ),
      );
    });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset('assets/appicon.png')));
  }
}
