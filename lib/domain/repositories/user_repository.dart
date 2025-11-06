import 'package:chattr_app/domain/entities/user.dart';

abstract class UserRepository {
  Future<int> addUser(User user);
  Future<int> deleteUser(int? id);
  Future<int> updateUser(User user);
  Future<User?> getUserByEmail(String email);
  Future<User> login(String email, String password);
  Future<void> logout();
}