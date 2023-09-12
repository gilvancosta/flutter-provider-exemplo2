import 'package:example_provider_02/src/features/page_home/home/home_controller.dart';
import 'package:example_provider_02/src/features/page_home/home/home_page.dart';
import 'package:example_provider_02/src/services/tasks/tasks_services.dart';
import 'package:provider/provider.dart';

import '../../../core/modules/todo_list_module.dart';
import '../../../repositories/tasks/tasks_repository.dart';
import '../../../repositories/tasks/tasks_repository_impl.dart';
import '../../../services/tasks/tasks_services_impl.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(bindings: [
          Provider<TasksRepository>(
            create: (context) => TasksRepositoryImpl(
              sqliteConnectionFectory: context.read(),
            ),
          ),
          Provider<TasksServices>(
            create: (context) => TasksServicesImpl(
              taskRepository: context.read(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeController(tasksServices: context.read()),
          ),
        ], routers: {
          '/home': (context) => HomePage(
                homeController: context.read(),
              ),
        });
}
