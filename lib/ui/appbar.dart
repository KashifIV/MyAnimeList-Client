import 'package:flutter/material.dart';
import 'package:my_anime_list_client/domain/view_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget{
  @override 
  final Size preferedSize; 
  MyAppbar(): this.preferedSize = Size.fromHeight(60); 
  _MyAppbar createState() => _MyAppbar();

  @override
  Size get preferredSize => this.preferedSize; 
}
class _MyAppbar extends State<MyAppbar> with SingleTickerProviderStateMixin{
  AnimationController _controller; 
  Animation<double> _alpha; 

  TextEditingController _textController; 
  FocusNode keyboardFocus; 
  bool isSearching;
  void initState(){
    super.initState();
    isSearching = false; 
    keyboardFocus = FocusNode();  
    _controller = AnimationController(
    duration: const Duration(milliseconds: 500), vsync: this);
    _alpha = Tween(begin: 0.0, end:1.0 ).animate(
      CurvedAnimation(
        parent: _controller, 
        curve: Curves.decelerate))
      ..addListener((){
        setState(() {
          
        });
      }); 
  }
  void dispose(){
    _controller.dispose(); 
    keyboardFocus.dispose();
    super.dispose();
  }
  int get _opacityValue => 255- (255*_alpha.value).toInt(); 

  void _submitSearch(String query, ViewModel model, BuildContext context){
    setState(() {
      isSearching = true; 
    });
    model.submitSearch(query, context).then((value){
      setState(() {
        isSearching = false; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      builder: (context, child, model) => SafeArea(
      child: Container(
        child:Stack( 
          children: <Widget>[
          Positioned(
            left: MediaQuery.of(context).size.width*(1-_alpha.value) + MediaQuery.of(context).size.width*0.05,
            child:Theme(
              data: ThemeData.light(),
              child: Container(
              width: MediaQuery.of(context).size.width*0.93,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.grey,),
                    onPressed: () => (_textController.text == "") ? _controller.reverse() : _textController.clear(),
                  
                  ), 
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      focusNode: keyboardFocus,
                      onSubmitted: (value) => _submitSearch(value, model, context),
                      decoration: InputDecoration(
                        hintText: "Search for Anime", 
                        border: InputBorder.none
                      ),
                    ),
                  ), 
                  (isSearching) ? Container(width: 20, height: 20, child:CircularProgressIndicator(strokeWidth: 2,)) : SizedBox(width: 30,),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)), 
                color: Colors.white
              ),
            ),
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                enableFeedback: !_controller.isCompleted,
                icon: Icon(Icons.menu, color: Colors.white.withAlpha(_opacityValue),),
                onPressed: () => _controller.isCompleted ? _controller.reverse() : Scaffold.of(context).openDrawer(),
              ), 
              Text(
                'My Anime List', 
                style: TextStyle(
                  fontSize: 24,
                  color: Color(Colors.white.withAlpha(_opacityValue).value)
                ),
              ), 
              IconButton(
                icon: Icon(Icons.search, color: Colors.white,),
                enableFeedback: !_controller.isCompleted,
                color: Colors.white.withAlpha(_opacityValue),
                onPressed: (){
                  if (!_controller.isCompleted){
                    _controller.forward(); 
                    FocusScope.of(context).requestFocus(keyboardFocus); 
                  }
                }
              )
            ],
          ),
        ]
      )),
    ));
  }
}