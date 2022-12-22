import 'package:eventscheduler/main.dart';
import 'package:eventscheduler/nextScreen.dart';
import 'package:flutter/material.dart';

class nextScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _nextScreen();
}

class _nextScreen extends State<nextScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[100],
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Create Event"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            Card(
              color: Colors.deepPurple,
              margin: EdgeInsets.only(top: 250, bottom: 20, left: 25, right: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
              ),
              child: ListTile(
                iconColor: Colors.white,
                contentPadding: EdgeInsets.only(top: 15, bottom: 8, left: 10, right: 10),
                leading: Icon(Icons.calendar_month_sharp),
                title: TextField(
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Event",
                    contentPadding: EdgeInsets.only(top: 12, bottom: 20, left: 10, right: 10),
                    hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    )
                  ),
                  textAlign: TextAlign.left,
                  controller: _textEditingController,
                ),
              ),
            ),

            Builder(
              builder: (context) {
                return ElevatedButton(
                    onPressed: (){
                      String newEventText = _textEditingController.text;
                      Navigator.of(context).pop(newEventText);
                    },
                    child: Text("Add"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300.0, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      primary: Colors.purple[100],
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      )
                    ),
                );
              }
            )
          ],
        ),
      );
  }
}