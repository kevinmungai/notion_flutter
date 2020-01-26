import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TextListEvent extends Equatable {
  const TextListEvent();
}

class AddToTextList extends TextListEvent {
  final String text;

  AddToTextList({@required this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => "AddToTextList { text: $text }";
}

class AddToTextListMiddle extends TextListEvent {
  final int index;
  final String text;

  AddToTextListMiddle({@required this.index, @required this.text});

  @override
  List<Object> get props => [index, text];

  @override
  String toString() => "AddToTextListMiddle { index: $index, text: $text }";
}