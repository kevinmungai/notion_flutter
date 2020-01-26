import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TextData extends Equatable {
  final String text;
  final int index;

  TextData({
    @required this.text,
    @required this.index,
  });

  @override
  List<Object> get props => [text, index, ];

  TextData copyWith({
    String text,
    int index,
  }) {
    return TextData(
      text: text ?? this.text,
      index: index ?? this.index,
    );
  }
}
