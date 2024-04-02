import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  final IconData? icon; // Ajout d'un nouveau paramètre pour l'icône

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.isObscure = false,
    this.icon, // Accepter une icône comme paramètre
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        prefixIcon: icon != null ? Icon(icon) : null, // Afficher l'icône si elle est fournie
      ),
    );
  }
}
