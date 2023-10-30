import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('Feldy'),
        actions: [
          IconButton(onPressed: () {
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Account()))
          }, icon: const Icon(Icons.account_circle),),
        ],
      ),
      body: _postListView(),
    );
  }
    Widget _postAuthorRow(){
    double avatarDiameter = 44;
    return Row(
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
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                fit: BoxFit.cover,
              )
            ),
          ),
        ),
        const Text(
          "username",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
        ),)
      ],
    );
  }

  Widget _postImage(){
    return AspectRatio(
      aspectRatio: 1,
      child: Image.network(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _postCaption(){
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      child: Text(
        'Cartola, verde que te quero rosa Aka. Mangueira'
      ),
    );
  }

  Widget _postView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(),
        _postImage(),
        _postCaption(),
      ],
    );
  }

  Widget _postListView(){
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context,index){
        return _postView();
      },
    );
}
}