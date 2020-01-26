import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:notion_flutter/data_types/GeneralTextData.dart';
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
        final generalTextData = (state as CurrentTextList).generalTextData;
        yield CurrentTextList(
          generalTextData: GeneralTextData.addTextSimpleEnd(
              text: event.text,
              generalTextData: generalTextData,
          ),
        );
      } else {
        yield CurrentTextList(
          generalTextData: GeneralTextData.addTextSimpleEnd(
            text: event.text,
            generalTextData: GeneralTextData.entirelyNew(),
          ),
        );
      }
    }


  if (event is AddToTextListMiddle) {
    print(event);
    if (state is CurrentTextList) {
      final generalTextData = (state as CurrentTextList).generalTextData;
      final newState = CurrentTextList(
          generalTextData: GeneralTextData.addTextByID(
              index: event.index,
              text: event.text,
              generalTextData: generalTextData,
          ),
      );
      yield newState;
      print(newState);
    }

  }
  }
}
