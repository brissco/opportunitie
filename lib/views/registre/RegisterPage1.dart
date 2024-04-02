import 'package:flutter/material.dart';
import 'package:oopportinitie/views/registre/BackgroundPainter.dart';
// Importez vos widgets personnalisés et d'autres pages ici.

class RegisterPage1 extends StatelessWidget {
  const RegisterPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Logique pour définir les gradients et autres styles...

    return Scaffold(
      body: Stack(
        children: [
          // Ajoutez ici votre dégradé de fond et les formes personnalisées
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          // Ajoutez ici la disposition de vos éléments de formulaire
          // Utilisez des colonnes, des champs de texte et des boutons
        ],
      ),
    );
  }
}
