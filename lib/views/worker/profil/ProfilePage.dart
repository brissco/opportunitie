import 'package:flutter/material.dart';
import 'package:oopportinitie/model/LanguageSkill.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil du Travailleur'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderSection(),
            SummarySection(),
            PortfolioSection(),
            SkillsSection(),
            LanguagesSection(),
            // Ajoutez d'autres sections ici selon le modèle ci-dessus.
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  String name = 'John Doe';
  String profession = 'Développeur Mobile';

  void _editProfile() {
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController professionController = TextEditingController(text: profession);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Modifier le profil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nom'),
              ),
              TextField(
                controller: professionController,
                decoration: InputDecoration(labelText: 'Profession'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Annuler'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Sauvegarder'),
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  profession = professionController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    profession,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _editProfile,
          ),
        ],
      ),
    );
  }
}


class SummarySection extends StatefulWidget {
  @override
  _SummarySectionState createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  String summaryText = 'Résumé professionnel ici. Un court paragraphe qui permet au travailleur de présenter ses principales compétences, son expérience et ses objectifs de carrière.';

  void _editSummary() {
    // Affichez une boîte de dialogue ou une nouvelle page pour éditer le résumé
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Retourne un objet de type Dialog
        return AlertDialog(
          title: new Text("Modifier le résumé"),
          content: new TextField(
            controller: TextEditingController(text: summaryText),
            autofocus: true,
            maxLines: null,
            onChanged: (value) {
              summaryText = value; // Mise à jour du texte
            },
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
            ),
            new TextButton(
              child: new Text("Sauvegarder"),
              onPressed: () {
                setState(() {
                  // Met à jour le texte et ferme la boîte de dialogue
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: _editSummary, // Lorsque l'utilisateur tape sur la section, la fonction d'édition est appelée
        child: Text(
          summaryText,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

class PortfolioSection extends StatefulWidget {
  @override
  _PortfolioSectionState createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  List<String> images = [
    'https://via.placeholder.com/200',
    'https://via.placeholder.com/200',
    // Ajoutez plus si nécessaire
  ];

  void _addImage() {
    TextEditingController urlController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ajouter une nouvelle image"),
          content: TextField(
            controller: urlController,
            decoration: InputDecoration(hintText: "URL de l'image"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Ajouter"),
              onPressed: () {
                if (urlController.text.isNotEmpty) {
                  setState(() {
                    images.add(urlController.text);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _editImage(int index) {
    TextEditingController urlController = TextEditingController(text: images[index]);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Modifier l'image"),
          content: TextField(
            controller: urlController,
            decoration: InputDecoration(hintText: "URL de l'image"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Supprimer"),
              onPressed: () {
                setState(() {
                  images.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Sauvegarder"),
              onPressed: () {
                if (urlController.text.isNotEmpty) {
                  setState(() {
                    images[index] = urlController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Portfolio',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _editImage(index),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _addImage,
            child: Text('Ajouter une image'),
          ),
        ],
      ),
    );
  }
}


class SkillsSection extends StatefulWidget {
  @override
  _SkillsSectionState createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  // Utilisation d'une liste de Maps pour gérer les compétences et leurs niveaux
  List<Map<String, dynamic>> skills = [
    {'skill': 'Flutter', 'level': 0.7},
    {'skill': 'Dart', 'level': 0.8},
    {'skill': 'Firebase', 'level': 0.6},
    {'skill': 'REST API', 'level': 0.5},
  ];

  void _addSkill() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter une compétence'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Entrez une compétence',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Ajouter'),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    skills.add({'skill': controller.text.trim(), 'level': 0.5});
                    controller.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _removeSkill(String skill) {
    setState(() {
      skills = skills.where((s) => s['skill'] != skill).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Compétences techniques et logicielles',
            style: Theme.of(context).textTheme.headline6,
          ),
          ...skills.map((skillData) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(skillData['skill'])),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeSkill(skillData['skill']),
                    ),
                  ],
                ),
                Slider(
                  value: skillData['level'],
                  min: 0,
                  max: 1,
                  divisions: 10,
                  label: (skillData['level'] * 100).toStringAsFixed(0) + '%',
                  onChanged: (double value) {
                    setState(() {
                      skillData['level'] = value;
                    });
                  },
                ),
              ],
            );
          }).toList(),
          OutlinedButton(
            onPressed: _addSkill,
            child: Text('Ajouter une compétence'),
          ),
        ],
      ),
    );
  }
}

class LanguagesSection extends StatefulWidget {
  @override
  _LanguagesSectionState createState() => _LanguagesSectionState();
}

class _LanguagesSectionState extends State<LanguagesSection> {
  List<LanguageSkill> languages = [
    LanguageSkill(name: 'Français', level: 1.0),
    LanguageSkill(name: 'Anglais', level: 0.9),
    LanguageSkill(name: 'Espagnol', level: 0.7),
  ];

  void _addLanguage() {
    // Déclare les variables locales pour stocker temporairement les valeurs saisies dans la boîte de dialogue.
    String newLanguageName = '';
    double newLanguageLevel = 0.5; // Niveau initial du slider.

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Utilise StatefulBuilder pour créer un état local à la boîte de dialogue.
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text('Ajouter une nouvelle langue'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nom de la langue',
                    ),
                    onChanged: (value) {
                      newLanguageName = value;
                    },
                  ),
                  SizedBox(height: 20),
                  Text('Niveau: ${(newLanguageLevel * 100).toInt()}%'),
                  Slider(
                    min: 0,
                    max: 1.0,
                    divisions: 10,
                    value: newLanguageLevel,
                    onChanged: (value) {
                      // Met à jour l'état de la boîte de dialogue, pas de l'extérieur.
                      setStateDialog(() {
                        newLanguageLevel = value;
                      });
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Annuler'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text('Ajouter'),
                  onPressed: () {
                    if (newLanguageName.isNotEmpty) {
                      // Met à jour l'état extérieur avec les nouvelles valeurs.
                      setState(() {
                        languages.add(LanguageSkill(name: newLanguageName, level: newLanguageLevel));
                      });
                      Navigator.of(context).pop(); // Ferme la boîte de dialogue.
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _removeLanguage(String name) {
    setState(() {
      languages.removeWhere((lang) => lang.name == name);
    });
  }

  void _updateLanguage(String name, double level) {
    int index = languages.indexWhere((lang) => lang.name == name);
    if (index != -1) {
      setState(() {
        languages[index].level = level;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Langues parlées',
            style: Theme.of(context).textTheme.headline6,
          ),
          ...languages.map((language) {
            return ListTile(
              title: Text(language.name),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removeLanguage(language.name),
              ),
              subtitle: Slider(
                value: language.level,
                min: 0.0,
                max: 1.0,
                divisions: 10,
                label: '${(language.level * 100).toInt()}%',
                onChanged: (newLevel) {
                  _updateLanguage(language.name, newLevel);
                },
              ),
            );
          }).toList(),
          ElevatedButton(
            onPressed: () {
              // Appeler _addLanguage ici
              _addLanguage();
            },
            child: Text('Ajouter une langue'),
          ),
        ],
      ),
    );
  }
}
