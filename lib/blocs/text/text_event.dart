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

class AddToTextListBloc extends TextEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => "AddToTextListBloc {}";
}