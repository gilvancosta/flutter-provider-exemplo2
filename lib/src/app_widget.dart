// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'core/database/sqlite_adm_connection.dart';
import 'core/ui/theme/app_theme.dart';
import 'core/utls/app_routes.dart';
import 'pages/home/home_page.dart';

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

    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
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
      theme: MyAppTheme.themeData,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (ctx) => HomePageApp(title: widget.title),
      },

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
