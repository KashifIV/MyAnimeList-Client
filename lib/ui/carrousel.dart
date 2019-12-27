import 'package:flutter/material.dart';

class Carrousel extends StatefulWidget{
  final List<Widget> items; 
  Carrousel({this.items}); 
  _Carrousel createState() => _Carrousel(); 
}

class _Carrousel extends State<Carrousel> with SingleTickerProviderStateMixin{
  AnimationController _controller; 
  Animation<double> _fade; 
  void initState(){
    super.initState(); 
    _controller = AnimationController(
    duration: const Duration(milliseconds: 500), vsync: this);
    _fade = Tween(begin: 0.0, end: 5.0).animate(   
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
  double get fadeOffset => _fade == null ? 0 : _fade.value; 
  @override
  Widget build(BuildContext context) {
    if (widget.items == null){
      return Center(child: CircularProgressIndicator()); 
    }
    //else _controller.forward();
    List<Widget> seperatedItems = [] ; 
    widget.items.forEach((item){
      seperatedItems.add(item); 
      seperatedItems.add(SizedBox(width: 20,));
    });
   
    return Container(
      height: 200,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: seperatedItems
      ), 
    );
  }
}