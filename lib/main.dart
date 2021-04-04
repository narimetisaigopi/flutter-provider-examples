import 'package:flutter/material.dart';
import 'package:flutter_provider/catalog/cart_provider.dart';
import 'package:provider/provider.dart';

import 'catalog/catelog_screen.dart';
import 'catalog/date_time_provider.dart';

void main() {
  // this is for timerprovider
  // runApp(ChangeNotifierProvider(
  //     create: (context) => TimerProvider(), child: MyApp()));
  //
  // single provider
  // runApp(ChangeNotifierProvider(
  //     create: (context) => CartProvider(), child: MyApp()));

  //
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => DateTimeProvider())
    // Provider<CartProvider>(
    //   create: (context) => CartProvider(),
    // ),
    // Provider<DateTimeProvider>(
    //   create: (context) => DateTimeProvider(),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: TimerScreen(),
      home: CatalogScreen(),
    );
  }
}
