import 'package:chattr_app/domain/entities/user.dart';
import 'package:chattr_app/domain/repositories/user_repository.dart';

class UserUseCases {
  UserUseCases({ required this.repository });

  final UserRepository repository;

  Future<int> addUser(User user) async {
    return repository.addUser(user);
  }

  Future<int> deleteUser(int? id) async {
    return repository.deleteUser(id);
  }

  Future<int> updateUser(User user) async {
    return repository.updateUser(user);
  }

  Future<User?> getUserByEmail(String email) async {
    return repository.getUserByEmail(email);
  }

  Future<User?> login(String email, String password) async {
    return repository.login(email, password);
  }

  Future<void> logout() async {
    return repository.logout();
  }
}