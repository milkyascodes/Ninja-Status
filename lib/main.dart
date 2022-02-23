// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/controllers.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  Mycontroller controller = Get.put(Mycontroller());

  changeName() {
    Get.defaultDialog(
        title: 'New Ninja Name',
        titlePadding: EdgeInsets.fromLTRB(0, 30, 0, 5),
        content: SizedBox(
          width: 230,
          child: TextField(
            maxLength: 10,
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              border: UnderlineInputBorder(),
              hintText: 'ninja name',
              contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
            ),
          ),
        ),
        barrierDismissible: false,
        cancel: TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
        confirm: ElevatedButton(
          onPressed: () {
            //prefix iocn
          },
          child: Text('Update'),
        ));
  }

  @override
  Widget build(BuildContext context) {
    print(controller.ninjaLevel);
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Ninja Status'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {
                  changeName();
                },
                child: Text('Change Name'),
              ),
            )
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
                              controller.ninjaName.toString(),
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
                              Obx(
                                () => Text(
                                  '${controller.ninjaStatus}',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 25),
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
                                      color: Colors.orange, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
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
