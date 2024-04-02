import 'package:flutter/material.dart';
import 'package:oopportinitie/views/registre/RegisterPage.dart';
import 'package:oopportinitie/views/worker/Worker.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = LoginController();

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final buttonColor = isDarkMode ? Colors.tealAccent[700] : Colors.blue;
    final textColor = isDarkMode ? Colors.black : Colors.white;

    final gradient = LinearGradient(
      colors: [Colors.blue.shade300, Colors.blue.shade800],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: 'Email',
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Password',
                  isObscure: true,
                  icon: Icons.lock,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    loginController.login('email', 'password');
                  },
                  
                  style: ButtonStyle(
                    // primary: buttonColor,
                    // onPrimary: textColor,
                    backgroundColor: MaterialStateProperty.all(buttonColor), // Couleur de fond
                    foregroundColor: MaterialStateProperty.all(textColor), // Couleur du texte et des icônes
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(18.0),
                    // ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                    ),
                    // padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20), // Ajout d'un espace supplémentaire
                TextButton(
                  onPressed: () {
                    // Naviguer vers la page d'inscription
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                    // MaterialPageRoute(builder: (context) => RegisterPage()),
                    // );
                  },
                  child: const Text(
                    "Vous n'avez pas de compte ? Créez-en un",
                    style: TextStyle(
                      color: Colors.white, // Choisissez une couleur qui se démarque sur le dégradé
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}