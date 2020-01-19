import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TextState extends Equatable {
  const TextState();
}

class InitialTextState extends TextState {
  @override
  List<Object> get props => [];
}

class CurrentText extends TextState {
  final String text;

  CurrentText({@required this.text});

  @override
  List<Object> get props => [text];
  @override
  String toString() => "CurrentText { text: $text }";
}

class CurrentTextCleared extends TextState {
  @override
  List<Object> get props => [];
}