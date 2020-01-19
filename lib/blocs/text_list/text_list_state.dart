import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TextListState extends Equatable {
  const TextListState();
}

class InitialTextListState extends TextListState {
  @override
  List<Object> get props => [];
}

class CurrentTextList extends TextListState {
  final List<String> textList;

  CurrentTextList({@required this.textList});

  @override
  List<Object> get props => [textList];

  @override
  String toString() => "CurrentTextList { textList: ${textList.map((text) => "$text")} }";
}