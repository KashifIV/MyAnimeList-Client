import 'package:flutter/material.dart';

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

  void initState(){
    super.initState(); 
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
    super.dispose();
  }
  int get _opacityValue => 255- (255*_alpha.value).toInt();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white.withAlpha(_opacityValue),),
              
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
              onPressed: () => _controller.isCompleted? _controller.reverse() : _controller.forward(),
            )
          ],
        ),
      ),
    );
  }
}