import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notion_flutter/blocs/text/bloc.dart';

class EditorWidget extends StatefulWidget {
  @override
  _EditorWidgetState createState() => _EditorWidgetState();
}

class _EditorWidgetState extends State<EditorWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      //minLines: null,
      //expands: true,
      autofocus: false,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0)
      ),
      onChanged: (String text) {
        //print(text);
        BlocProvider.of<TextBloc>(context).add(ChangeText(text: text));
      },
      onSubmitted: (String text) {
        print("submitted");
        BlocProvider.of<TextBloc>(context).add(AddToTextListBloc());
      },
      onEditingComplete: () {
        print("submitted");
        BlocProvider.of<TextBloc>(context).add(AddToTextListBloc());
      },

    );
  }
}
