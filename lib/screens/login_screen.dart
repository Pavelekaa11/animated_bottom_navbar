import 'package:flutter/material.dart';
import 'package:tugas_abnb/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool sembunyikanPassword = true;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: ('Username'),
              ),
            ),
            TextField(
              obscureText: sembunyikanPassword,
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: ('Password'),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {});
                      sembunyikanPassword = !sembunyikanPassword;
                    },
                    icon: Icon(
                      sembunyikanPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final box = GetStorage();
                box.write('username', userNameController.text);

                Get.to(() => HomeScreen());
                Get.snackbar(
                  "Login",
                  "Berhasil Login",
                  snackPosition: SnackPosition.TOP,
                  snackStyle: SnackStyle.FLOATING,
                  backgroundColor: Colors.grey,
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
