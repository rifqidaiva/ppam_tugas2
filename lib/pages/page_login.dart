import 'package:flutter/material.dart';
import 'package:ppam_tugas2/pages/page_friends.dart';
import 'package:ppam_tugas2/datastore/user.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loginIcon(icon: Icons.message),
              _loginText(
                text:
                    "Silahkan masuk aplikasi Tugas 2 Praktikum Pemrograman Aplikasi Mobile.",
              ),
              _loginForm(
                controller: _usernameController,
                label: "username",
                obscureText: false,
                icon: Icons.person,
              ),
              _loginForm(
                controller: _passwordController,
                label: "password",
                obscureText: true,
                icon: Icons.key,
              ),
              _loginButton(
                text: "Masuk",
                onPressed: () {
                  var usernameInput = _usernameController.text;
                  var passwordInput = _passwordController.text;
                  var user = User(username: usernameInput);

                  if (user.login(passwordInput)) {
                    // MARK: pushReplacement & passing data
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageFriends(
                          user: user,
                        ),
                      ),
                    );

                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Login gagal, username atau password salah!"),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginIcon({required IconData icon}) {
    return Icon(
      icon,
      size: 64,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  Widget _loginButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: FilledButton(onPressed: onPressed, child: Text(text)),
    );
  }

  Widget _loginText({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(text, style: Theme.of(context).textTheme.bodySmall),
    );
  }

  Widget _loginForm({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          label: Row(
            children: [
              Icon(
                icon,
                size: 16,
              ),
              const SizedBox(width: 12),
              Text(label),
            ],
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          filled: true,
        ),
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
