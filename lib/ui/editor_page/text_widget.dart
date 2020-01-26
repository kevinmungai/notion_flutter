import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notion_flutter/blocs/text_list/bloc.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final int index;

  TextWidget({@required this.text, @required this.index});

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
      textInputAction: TextInputAction.newline,
      maxLines: null,
      //expands: true,
      controller: _textEditingController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        border: InputBorder.none,
      ),
      style: TextStyle(
        fontSize: 16,
      ),
      onChanged: (String text) {
        final splittedString = text.split("\n");
        print("onChanged: ${text}");
        if (splittedString.length > 1) {
          print("one: ${splittedString[0]}");
          print("two: ${splittedString[1]}");
          BlocProvider.of<TextListBloc>(context).add(
              AddToTextListMiddle(index: widget.index, text: splittedString[1]));
          _textEditingController.text = splittedString[0];
        }

      },
//      onSubmitted: (String text) {
//        final splittedString = text.split("\n");
//        print("onsubmitted: ${text.split("\n")}");
//        print("one: ${splittedString[0]}");
//        print("two: ${splittedString[1]}");
//      },
    );
  }
}
