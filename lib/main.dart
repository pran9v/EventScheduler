import 'package:eventscheduler/main.dart';
import 'package:eventscheduler/nextScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final List<Widget> _list = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Event Scheduler"),
          backgroundColor: Colors.deepPurple,
        ),
        backgroundColor: Colors.deepPurpleAccent[100],
        body: Center(
            child: ListView.builder(
                itemCount: _list.length,
                //itemBuilder: ((context, index) => _list[index])
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom:20,left: 12,right: 12, top: 20),
                    padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    alignment: const Alignment(0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[300],
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        )),
                      child: _list[index]
                  );
                }),
            ),
        ),

        floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                onPressed: () async {
                  String newText = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen()))
                  as String;
                  setState(() {
                    _list.add(
                        Text(newText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              height: 1.3,
                              overflow: TextOverflow.clip,
                            )
                        )
                    );
                  });
                },
                child: Icon(
                  Icons.add,
                ),
              );
            }
        ),
      ),
    );
  }
}


