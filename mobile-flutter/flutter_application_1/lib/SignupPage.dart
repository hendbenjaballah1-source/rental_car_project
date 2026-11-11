import 'package:flutter/material.dart';
import 'loginPage.dart';
void main(){
  runApp(const signupPage());
}

class signupPage extends StatelessWidget{
  const signupPage({super.key});
  @override
   Widget build(BuildContext context) {
    final nomController = TextEditingController();
    final prenomController = TextEditingController();
    final telController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();

     return MaterialApp(
      title: 'Tunisia Smart Rental Car',
      home: Scaffold(
    
      body: Center(
      child:SizedBox(
        width: 720,
        height: 720,
         child: Card(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Tunisia Smart Rental Car' ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
                const Text(
                  'Créez Votre Compte Pour Réserver',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color:Color.fromARGB(255, 117, 106, 109),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: nomController,
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: prenomController,
                  decoration: const InputDecoration(
                    labelText: 'Prénom',
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: telController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Téléphone',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: confirmController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmation du mot de passe',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      String mdp = passwordController.text;

                      if (nomController.text.isEmpty ||
                          prenomController.text.isEmpty ||
                          telController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          mdp.isEmpty ||
                          confirmController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Veuillez remplir tous les champs')),
                        );
                      } else if (telController.text.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Le numéro de téléphone doit contenir 8 chiffres')),
                        );
                      } else if (!emailController.text.contains('@')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Email incorrect')),
                        );
                      } else if (mdp.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Le mot de passe doit contenir au moins 6 caractères')),
                        );
                      } else if (!mdp.contains(RegExp(r'[A-Z]'))) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Le mot de passe doit contenir une lettre majuscule')),
                        );
                      } else if (!mdp.contains(RegExp(r'[0-9]'))) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Le mot de passe doit contenir un chiffre')),
                        );
                      } else if (!mdp.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]'))) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Le mot de passe doit contenir un caractère spécial')),
                        );
                      } else if (mdp != confirmController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Les mots de passe ne sont pas identiques')),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const loginPage()),
                        );
                      }
                    },
                    child: const Text('Créer mon compte'),
                  ),
                ),
              ],
            ),
            ),
          ),
        ),
      ),
    ),
      ),
     );
  }
}