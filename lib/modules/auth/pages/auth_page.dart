import 'package:aurate/export.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  Images.logo,
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Where Elegance Meets Accuracy!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 52,
              ),
              ContinueWithGoogle(),
            ],
          ),
        ),
      ),
    );
  }
}
