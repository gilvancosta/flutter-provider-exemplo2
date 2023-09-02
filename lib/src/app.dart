// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'core/database/sqlite_connection_factory.dart';

class MyApp extends StatelessWidget {
  final String title;

  const MyApp({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Object()),
        //  Provider(create: (_) => FirebaseAuth.instance),
         Provider(create: (_) => SqliteConnectionFactory(), lazy: false), // o lazy false faz com que o provider seja criado antes de qualquer coisa
        //  Provider<UserRepository>(create: (context) => UserRepositoryImpl(firebaseAuth: context.read())),
        //  Provider<UserService>(create: (context) => UserServiceImpl(userRepository: context.read())),
        //  ChangeNotifierProvider(create: (context) => AuthProvider(firebaseAuth: context.read(), userService: context.read())..loadListener(), lazy: false)
      ],
      child: AppWidget(title: title),
    );
  }
}
