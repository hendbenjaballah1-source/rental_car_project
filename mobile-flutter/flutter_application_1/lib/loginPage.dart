import 'package:flutter/material.dart';
import 'SignupPage.dart';
import 'HomePage.dart';
void main(){
  runApp(const loginPage());
}

class loginPage extends StatelessWidget{
  const loginPage({super.key});

  @override
   Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

     return MaterialApp(
      title: 'Tunisia Smart Rental Car',
      home: Scaffold(
          appBar: AppBar(),
      body: Center(
      child:SizedBox(
        width: 720,
        height: 720,

         child: Card(
          child: Padding(
            padding: const EdgeInsets.all(80),
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
                  'Connectez Vous Pour Réserver',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color:Color.fromARGB(255, 117, 106, 109),
                  ),
                ),
                const SizedBox(height: 200),
                TextField(
                  controller: emailController,
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
                const SizedBox(height: 16),
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isEmpty && passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Veuillez remplir les deux champs')),
                        );
                      } else if (emailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Veuillez saisir votre email')),
                        );
                      } else if (passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Veuillez saisir votre mot de passe')),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      }
                    },
                    child: const Text('Se connecter'),
                  ),
                ),
                const SizedBox(height: 20),
                Builder(
                  builder: (context) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const signupPage()),
                      );
                    },
                    child: const Text(
                      'Vous navez pas de compte?,créez un! ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 117, 106, 109),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
      ),
     );
  }
}