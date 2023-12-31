import 'package:provider/provider.dart';

import '../../core/modules/todo_list_module.dart';
import 'login/controller/login_controller.dart';
import 'login/login_page.dart';
import 'register/controller/register_controller.dart';
import 'register/register_page.dart';

class UserModule extends TodoListModule {
  UserModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => LoginController(userService: context.read()),
            ),
            ChangeNotifierProvider(
              create: (context) => RegisterController(userService: context.read()),
            ),
          ],
          routers: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
          },
        );
}
