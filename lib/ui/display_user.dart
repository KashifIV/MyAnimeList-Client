import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:my_anime_list_client/domain/view_model.dart';

class DisplayUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      builder: (context, child, model) => Container(
        child: Text(
          model.isAuthorized() ? 
        ),
      ),
    );
  }
}