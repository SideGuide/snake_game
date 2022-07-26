import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_game/services/route_service.dart';
import 'package:snake_game/services/user_service.dart';

import 'game.dart';
import 'model/user.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RouteService>(
      builder: (context, value, child) {
        if (value.navigateTo == 2) {
          return game(value);
        }
        return menu(value);
      },
    );
  }

  Widget game(RouteService routeService) {
    final userService = Provider.of<UserService>(context, listen: false);
    return FutureBuilder<User>(
      future: userService.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          User user = snapshot.data!; // can't be null
          return Game(user);
        }
        return Container();
      },
    );
  }

  Widget menu(RouteService routeService) {
    final userService = Provider.of<UserService>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<User>(
          future: userService.getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              User user = snapshot.data!;
              return SafeArea(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Highscore: ${user.highScore}",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset("assets/img/logo2.png",
                              width: 500, height: 500)),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _button("START", () => routeService.navigate(2),
                                  Colors.amber, const Icon(Icons.play_arrow)),
                              // _button("STORE", () => routeService.navigate(1),
                              //     Colors.orange, Icon(Icons.store)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }

  Widget _button(String text, Function() onTap, Color color, Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
            ),
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          onPressed: onTap,
          icon: icon,
          label: Text(
            text,
            style: const TextStyle(fontSize: 22),
          )),
    );
  }
}
