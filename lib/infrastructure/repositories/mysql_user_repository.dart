import 'package:chattr_app/domain/entities/user.dart';
import 'package:chattr_app/domain/repositories/user_repository.dart';

class MySQLUserRepository implements UserRepository {
  @override
  Future<int> addUser(User user) async {
    return 0;
  }

  @override
  Future<int> deleteUser(int? id) async {
    return 0;
  }
  
  @override
  Future<int> updateUser(User user) async {
    return 0;
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    return null;
  }

  @override
  Future<User?> login(String email, String password) async {
    return null;
  }

  @override
  Future<void> logout() async {
    
  }
}