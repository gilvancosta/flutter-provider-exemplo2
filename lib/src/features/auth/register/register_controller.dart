import '../../../core/exception/app_auth_exception.dart';
import '../../../core/notifier/default_change_notifier.dart';
import '../../../services/user/user_service.dart';

class RegisterController extends DefaultChangeNotifier {
  final UserService _userService;

  RegisterController({required UserService userService}) : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      final user = await _userService.register(email, password);
      if (user != null) {
        // sucess
        success();
      } else {
        //error
        setError('Erro ao registrar usuário');
      }
    } on AppAuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
