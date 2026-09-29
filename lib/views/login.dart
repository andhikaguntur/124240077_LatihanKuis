import 'package:flutter/material.dart';
import 'package:lat_kuis/controllers/logincontroller.dart';
import 'package:lat_kuis/root.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final LoginController _loginController = LoginController();

  bool isLoggedin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Selamat datang di Gacoan!'),

              _usernameField(_usernameController),

              _passwordField(_passwordController),

              ElevatedButton(
                onPressed: () {
                  bool result = _loginController.login(
                    _usernameController.text,
                    _passwordController.text,
                  );

                  if (result) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Root()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username atau password salah'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
        ),
      ),
    );
  }

  Widget _passwordField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    );
  }
}
