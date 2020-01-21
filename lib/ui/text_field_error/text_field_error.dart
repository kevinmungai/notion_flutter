import 'package:flutter/material.dart';

class TextFieldError extends StatefulWidget {
  @override
  _TextFieldErrorState createState() => _TextFieldErrorState();
}

class _TextFieldErrorState extends State<TextFieldError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField Error"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
//          maxLines: null,
//          minLines: null,
//          expands: true,
          onChanged: (text) {
            setState(() {
              print(text);
            });
          },
          onEditingComplete: () {
            setState(() {
              print("onEditingComplete");
            });
          },
          onSubmitted: (String text) {
            setState(() {
              debugPrint("onSubmitted: $text");
            });
          },
        ),
      ),
    );
  }
}
