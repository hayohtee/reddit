import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class AuthController {
  final AuthRepository _authRepository;

  const AuthController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> signInWithGoogle() async {
    _authRepository.signInWithGoogle();
  }
}
