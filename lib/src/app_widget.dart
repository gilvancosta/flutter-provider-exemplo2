// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example_provider_02/src/features/auth/auth_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'core/database/sqlite/sqlite_adm_connection.dart';
import 'core/ui/theme/app_themeV2.dart';
import 'core/ui/theme/app_themev1.dart';

import 'features/page_home/home/home_page.dart';

import 'features/page_home/splash/splash01_page.dart';

class AppWidget extends StatefulWidget {
  final String title;
  const AppWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<AppWidget> createState() => _MyAppState();
}

class _MyAppState extends State<AppWidget> {
  var sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();

     FirebaseAuth auth = FirebaseAuth.instance;

    WidgetsBinding.instance.addObserver(sqliteAdmConnection); // adicionando o ciclo de vida na aplicação
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: MyAppThemeV2.theme,
      initialRoute: '/login',
      routes: {
        ...AuthModule().routers,
      },
      home: const Splash01Page(),
      onGenerateRoute: (settings) {
        if (settings.name == '/alguma-coisa') {
          return null;
        } else if (settings.name == '/outra-coisa') {
          return null;
        } else {
          return MaterialPageRoute(builder: (_) {
            return HomePageApp(title: widget.title);
          });
        }
      },
      // funciona tipo fosse uma página 404
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return HomePageApp(title: widget.title);
        });
      },
    );
  }
}
