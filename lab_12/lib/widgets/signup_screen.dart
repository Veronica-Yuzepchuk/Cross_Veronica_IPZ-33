import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Future<void> sendSignupData() async {
      final dio = Dio();
      final url = 'https://uni3th.requestcatcher.com/';
      try {
        final response = await dio.post(
          url,
          data: {
            'username': usernameController.text,
            'email': emailController.text,
            'password': passwordController.text,
          },
        );
        if (response.statusCode == 200) {
          print('Data sent successfully');
        } else {
          print('Failed to send data');
        }
      } catch (e) {
        print('Error: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Реєстрація")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Ім’я користувача'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введіть ім’я користувача';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Електронна пошта'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введіть електронну пошту';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Невірний формат електронної пошти';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Пароль'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введіть пароль';
                  } else if (value.length < 7) {
                    return 'Пароль має містити не менше 7 символів';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      sendSignupData();
                    }
                  },
                  child: const Text("Зареєструватися"),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Повернутися до авторизації"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
