import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: AnimationCard(
        Colors.lightGreen,
        Icons.message,
        'Click to see more',
        'This is the animated message box. Your hidden message. With animation padding widget. '
            'This is the animated message box. Your hidden message. With animation padding widget.'
            'This is the animated message box. Your hidden message. With animation padding widget.',
      ),
    );
  }
}

class AnimationCard extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String content;

  AnimationCard(this.color, this.icon, this.title, this.content);

  @override
  _AnimationCardState createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard> {
  var padding = 150.0;
  var bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPadding(
          padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
          duration: Duration(milliseconds: 1000),
          // curve: Curves.fastLinearToSlowEaseIn,
          curve: Curves.elasticOut,
          // curve: Curves.bounceInOut,
          child: Container(
            child: CardItem(
              widget.color,
              widget.icon,
              widget.title,
              widget.content,
                  () {
                setState(() {
                  padding = padding == 0 ? 150.0 : 0.0;
                  bottomPadding = bottomPadding == 0 ? 150 : 0.0;
                });
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: 20, left: 20, top: 200),
            height: 180,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2), blurRadius: 30)
              ],
              color: Colors.grey.shade200.withOpacity(1.0),
              borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Center(
                child: Icon(widget.icon,color: Colors.lightGreen.withOpacity(1.0), size: 70)
              // child: Image.asset('assets/logo.png', height: 100, width: 100,),
        ),
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String content;
  final onTap;

  CardItem(this.color, this.icon, this.title, this.content, this.onTap);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        height: 220,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xffFF6594).withOpacity(0.2), blurRadius: 25),
          ],
          color: color.withOpacity(1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                content,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Image.asset('assets/picture.png', height: 120, width: 120,),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
