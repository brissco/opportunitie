import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Définition du Paint pour le gradient
    Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    // Dessiner le gradient sur tout le fond
    canvas.drawRect(
      Rect.fromLTRB(0, 0, size.width, size.height),
      paint,
    );

    // Pour la forme personnalisée en bas, vous pouvez utiliser un Path et le dessiner sur le canevas
    Path path = Path();
    // Exemple de courbe. Vous devrez ajuster cela pour correspondre à votre design spécifique
    path.lineTo(0, size.height * 0.75); // Commence à la gauche en bas
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.85,
        size.width * 0.5, size.height * 0.75); // Courbe du quart inférieur
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.65,
        size.width, size.height * 0.75); // Courbe du quart supérieur
    path.lineTo(size.width, size.height); // Ligne vers la droite en bas
    path.lineTo(0, size.height); // Ligne vers la gauche en bas pour fermer la forme
    path.close();

    // Dessiner la forme personnalisée avec une couleur de remplissage
    paint
      ..shader = null // Réinitialiser le shader pour dessiner une couleur pleine
      ..color = Colors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
