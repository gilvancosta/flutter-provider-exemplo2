import 'package:flutter/material.dart';

import '../../../core/widgets/logo/todo_list_logo.dart';

class Splash01Page extends StatelessWidget {
  const Splash01Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: TodoListLogo(),
    ));
  }
}
