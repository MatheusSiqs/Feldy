//import 'dart:io';

import 'package:feldy/Screens/profile_page.dart';
import 'package:feldy/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  //final _avatar = 'https://setor1.band.uol.com.br/wp-content/uploads/2020/12/cartola-v.jpg';
  //final _image = 'https://dhhim4ltzu1pj.cloudfront.net/media/images/dash_article_cover01.2e16d0ba.fill-1200x630.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(Logout());
        },
        child: const Icon(Icons.logout),
      ),
      appBar: AppBar(
        title: const Text('Feldy'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));
          }, icon: const Icon(Icons.account_circle),),
        ],
      ),
      body: _postListView(),
    );
  }
    Widget _postAuthorRow(){
    double avatarDiameter = 44;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage())),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter/2),
                child: /*CachedNetworkImage(
                  imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  fit: BoxFit.cover,
                )*/
                Image.asset(
                  'img/perfil.jpg',
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          const Text(
            "Guilherme Gritti",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
          ),)
        ],
      ),
    );
  }

  Widget _postImage(int index){
    return AspectRatio(
      aspectRatio: 1,
      child: /*CachedNetworkImage(
        imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        fit: BoxFit.cover,
      ),*/
      Image(image: AssetImage('img/img$index.jpeg'),
        fit: BoxFit.cover
      )
    );
  }

  Widget _postCaption(){
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      child: Text(
        'Link na bio'
      ),
    );
  }

  Widget _postView(int index){
    return  Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3)
            )
          ]
        ),
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _postAuthorRow(),
            _postImage(index),
            _postCaption(),
          ],
        ),
      ),
    );
  }

  Widget _postListView(){
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context,index){
        return _postView(index);
      },
    );
}
}