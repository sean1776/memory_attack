

typedef void GameOver(String winner);

class Board {

  Board({this.gameOver});
  final GameOver gameOver;

  int countDown = 9;
  String square_1;
  String square_2;
  String square_3;
  String square_4;
  String square_5;
  String square_6;
  String square_7;
  String square_8;
  String square_9;

  void setWinner(int id, String winner) {
    if (id == 0) return;
    if (id == 1) square_1 = winner;
    if (id == 2) square_2 = winner;
    if (id == 3) square_3 = winner;
    if (id == 4) square_4 = winner;
    if (id == 5) square_5 = winner;
    if (id == 6) square_6 = winner;
    if (id == 7) square_7 = winner;
    if (id == 8) square_8 = winner;
    if (id == 9) square_9 = winner;

    countDown -= 1;

    if (checkWinner("O")) {
      print('winner is O');
      gameOver("O");
      return;
    }
    if (checkWinner("X")) {
      print('winner is X');
      gameOver("X");
      return;
    }

    if (countDown == 0) {
      gameOver("Tie");
      print('tie');
      return;
    };
    
  }

  bool checkWinner(String winner) {
    if (square_1 == winner && square_2 == winner && square_3 == winner) return true;
    if (square_4 == winner && square_5 == winner && square_6 == winner) return true;
    if (square_7 == winner && square_8 == winner && square_9 == winner) return true;

    if (square_1 == winner && square_4 == winner && square_7 == winner) return true;
    if (square_2 == winner && square_5 == winner && square_8 == winner) return true;
    if (square_3 == winner && square_6 == winner && square_9 == winner) return true;
    
    if (square_1 == winner && square_5 == winner && square_9 == winner) return true;
    if (square_7 == winner && square_5 == winner && square_3 == winner) return true;

    return false;
  }
}