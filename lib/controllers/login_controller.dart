import '../services/auth_service.dart';

class LoginController {
  final _authService = AuthService();

  void login(String email, String password) {
    _authService.authenticate(email, password);
    // Gérer la réponse de l'authentification ici
  }
}
