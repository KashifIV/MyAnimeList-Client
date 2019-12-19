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
  TextEditingController _textController; 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    icon: Icon(Icons.search, color: Colors.grey,),
                    onPressed: () => _controller.reverse(),
                  
                  ), 
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search for Anime", 
                        border: InputBorder.none
                      ),
                    ),
                  )
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
                icon: Icon(Icons.menu, color: Colors.white.withAlpha(_opacityValue),),
                onPressed: () => _controller.isCompleted ? _controller.reverse() : null,
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
                color: Colors.white.withAlpha(_opacityValue),
                onPressed: () => !_controller.isCompleted? _controller.forward() : null,
              )
            ],
          ),
        ]
      )),
    );
  }
}