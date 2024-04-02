import 'package:flutter/material.dart';
import 'package:oopportinitie/controllers/Registre_controllers.dart';
import 'package:oopportinitie/views/CustomTextField/CustomTextField.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  String? status = 'ACTIVE'; // Exemple de valeur par défaut

  final RegisterController controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Créer un compte")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Email',
              icon: Icons.email,
              controller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Mot de passe',
              isObscure: true,
              icon: Icons.lock,
              controller: passwordController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Nom',
              icon: Icons.person,
              controller: nameController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Ville, Pays',
              icon: Icons.location_city,
              controller: locationController,
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: status,
              onChanged: (newValue) {
                setState(() {
                  status = newValue;
                });
              },
              items: ['ACTIVE', 'INACTIVE']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await controller.registerUser(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  location: locationController.text,
                  status: status!,
                );
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Inscription réussie")),
                  );
                  // Naviguer vers une autre page ou montrer un succès
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Échec de l'inscription")),
                  );
                }
              },
              child: Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}
