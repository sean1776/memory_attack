import 'package:flutter/material.dart';
import 'package:memory_attack/board.dart';

class Square extends StatefulWidget {
  Square({Key key, this.oxSet, this.borderLeft, this.borderTop, this.borderRight, this.borderBottom, this.board}) : super(key: key);
  Board board;
  List<String> oxSet;
  bool borderLeft;
  bool borderTop;
  bool borderRight;
  bool borderBottom;
  
  bool leftTopShow = false;
  bool leftDownShow = false;
  bool rightTopShow = false;
  bool rightDownShow = false;

  int oCount = 2;
  int xCount = 2;

  void disable() {
    leftTopShow = false;
    leftDownShow = false;
    rightTopShow = false;
    rightDownShow = false;
    oCount = 2;
    xCount = 2;
  }

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  Color innerBorder = Colors.white12;
  Color outerBorder = Colors.white70;
  
  Widget leftTop;
  Widget leftDown;
  Widget rightTop;
  Widget rightDown;

  void showAllCards() {
    widget.leftTopShow = true;
    widget.leftDownShow = true;
    widget.rightTopShow = true;
    widget.rightDownShow = true;
  }

  void checkResult(int cardId) {
    if (widget.oCount == 0 || widget.xCount == 0) return;

    if (widget.oxSet[cardId] == "O") {
      widget.oCount -= 1;
    } else {
      widget.xCount -= 1;
    }

    if (widget.oCount == 0) {
      widget.oxSet = ["O", "O", "O", "O"];
      winnerHasShown("O");      
    }
    if (widget.xCount == 0) {
      widget.oxSet = ["X", "X", "X", "X"];
      winnerHasShown("X");
    }
    
    if (widget.oCount == 0 || widget.xCount == 0) showAllCards();

    return;
  }

  void winnerHasShown(String winner) {
    int id = getId();
    widget.board.setWinner(id, winner); 
  }

  int getId() {
    if (!widget.borderLeft && !widget.borderTop && widget.borderRight && widget.borderBottom) return 1;
    if (widget.borderLeft && !widget.borderTop && widget.borderRight && widget.borderBottom) return 2;
    if (widget.borderLeft && !widget.borderTop && !widget.borderRight && widget.borderBottom) return 3;
    if (!widget.borderLeft && widget.borderTop && widget.borderRight && widget.borderBottom) return 4;
    if (widget.borderLeft && widget.borderTop && widget.borderRight && widget.borderBottom) return 5;
    if (widget.borderLeft && widget.borderTop && !widget.borderRight && widget.borderBottom) return 6;
    if (!widget.borderLeft && widget.borderTop && widget.borderRight && !widget.borderBottom) return 7;
    if (widget.borderLeft && widget.borderTop && widget.borderRight && !widget.borderBottom) return 8;
    if (widget.borderLeft && widget.borderTop && !widget.borderRight && !widget.borderBottom) return 9;
    return 0;
  }

  BoxDecoration getLeftTopButtonDecoration() {
    Color colorLeft = widget.borderLeft ? outerBorder : innerBorder;
    Color colorTop = widget.borderTop ? outerBorder : innerBorder;
    Color colorRight = innerBorder;
    Color colorBottom = innerBorder;
    BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.blue,
      border: Border(
        left: BorderSide(color: colorLeft), 
        top: BorderSide(color: colorTop), 
        right: BorderSide(color: colorRight), 
        bottom: BorderSide(color: colorBottom),
      ),
    );
    return boxDecoration;
  }

  BoxDecoration getLeftDownButtonDecoration() {
    Color colorLeft = widget.borderLeft ? outerBorder : innerBorder;
    Color colorTop = innerBorder;
    Color colorRight = innerBorder;
    Color colorBottom = widget.borderBottom ? outerBorder : innerBorder;
    BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.blue,
      border: Border(
        left: BorderSide(color: colorLeft), 
        top: BorderSide(color: colorTop), 
        right: BorderSide(color: colorRight), 
        bottom: BorderSide(color: colorBottom),
      ),
    );
    return boxDecoration;
  }

  BoxDecoration getRightTopButtonDecoration() {
    Color colorLeft = innerBorder; 
    Color colorTop = widget.borderTop ? outerBorder : innerBorder;
    Color colorRight = widget.borderRight ? outerBorder : innerBorder;
    Color colorBottom = innerBorder;
    BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.blue,
      border: Border(
        left: BorderSide(color: colorLeft), 
        top: BorderSide(color: colorTop), 
        right: BorderSide(color: colorRight), 
        bottom: BorderSide(color: colorBottom),
      ),
    );
    return boxDecoration;
  }

  BoxDecoration getRightDownButtonDecoration() {
    Color colorLeft = innerBorder; 
    Color colorTop = innerBorder;
    Color colorRight = widget.borderRight ? outerBorder : innerBorder;
    Color colorBottom = widget.borderBottom ? outerBorder : innerBorder;
    BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.blue,
      border: Border(
        left: BorderSide(color: colorLeft), 
        top: BorderSide(color: colorTop), 
        right: BorderSide(color: colorRight), 
        bottom: BorderSide(color: colorBottom),
      ),
    );
    return boxDecoration;
  }

  void setButton() {
    leftTop = Container(
      width: 50.0,
      height: 50.0,            
      decoration: getLeftTopButtonDecoration(),
      child: FlatButton(      
        child: Text(widget.oxSet[0]),
        color: Colors.blue,        
        textColor: widget.leftTopShow ? Colors.white : Colors.blue,
        highlightColor: Colors.blue,
        onPressed: () {
          if (!widget.leftTopShow) {
            widget.leftTopShow = true;          
            checkResult(0);
            setState((){});          
          }          
        },      
      ),
    );
    leftDown = Container(    
      width: 50.0,
      height: 50.0,            
      decoration: getLeftDownButtonDecoration(),
      child: FlatButton(        
        child: Text(widget.oxSet[1]),
        color: Colors.blue, 
        textColor: widget.leftDownShow ? Colors.white : Colors.blue,
        onPressed: () {
          if (!widget.leftDownShow) {
            widget.leftDownShow = true;
            checkResult(1);
            setState((){});          
          }          
        },
      ),
    );
    rightTop = Container(    
      width: 50.0,
      height: 50.0,            
      decoration: getRightTopButtonDecoration(),
        child: FlatButton(
          child: Text(widget.oxSet[2]),
          color: Colors.blue, 
          textColor: widget.rightTopShow ? Colors.white : Colors.blue,
          onPressed: () {
            if (!widget.rightTopShow) {
              widget.rightTopShow = true;
              checkResult(2);
              setState((){});
            }            
          },
        ),
      );
    rightDown = Container(    
      width: 50.0,
      height: 50.0,            
      decoration: getRightDownButtonDecoration(),
      child: FlatButton(
        child: Text(widget.oxSet[3]),
        color: Colors.blue, 
        textColor: widget.rightDownShow ? Colors.white : Colors.blue,
        onPressed: () {
          if (!widget.rightDownShow) {
            widget.rightDownShow = true;
            checkResult(3);
            setState((){});          
          }
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {    
    setButton();
    return Column(
      children: <Widget>[
        Row(children: <Widget>[leftTop, rightTop],),
        Row(children: <Widget>[leftDown, rightDown],),
      ],
    );
  }  
}