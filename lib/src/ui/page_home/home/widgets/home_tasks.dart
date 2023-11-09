import 'package:example_provider_02/src/core/ui/theme/app_theme_extensions.dart';
import 'package:example_provider_02/src/ui/page_home/home/widgets/task.dart';
import 'package:example_provider_02/src/domain/models/task_filter_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/task_model.dart';
import '../home_controller.dart';



class HomeTasks extends StatelessWidget {
  const HomeTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Selector<HomeController, String>(selector: (context, controller) {
            return controller.filterSelected.description;
          }, builder: (context, value, chield) {
            return Text(
              'TASK\'S $value',
              style: context.titleStyle,
            );
          }),
          Column(
            children: context
                .select<HomeController, List<TaskModel>>((controller) => controller.filteredTasks)
                .map((t) => Task(
                      model: t,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
