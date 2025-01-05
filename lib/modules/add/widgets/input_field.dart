import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Widget? suffix;
  final bool? enabled;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  const InputField({
    super.key,
    required this.label,
    required this.controller,
    this.suffix,
    this.prefix,
    this.enabled,
    this.keyboardType,
    this.onChanged
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        suffix: widget.suffix,
        prefix: widget.prefix,
        border: OutlineInputBorder(),
        labelText: widget.label,
      ),
    );
  }
}
