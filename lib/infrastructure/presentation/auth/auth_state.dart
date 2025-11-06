import 'dart:convert';
import 'package:chattr_app/domain/entities/user.dart';
import 'package:chattr_app/domain/usecases/user_usecases.dart';
import 'package:chattr_app/infrastructure/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider({ required this.useCases }) { loadUser(); }

  final UserUseCases useCases;

  User? _user;
  User? get user => _user;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorName;
  String? _errorEmail;
  String? _errorPassword;

  String? get errorName => _errorName;
  String? get errorEmail => _errorEmail;
  String? get errorPassword => _errorPassword;

  /*
  bool validateRegisterFields(String name, String email, String password, BuildContext context) {
    _errorName = useCases.validateName(name, context);
    _errorEmail = useCases.validateEmail(email, context);
    _errorPassword = useCases.validatePassword(password, context);
    
    notifyListeners();
    
    return _errorName == null && _errorEmail == null && _errorPassword == null;
  }

  bool validateLoginFields(String email, String password, BuildContext context) {
    _errorEmail = userUseCase.validateEmail(email, context);
    _errorPassword = userUseCase.validatePassword(password, context);
    
    notifyListeners();
    
    return _errorEmail == null && _errorPassword == null;
  }
  */

  void clearErrors() {
    _errorName = null;
    _errorEmail = null;
    _errorPassword = null;

    notifyListeners();
  }

  Future<void> loadUser() async {
    _isInitialized = false;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString('user_data');

      if (userData != null) {
        final map = jsonDecode(userData);
        final temp = UserModel.fromJson(map);
        _user = temp.toEntity();
        notifyListeners();
      }
    } catch(e) {
      throw Exception("Error in Load User Provider: $e");
    } finally {
      _isInitialized = true;
      notifyListeners();
    }
  }

  Future<String?> addUser(User user) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Verifies if User with same Email already exists
      final existingUser = await useCases.getUserByEmail(user.email);

      if(existingUser != null) {
        return "Email already registered.";
      }

      // Receives the ID of new User
      final result = await useCases.addUser(user);

      if(result > 0) return null;
      return "Register Error.";
    } catch (e) {
      return "Unexpected Error.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> deleteUser() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Receives the number of rows affected
      final result = await useCases.deleteUser(user?.id);

      if(result > 0) return null;
      return "Delete User Error.";
    } catch (e) {
      return "Unexpected Error.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> updateUser(User? user) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Receives the number of rows affected
      final result = await useCases.updateUser(user!);
      
      if(result > 0) {
        _user = user;
        notifyListeners();

        final prefs = await SharedPreferences.getInstance();
        final model = UserModel.fromEntity(user);
        await prefs.setString('user_data', jsonEncode(model.toJson()));

        return null;
      }

      return "Update User Error.";
    } catch (e) {
      return "Unexpected Error.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> doLogin(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Receives the User
      final user = await useCases.login(email, password);

      if(user!=null) {
        _user = user;

        final prefs = await SharedPreferences.getInstance();
        final model = UserModel.fromEntity(user);
        await prefs.setString('user_data', jsonEncode(model.toJson()));

        notifyListeners();

        return null;
      }
      
      return "Email or Password incorrects.";
    } catch (e) {
      return "Unexpected Error.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _user = null;
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_data');
    } catch(e) {
      throw Exception("Error in Log Out Provider: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}