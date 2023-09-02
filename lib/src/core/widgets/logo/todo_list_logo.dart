import 'package:flutter/material.dart';

class TodoListLogo extends StatelessWidget {
  const TodoListLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 100,
        ),
        const Text(
          'Todo List 1',
        //  style: context.textTheme.titleLarge,
        )
      ],
    );
  }
}
