import '../../models/task_model.dart';
import '../../models/week_task_entity.dart';
import '../../repositories/tasks/tasks_repository.dart';
import 'tasks_services.dart';

class TasksServicesImpl implements TasksServices {
  final TasksRepository _tasksRepository;

  TasksServicesImpl({required TasksRepository taskRepository}) : _tasksRepository = taskRepository;

  @override
  Future<void> save(DateTime date, String description) => _tasksRepository.save(date, description);

  @override
  Future<List<TaskModel>> getToday() {
    return _tasksRepository.findByperiod(DateTime.now(), DateTime.now());
  }

  @override
  Future<List<TaskModel>> getTomorrow() {
    var tomorrow = DateTime.now().add(const Duration(days: 1));
    return _tasksRepository.findByperiod(tomorrow, tomorrow);
  }

  @override
  Future<WeekTaskEntity> getWeek() async {
    final today = DateTime.now();
    var startFilter = DateTime(today.year, today.month, today.day, 0, 0, 0);
    DateTime endFilter;

    if (startFilter.weekday != DateTime.monday) {
      startFilter = startFilter.subtract(Duration(days: (startFilter.weekday - 1)));
    }

    endFilter = startFilter.add(const Duration(days: 7));
    final tasks = await _tasksRepository.findByperiod(startFilter, endFilter);
    return WeekTaskEntity(startDate: startFilter, endDate: endFilter, tasks: tasks);
  }

  @override
  Future<void> checkOrUncheckTask(TaskModel task) => _tasksRepository.checkOrUncheckTask(task);

  @override
  Future<void> deleteAllTasks() => _tasksRepository.deleteAllTasks();

  @override
  Future<void> deleteById(int id) => _tasksRepository.deleteById(id);
}
