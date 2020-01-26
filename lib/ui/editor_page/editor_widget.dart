import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notion_flutter/blocs/text/bloc.dart';

class EditorWidget extends StatefulWidget {
  @override
  _EditorWidgetState createState() => _EditorWidgetState();
}

class _EditorWidgetState extends State<EditorWidget> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      //textInputAction: TextInputAction.done,
      maxLines: null,
      minLines: null,
      expands: true,
      autofocus: false,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0)
      ),
      style: TextStyle(
        fontSize: 16,
      ),
      onChanged: (String text) {
        //print(text);
        setState(() {
          print("onChanged");
          BlocProvider.of<TextBloc>(context).add(ChangeText(text: text));
          final splitText = text.split("\n");
          if (splitText.length > 1) {
            print("splitText: $splitText");
            BlocProvider.of<TextBloc>(context).add(AddToTextListBlocEnd());
            _textEditingController.text = "";
          }
        });
      },
//      onSubmitted: (String text) {
//
//        setState(() {
//          print("onSubmitted");
//          BlocProvider.of<TextBloc>(context).add(AddToTextListBloc());
//          _textEditingController.text = "";
//        });
//
//      },
    );
  }
}
