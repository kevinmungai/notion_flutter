import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class TextListBloc extends Bloc<TextListEvent, TextListState> {
  @override
  TextListState get initialState => InitialTextListState();

  @override
  Stream<TextListState> mapEventToState(
    TextListEvent event,
  ) async* {
    if (event is AddToTextList) {
      print(event);

      if (state is CurrentTextList) {
        final currentTextList = (state as CurrentTextList).textList;
        yield CurrentTextList(
          textList: [...currentTextList, event.text],
          addNewText: false,
        );
      } else {
        yield CurrentTextList(
          textList: [event.text],
          addNewText: false,
        );
      }
    }

    if (event is CreateNewTextField) {
      print(event);
      if (state is CurrentTextList) {
        final currentTextList = (state as CurrentTextList);
        yield CurrentTextList(
          textList: currentTextList.textList,
          addNewText: true,
        );
      }
    }
  }
}
