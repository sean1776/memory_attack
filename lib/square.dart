import 'package:flutter/material.dart';
import 'package:memory_attack/board.dart';

typedef void ChangeTurn();

class Square extends StatefulWidget {
  Square({Key key, this.oxSet, this.borderLeft, this.borderTop, this.borderRight, this.borderBottom, this.board, this.changeTurn}) : super(key: key);
  Board board;  
  final ChangeTurn changeTurn;
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

  bool freeze = false;
  
  Color buttonColor = Colors.blue;
  Color initialColor = Colors.blue;
  Color winnerColor = Colors.red[300];
  
  void setWinnerSet(String winner) {
    oxSet = [winner, winner, winner, winner];
  }

  void setAllCardsOpen(bool open) {    
    if (open) {
      leftTopShow = true;
      leftDownShow = true;
      rightTopShow = true;
      rightDownShow = true;
    }
  }

  void setWinnerColor() {
    buttonColor = winnerColor;  
      
  }

  void setInitialColor() {
    buttonColor = initialColor;        
  }

  void refresh() {
    leftTopShow = false;
    leftDownShow = false;
    rightTopShow = false;
    rightDownShow = false;
    oCount = 2;
    xCount = 2;
    freeze = false;
  }

  void disable() {
    freeze = true;
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

    widget.changeTurn();

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
      color: widget.buttonColor,
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
      color: widget.buttonColor,
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
      color: widget.buttonColor,
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
      color: widget.buttonColor,
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
        color: widget.buttonColor,        
        textColor: widget.leftTopShow ? Colors.white : widget.buttonColor,
        highlightColor: widget.buttonColor,
        onPressed: () {
          if (!widget.freeze && !widget.leftTopShow) {
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
        color: widget.buttonColor, 
        textColor: widget.leftDownShow ? Colors.white : widget.buttonColor,
        onPressed: () {
          if (!widget.freeze && !widget.leftDownShow) {
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
          color: widget.buttonColor, 
          textColor: widget.rightTopShow ? Colors.white : widget.buttonColor,
          onPressed: () {
            if (!widget.freeze && !widget.rightTopShow) {
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
        color: widget.buttonColor, 
        textColor: widget.rightDownShow ? Colors.white : widget.buttonColor,
        onPressed: () {
          if (!widget.freeze && !widget.rightDownShow) {
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