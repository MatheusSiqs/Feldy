import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F7),
      appBar: AppBar(
      title: Text("Profile"),
      actions: [
        IconButton(onPressed: () {
          
        }, icon: Icon(Icons.logout))
      ],
    ),
      body: _profilePage(),
    );
  }

  Widget _appBar(){
    return AppBar(
      title: Text("Profile"),
      actions: [
        IconButton(onPressed: () {
          
        }, icon: Icon(Icons.logout))
      ],
    );
  }

  Widget _profilePage(){
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            _avatar(),
            _changeAvatarButton(),
            SizedBox(height: 30,),
            _usernameTile(),
            _emailTile(),
            _descriptionTile(),
            _saveProfileChangesButton()
          ],
        ),
      )
    );
  }

  Widget _avatar(){
    return CircleAvatar(
      radius: 50,
      child: Icon(Icons.person),
    );
  }

  Widget _changeAvatarButton(){
    return TextButton(
      onPressed: () {}, 
      child: Text("Change Avatar"),
    );
  }

  Widget _usernameTile(){
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.person),
      title: Text("My Username"),
    );
  }

  Widget _emailTile(){
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.mail),
      title: Text("Me Email"),
    );
  }

  Widget _descriptionTile(){
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.edit),
      title: TextFormField(
        decoration: InputDecoration.collapsed(hintText: "Say something about yourself"),
        maxLines: null,
      ),
    );
  }

  Widget _saveProfileChangesButton(){
    return ElevatedButton(
      onPressed: () {}, 
      child: Text('Save Change'));
  }

}