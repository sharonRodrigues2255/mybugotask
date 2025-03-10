import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_screen_async_provider.dart';
import 'package:flutter_application_1/helpers/size_config.dart';
import 'package:flutter_application_1/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
        SizeConfig.init(context);

    return MultiProvider(
          providers: [ChangeNotifierProvider(create: (context) => HomeScreenAsyncProvider()),],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}