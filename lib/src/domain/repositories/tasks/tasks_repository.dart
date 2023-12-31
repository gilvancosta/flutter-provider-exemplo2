
import '../../models/task_model.dart';

abstract class TasksRepository {
  Future<void> save(DateTime date, String description);
  Future<void> deleteById(int id);
  Future<void> deleteAllTasks();
  Future<List<TaskModel>> findByperiod(DateTime start, DateTime end);
  Future<void> checkOrUncheckTask(TaskModel task);
}
