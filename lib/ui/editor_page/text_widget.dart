import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String text;

  TextWidget({@required this.text});

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.text);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      //expands: true,
      controller: _textEditingController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        border: InputBorder.none,
      ),
      style: TextStyle(
        //fontSize: 30,
      ),
    );
  }
}
