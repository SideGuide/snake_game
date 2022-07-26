import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_game/services/route_service.dart';
import 'package:snake_game/services/user_service.dart';

import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake Game',
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider<UserService>(
          create: (_) => UserService(),
        ),
        ChangeNotifierProvider<RouteService>(
          create: (_) => RouteService(),
        ),
      ], child: const Menu()),
    );
  }
}
