// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example_provider_02/src/ui/users_module/user_module.dart';

import 'package:flutter/material.dart';

import 'data/datasource/sqlite/sqlite_adm_connection.dart';
import 'core/ui/theme/app_themeV2.dart';

import 'ui/page_home/splash/splash01_page.dart';

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

    // FirebaseAuth auth = FirebaseAuth.instance;

    WidgetsBinding.instance.addObserver(
        sqliteAdmConnection); // adicionando o ciclo de vida na aplicação
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
      // initialRoute: '/login',
      routes: {
        ...UserModule().routers,
      }, 
      home: const Splash01Page(),
    );
  }
}
