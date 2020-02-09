import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:my_anime_list_client/domain/view_model.dart';

class DisplayUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      builder: (context, child, model) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Text(
          model.isAuthorized() ? 'Welcome back ' + model.user.name:'Not Logged In', 
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}