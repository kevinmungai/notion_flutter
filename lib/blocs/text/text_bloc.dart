import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:notion_flutter/blocs/text_list/bloc.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  final TextListBloc textListBloc;

  TextBloc({@required this.textListBloc});

  @override
  TextState get initialState => InitialTextState();

  @override
  Stream<TextState> mapEventToState(
    TextEvent event,
  ) async* {
    if (event is ChangeText) {
      //print(event);
      final newState = CurrentText(text: event.text);
      yield newState;
      print(newState);
    }

    if (event is ClearText) {
      print(event);
      final newState = CurrentTextCleared();
      yield newState;
      print(newState);
    }

    if (event is AddToTextListBlocEnd) {
      print(event);
      if (state is CurrentText) {
        final currentText = (state as CurrentText).text;
        textListBloc.add(AddToTextList(text: currentText));
        add(ClearText());
      }

    }

    if (event is AddToTextListBlocMiddle) {
      print(event);
      if (state is CurrentText) {

      }
    }
  }
}
