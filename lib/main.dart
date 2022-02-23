// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorSchemeSeed: Colors.purple, brightness: Brightness.dark),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ninja Status'),
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
                      SizedBox(),
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
                          Text(
                            'Titulek',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              'Chunin',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 25),
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
                            Text(
                              '🔥 🔥',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},

                icon: Icon(Icons.add),
                // color: Colors.red,
              )
            ],
          ),
        ));
  }
}
