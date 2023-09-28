import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3/ui/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  Future _save() async {
    String username = _userController.text;
    String pass = _passController.text;
    if (pass != "admin123" && username != "admin@gmail.com") {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Wrong email or password"),
            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Ok"))],
          );
        },
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", username);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Login",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _userController,
              decoration: const InputDecoration(
                hintText: "Username",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: _save, child: const Text("Login to app")),
            )
          ],
        ),
      ),
    );
  }
}
