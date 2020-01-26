import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TextEvent extends Equatable {
  const TextEvent();
}

class ChangeText extends TextEvent {
  final String text;

  ChangeText({@required this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => "ChangeText { text: $text }";
}

class ClearText extends TextEvent {
  @override
  List<Object> get props => [];
}

class AddToTextListBlocEnd extends TextEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => "AddToTextListBloc {}";
}

class AddToTextListBlocMiddle extends TextEvent {
  final int index;

  AddToTextListBlocMiddle({@required this.index});

  @override
  List<Object> get props => [index];
}