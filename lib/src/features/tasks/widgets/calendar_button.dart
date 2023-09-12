import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../task_create_controller.dart';

import 'package:example_provider_02/src/core/ui/theme/app_theme_extensions.dart';

class CalendarButton extends StatelessWidget {
  final dateFormat = DateFormat('dd/MM/y');

  CalendarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var lastDate = DateTime.now();
        lastDate = lastDate.add(const Duration(days: 10 * 365));

        var firstDate = DateTime.now();
        firstDate = firstDate.subtract(const Duration(days: 5 * 365));

        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: firstDate,
          lastDate: lastDate,
        );

        context.read<TaskCreateController>().selectedDate = selectedDate;
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.today,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Selector<TaskCreateController, DateTime?>(
              selector: (context, controller) => controller.selectedDate,
              builder: (context, selecedDate, child) {
                if (selecedDate != null) {
                  return Text(
                    dateFormat.format(selecedDate),
                    style: context.titleStyle,
                  );
                } else {
                  return Text(
                    'SELECIONE UMA DATA',
                    style: context.titleStyle,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
