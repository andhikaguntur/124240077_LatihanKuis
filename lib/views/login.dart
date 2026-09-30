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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://upload.wikimedia.org/wikipedia/id/5/5c/LogoMieGacoan.png?utm_source=id.wikipedia.org&utm_campaign=index&utm_content=original",
                width: 200,
                height: 200,
              ),
              const Text('Selamat datang di Gacoan!'),

              _usernameField(_usernameController),

              _passwordField(_passwordController),

              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  final username = _usernameController.text;
                  final result = _loginController.login(
                    username,
                    _passwordController.text,
                  );

                  if (result) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Root(username: username),
                      ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white60,
                ),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: 'Password',
        ),
      ),
    );
  }
}
