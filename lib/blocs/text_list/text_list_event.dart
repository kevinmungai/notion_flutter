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

class CreateNewTextField extends TextListEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => "CreateNewTextField {}";
}