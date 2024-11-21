import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Future<void> sendSignInData() async {
      final dio = Dio();
      final url = 'https://uni3th.requestcatcher.com/';
      try {
        final response = await dio.post(
          url,
          data: {
            'username': usernameController.text,
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
      appBar: AppBar(title: const Text("Авторизація")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                  width: 200,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Логін'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введіть логін';
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
                      sendSignInData();
                    }
                  },
                  child: const Text("Увійти"),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text("Зареєструватися"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reset_password');
                    },
                    child: const Text("Відновити пароль"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
