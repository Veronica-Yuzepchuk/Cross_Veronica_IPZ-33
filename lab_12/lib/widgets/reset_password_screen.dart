import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();

    Future<void> sendResetPasswordData() async {
      final dio = Dio();
      final url = 'https://uni3th.requestcatcher.com/';
      try {
        final response = await dio.post(
          url,
          data: {
            'email': emailController.text,
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
      appBar: AppBar(title: const Text("Відновлення паролю")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      sendResetPasswordData();
                    }
                  },
                  child: const Text("Відновити пароль"),
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
