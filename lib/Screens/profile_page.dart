import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Perfil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const CircleAvatar(
              radius: 80, backgroundImage: AssetImage('assets/img/perfil.jpg')),
          const SizedBox(height: 20),
          const Text(
            'Guilherme Goulart Gritti',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 10),
          const Text(
            '22 Anos - Americana - SP',
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Organizador de Eventos.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text(
                      'Feedback Enviado !',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                    ),
                    backgroundColor: Colors.green,
                    action: SnackBarAction(
                      label: 'Fechar',
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ));
                },
                color: Color(0xFFcb6ce6),
                hoverColor: Colors.black,
              ),
              IconButton(
                icon: Icon(Icons.money),
                color: Color(0xFFcb6ce6),
                hoverColor: Colors.black,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text(
                      'Você enviou uma solicitação de match para esse usuário.',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                    ),
                    backgroundColor: Colors.green,
                    action: SnackBarAction(
                      label: 'Fechar',
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ));
                },
              ),
              IconButton(
                icon: Icon(Icons.clear),
                color: Color(0xFFcb6ce6),
                hoverColor: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
