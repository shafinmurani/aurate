import 'package:flutter/material.dart';

import '../../../export.dart';

class ContinueWithGoogle extends StatefulWidget {
  const ContinueWithGoogle({super.key});

  @override
  State<ContinueWithGoogle> createState() => _ContinueWithGoogleState();
}

class _ContinueWithGoogleState extends State<ContinueWithGoogle> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AuthServices.googleSigIn();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 240, 239, 239),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.google_logo,
            height: 24,
          ),
          const SizedBox(
            width: 12,
          ),
          const Text(
            'Continue with Google',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
