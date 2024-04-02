import 'package:flutter/material.dart';
import 'package:oopportinitie/views/login/LoginScreen.dart';
import 'package:oopportinitie/views/worker/WorksInProgress/WorksInProgressPage.dart';
import 'package:oopportinitie/views/worker/profil/ProfilePage.dart';

class CustomDrawer extends StatelessWidget {
    final Function(int) onSelectItem;
    const CustomDrawer({Key? key, required this.onSelectItem}) : super(key: key);
    // const CustomDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("John Doe"),
                accountEmail: Text("john.doe@example.com"),
                currentAccountPicture: CircleAvatar(
                  // backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profil'),
                onTap: () {
                    Navigator.pop(context); // Ferme le drawer
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));

                    // Navigator.pop(context); // Fermer le drawer
                    // onSelectItem(1); // Index pour la page de profil
                    
                },
              ),
              ListTile(
                leading: Icon(Icons.work),
                title: Text('Nouveau Travail'),
                onTap: () {
                  Navigator.pop(context); // Ferme le drawer
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('Liste des Travaux'),
                onTap: () {
                  Navigator.pop(context); // Ferme le drawer
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorksInProgressPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Historique'),
                onTap: () {
                  // Navigate to a history page (not provided in the initial code)
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Paramètres'),
                onTap: () {
                  // Navigate to a settings page (not provided in the initial code)
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Aide & Support'),
                onTap: () {
                  // Navigate to a help/support page (not provided in the initial code)
                },
              ),
            ],
          ),
        );
  }
}
