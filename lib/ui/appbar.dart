import 'package:flutter/material.dart';
import 'package:matching_app_framework/ui/login.dart';
import 'package:matching_app_framework/ui/profile.dart';

AppBar getAppBar(BuildContext context, text) {
  return AppBar(
    centerTitle: true,
    title: Text('' + text,
        style: TextStyle(fontSize: 32.0)
    ),
    leading: _buildProfileIconButton(),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.note),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(title: 'Matching App Framework - Profile'),
              )
          );
        },
      ),
      IconButton(
        icon: Icon(Icons.people),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(title: 'Matching App Framework - Login')
              )
          );
        },
      ),
      IconButton(
        icon: Icon(Icons.verified_user),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(title: 'Matching App Framework - Login')
              )
          );
        },
      ),
    ],
  );
}
Widget _buildProfileIconButton() {
  const iconSize = 32.0;
  const photoUrl = 'https://i.pinimg.com/564x/9a/58/90/9a5890d0ea7e56067ed44fbae3ff4552.jpg';
  return IconButton(
      icon: photoUrl == null
          ? Icon(
        Icons.account_circle,
        size: iconSize,
      )
          : CircleAvatar(
        //backgroundImage: NetworkImage(photoUrl),
        backgroundImage: Image.asset('assets/mio_imada.jpg').image,
        // backgroundImage: Image(image: AssetImage('assets/logo.png')).image,
        backgroundColor: Colors.transparent,
        radius: iconSize / 2,
      ),
      onPressed: () { return 0; } ,
    );
}