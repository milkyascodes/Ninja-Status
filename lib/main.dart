// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/controllers.dart';

void main() {
  runApp(GetMaterialApp(
    home: MyHomePage(),
    title: 'Flutter Demo',
    theme: Themes.light,
    darkTheme: Themes.dark,
  ));
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  Mycontroller controller = Get.put(Mycontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Ninja Status'),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              changeName();
                            },
                            child: Text('Change Name'),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () {
                              if (Get.isDarkMode) {
                                print('light');
                                Get.changeThemeMode(ThemeMode.light);
                              } else {
                                print('dark');
                                Get.changeThemeMode(ThemeMode.dark);
                              }
                            },
                            child: Text('Change Theme'),
                          ),
                        ),
                      )
                    ])
          ],
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 430,
                  width: 320,
                  child: Card(
                    elevation: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/ninja-titulek.png'),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Obx(() => Text(
                                  controller.ninjaName.toString().toUpperCase(),
                                  style: TextStyle(fontSize: 28),
                                ))
                          ],
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(fontSize: 15),
                              ),
                              Obx(
                                () => Text(
                                  '${controller.ninjaStatus}',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              Text(
                                'Level',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Obx(
                                () => Text(
                                  '${controller.ninjaLevel}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: CircleBorder(),
                    elevation: 0,
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.incrementLevel();
                  },
                ),
              ]),
        ));
  }
}

class Themes {
  static final light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    appBarTheme: AppBarTheme(backgroundColor: Colors.teal.shade400),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.teal.shade400)),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.teal.shade400)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.teal.shade400)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
    ),
  );
}
