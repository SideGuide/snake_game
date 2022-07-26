import 'package:flutter/material.dart';
import '../model/snake.dart';

showWinDialog(context) {
  Dialog dialog = Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    child: SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Cool',
              style: TextStyle(color: Colors.red),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Awesome',
              style: TextStyle(color: Colors.red),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Got It!',
                style: TextStyle(color: Colors.purple, fontSize: 18.0),
              ))
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

showGameOverDialog(
    context, Snake snake, Function() onRestart, Function() onMenu) {
  Dialog dialog = Dialog(
    backgroundColor: Colors.grey[900]!.withOpacity(.5),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'GAME OVER',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Score: ${snake.score.toString()}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/img/singlecoin.png",
                  width: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  snake.coins.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          _button(context, "Restart", onRestart, Colors.amber),
          _button(context, "Menu", onMenu, Colors.amber)
        ],
      ),
    ),
  );
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => dialog);
}

Widget _button(context, String text, Function() onTap, Color color) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          )),
    ),
  );
}
