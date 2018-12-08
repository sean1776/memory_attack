import 'package:flutter/material.dart';
import 'package:memory_attack/square.dart';
import 'package:memory_attack/board.dart';
import 'package:flutter/services.dart';
import 'dart:math';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String gameTitle = 'Tic-Tac-Toe(Dark)';
  @override
  Widget build(BuildContext context) {

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

    return MaterialApp(
      title: gameTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: gameTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  Board _board;
  String oResult = 'O';
  String xResult = 'X';
  
  String _turn = "O";

  Square square_1;
  Square square_2;
  Square square_3;
  Square square_4;
  Square square_5;
  Square square_6;
  Square square_7;
  Square square_8;
  Square square_9;
  
  
  
  @override
  void initState() {      
      super.initState();
      _board = Board(gameOver: renderWinner);
      square_1 = square("BR"); square_2 = square("LBR"); square_3 = square("LB");
      square_4 = square("TRB"); square_5 = square("LTRB"); square_6 = square("LTB");
      square_7 = square("TR"); square_8 = square("LTR"); square_9 = square("LT");     
      
    }

  void renderWinner(String winner, int winnerLine) {

    setState(() {
      if (winner == "O") {
        oResult = "O is Winner :)";
        xResult = "X is Loser :|";
        disableAllButtons();
        drawWinnerLine(winner, winnerLine);
      } 

      if (winner == "X") {
        xResult = "X is Winner :)";
        oResult = "O is Loser :|";
        disableAllButtons();
        drawWinnerLine(winner, winnerLine);
      }

      if (winner == "Tie") {
        xResult = " Game is tie";
        oResult = " Game is tie";
        disableAllButtons();
        drawWinnerLine(winner, winnerLine);
      } 
    });
  }

  void drawWinnerLine(String winner, int winnerLine) {
    if (winnerLine <= 0) return;
        
      if (winnerLine == 1) {
        square_1 = square("BR"); square_2 = square("LBR"); square_3 = square("LB");
        square_1.setWinnerColor();square_2.setWinnerColor();square_3.setWinnerColor();  
        square_1.setWinnerSet(winner);square_2.setWinnerSet(winner);square_3.setWinnerSet(winner);                                    
        square_1.setAllCardsOpen(true);square_2.setAllCardsOpen(true);square_3.setAllCardsOpen(true);

      }
      if (winnerLine == 2) {
        square_4 = square("TRB"); square_5 = square("LTRB"); square_6 = square("LTB");
        square_4.setWinnerColor();square_5.setWinnerColor();square_6.setWinnerColor();  
        square_4.setWinnerSet(winner);square_5.setWinnerSet(winner);square_6.setWinnerSet(winner);                                    
        square_4.setAllCardsOpen(true);square_5.setAllCardsOpen(true);square_6.setAllCardsOpen(true);    
      }
      if (winnerLine == 3) {
        square_7 = square("TR"); square_8 = square("LTR"); square_9 = square("LT");
        square_7.setWinnerColor();square_8.setWinnerColor();square_9.setWinnerColor();  
        square_7.setWinnerSet(winner);square_8.setWinnerSet(winner);square_9.setWinnerSet(winner);                                    
        square_7.setAllCardsOpen(true);square_8.setAllCardsOpen(true);square_9.setAllCardsOpen(true);    

      }
      if (winnerLine == 4) {
        square_1 = square("BR");square_4 = square("TRB");square_7 = square("TR");
        square_1.setWinnerColor();square_4.setWinnerColor();square_7.setWinnerColor();  
        square_1.setWinnerSet(winner);square_4.setWinnerSet(winner);square_7.setWinnerSet(winner);                                    
        square_1.setAllCardsOpen(true);square_4.setAllCardsOpen(true);square_7.setAllCardsOpen(true);    
      }
      if (winnerLine == 5) {
        square_2 = square("LBR");square_5 = square("LTRB");square_8 = square("LTR");
        square_2.setWinnerColor();square_5.setWinnerColor();square_8.setWinnerColor();  
        square_2.setWinnerSet(winner);square_5.setWinnerSet(winner);square_8.setWinnerSet(winner);                                    
        square_2.setAllCardsOpen(true);square_5.setAllCardsOpen(true);square_8.setAllCardsOpen(true);    
      }
      if (winnerLine == 6) {
        square_3 = square("LB");square_6 = square("LTB");square_9 = square("LT");
        square_3.setWinnerColor();square_6.setWinnerColor();square_9.setWinnerColor();  
        square_3.setWinnerSet(winner);square_6.setWinnerSet(winner);square_9.setWinnerSet(winner);                                    
        square_3.setAllCardsOpen(true);square_6.setAllCardsOpen(true);square_9.setAllCardsOpen(true);    
      }
      if (winnerLine == 7) {
        square_1 = square("BR");square_5 = square("LTRB");square_9 = square("LT");
        square_1.setWinnerColor();square_5.setWinnerColor();square_9.setWinnerColor();  
        square_1.setWinnerSet(winner);square_5.setWinnerSet(winner);square_9.setWinnerSet(winner);                                    
        square_1.setAllCardsOpen(true);square_5.setAllCardsOpen(true);square_9.setAllCardsOpen(true);    

      }
      if (winnerLine == 8) {
        square_7 = square("TR");square_5 = square("LTRB");square_3 = square("LB");
        square_7.setWinnerColor();square_5.setWinnerColor();square_3.setWinnerColor();  
        square_7.setWinnerSet(winner);square_5.setWinnerSet(winner);square_3.setWinnerSet(winner);                                    
        square_7.setAllCardsOpen(true);square_5.setAllCardsOpen(true);square_3.setAllCardsOpen(true);    
      }  
    setState(() {}); 
  }

  void disableAllButtons() {      
      square_1.disable(); square_2.disable(); square_3.disable();
      square_4.disable(); square_5.disable(); square_6.disable();
      square_7.disable(); square_8.disable(); square_9.disable();      
  }

  List<String> createOXSet() {
    List<String> oxSet = [];
    int oCount = 2;
    int xCount = 2;
    var random = Random();
    for (int i = 0; i < 4; i++) {
      while (oCount > 0 && xCount > 0) {
        bool o = random.nextBool();
        if (o) {
          oxSet.add("O");  
          oCount -= 1;
        } else {
          oxSet.add("X");
          xCount -= 1;
        }
      }
      while (oCount > 0) {
        oxSet.add("O");
        oCount -= 1;
      }
      while (xCount > 0) {
        oxSet.add("X");
        xCount -= 1;
      }
    }

    if (oxSet.length != 4) {      
      return ["X", "X", "X", "X"];
    }

    return oxSet;
  }

  void changeTurn() {
    if (_turn == "O") {
      _turn = "X";
    } else {
      _turn = "O";
    }
    setState(() {
          
        });
  }

  Widget square(String border) {
    bool borderLeft = border.contains("L");
    bool borderTop = border.contains("T");
    bool borderRight = border.contains("R");
    bool borderBottom = border.contains("B");

    return Square(
      oxSet: createOXSet(),
      borderLeft: borderLeft,
      borderTop: borderTop,
      borderRight: borderRight,
      borderBottom: borderBottom,     
      board: _board, 
      changeTurn: changeTurn,
      
      );
  }
  
  void _refresh() {
    _board = Board(gameOver: renderWinner);
    oResult = 'O';
    xResult = 'X';

    square_1 = square("BR"); square_2 = square("LBR"); square_3 = square("LB");
    square_4 = square("TRB"); square_5 = square("LTRB"); square_6 = square("LTB");
    square_7 = square("TR"); square_8 = square("LTR"); square_9 = square("LT");
    
    square_1.refresh(); square_2.refresh(); square_3.refresh();
    square_4.refresh(); square_5.refresh(); square_6.refresh();
    square_7.refresh(); square_8.refresh(); square_9.refresh();

    square_1.setInitialColor(); square_2.setInitialColor(); square_3.setInitialColor();
    square_4.setInitialColor(); square_5.setInitialColor(); square_6.setInitialColor();
    square_7.setInitialColor(); square_8.setInitialColor(); square_9.setInitialColor();

    setState(() {});
  }

  Widget expand = Expanded(child: Text(''),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: _refresh,
          ),
        ],
      ),
      body: 
          Column(
            children: <Widget>[
              expand,
              Transform.rotate(                
                angle: -pi, 
                child: Container(
                  width: 300,
                  height: 50,                  
                  child: Text('$xResult', style: TextStyle(fontSize: 30.0, color: Colors.blue), textAlign: TextAlign.center,),
                  decoration: BoxDecoration(border: Border.all(color: _turn == "X" ? Colors.blue : Colors.transparent, width: 1.0), borderRadius: BorderRadius.circular(20.0)),
                ),
              ),              
              expand,
              Row(children: <Widget>[expand, square_1, square_2, square_3, expand],),
              Row(children: <Widget>[expand, square_4, square_5, square_6, expand],),
              Row(children: <Widget>[expand, square_7, square_8, square_9, expand],),
              expand,              
              Container(
                width: 300,
                height: 50,
                child: Text('$oResult', style: TextStyle(fontSize: 30.0, color: Colors.blue), textAlign: TextAlign.center,),
                decoration: BoxDecoration(border: Border.all(color: _turn == "O" ? Colors.blue : Colors.transparent, width: 1.0), borderRadius: BorderRadius.circular(20.0)),                
              ),              
              expand,
            ],
          ),       
    );          
  }
}

/*

*/ 