import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];

  int filledBox = 0;
  bool hasResult = false;
  int scoreX = 0;
  int scoreO = 0;
  String winnerTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('TicTacToe'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.grey[900],
          actions: [
            IconButton(
                onPressed: () {
                  resetGame();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                getScoreBoard(),
                SizedBox(
                  height: 5,
                ),
                getResultButten(),
                SizedBox(
                  height: 20,
                ),
                getGridView(),
                getTurn()
              ],
            ),
          ),
        ));
  }

  Widget getResultButten() {
    return Visibility(
      visible: hasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          // ignore: deprecated_member_use
          primary: Colors.white,
          side: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        onPressed: () {
          setState(() {
            hasResult = false;
            resetGame();
          });
        },
        child: Text(
          winnerTitle + ', Play again!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'Turn X',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Tapped(index);
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  xOrOList[index],
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: xOrOList[index] == 'X' ? Colors.white : Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void Tapped(int index) {
    setState(
      () {
        if (xOrOList[index] != '' || hasResult) {
          return;
        }
        if (isTurnO) {
          xOrOList[index] = 'O';
          filledBox++;
        } else {
          xOrOList[index] = 'X';
          filledBox++;
        }
        isTurnO = !isTurnO;

        checkWinner();
      },
    );
  }

  void checkWinner() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'winner is ' + xOrOList[0]);
      return;
    }
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      setResult(xOrOList[3], 'winner is ' + xOrOList[3]);
      return;
    }
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      setResult(xOrOList[6], 'winner is ' + xOrOList[6]);
      return;
    }

    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[6] != '') {
      setResult(xOrOList[0], 'winner is ' + xOrOList[0]);
      return;
    }
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      setResult(xOrOList[1], 'winner is ' + xOrOList[1]);
      return;
    }
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'winner is ' + xOrOList[2]);
      return;
    }

    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'winner is ' + xOrOList[0]);
      return;
    }
    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'winner is ' + xOrOList[2]);
      return;
    }
    if (filledBox == 9) {
      print('game is equal');
      setResult('', 'Drow');
    }
  }

  Widget getScoreBoard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Player O',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '$scoreO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Player X',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '$scoreX',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void setResult(String winner, String title) {
    setState(() {
      hasResult = true;
      winnerTitle = title;

      if (winner == 'X') {
        scoreX++;
      } else if (winner == 'O') {
        scoreO++;
      } else {
        scoreX++;
        scoreO++;
      }
    });
  }

  void resetGame() {
    setState(() {
      for (int i = 0; i < xOrOList.length; i++) {
        xOrOList[i] = '';
      }
      filledBox = 0;
      hasResult = false;
    });
  }
}
