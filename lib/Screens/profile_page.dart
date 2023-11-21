import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(250 / 2),
                  child: Image.asset(
                    'img/perfil.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nome: Guilherme Goulart Gritti',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Text(
              'Usuário: @gguilherme-gritti',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Data de Nascimento: 01/01/2000', // Substitua pela data de nascimento do usuário
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
