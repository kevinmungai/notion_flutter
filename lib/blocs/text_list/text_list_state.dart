import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:notion_flutter/data_types/GeneralTextData.dart';
import 'package:notion_flutter/data_types/text_data.dart';

abstract class TextListState extends Equatable {
  const TextListState();
}

class InitialTextListState extends TextListState {
  @override
  List<Object> get props => [];
}

class CurrentTextList extends TextListState {
  final GeneralTextData generalTextData;
//  final List<TextData> textListData;
//  final bool addNewText;

  CurrentTextList({@required this.generalTextData});

  @override
  List<Object> get props => [generalTextData];

  @override
  String toString() => "CurrentTextList { generalTextData: $generalTextData }";
}

