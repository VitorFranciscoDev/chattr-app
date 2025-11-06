import 'package:chattr_app/infrastructure/presentation/auth/auth_state.dart';
import 'package:chattr_app/infrastructure/presentation/auth/user_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool _obscureText = false;

  Future<void> _login() async {
    
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                suffixIcon: _controllerEmail.text.isEmpty
                  ? null 
                  : IconButton(
                    onPressed: () {
                      setState(() {
                        _controllerEmail.clear();
                      });
                    }, 
                    icon: Icon(Icons.clear, color: Color(0xFF2E7D32)),
                  ),
                labelText: "Email",
                labelStyle: TextStyle(color: Color(0xFF2E7D32)),
                errorText: provider.errorName,
                filled: true,
                fillColor: Color(0xFFE8F5E9),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF81C784),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF2E7D32),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerPassword,
              obscureText: _obscureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    }, 
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Color(0xFF2E7D32)),
                  ),
                labelText: "Password",
                labelStyle: TextStyle(color: Color(0xFF2E7D32)),
                errorText: provider.errorPassword,
                filled: true,
                fillColor: Color(0xFFE8F5E9),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF81C784),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF2E7D32),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(), 
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Color(0xFF2E7D32),
                elevation: 5,
                shadowColor: Color(0xFF2E7D32).withOpacity(0.5),
              ),
              child: const Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider()),
                const SizedBox(width: 20),
                Text("or", style: TextStyle(color: Colors.grey[600])),
                const SizedBox(width: 20),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegisterScreen())), 
              child: const Text("Go to Register", style: TextStyle(color: Color(0xFF2E7D32))),
            ),
          ],
        ),
      ),
    );
  }
}