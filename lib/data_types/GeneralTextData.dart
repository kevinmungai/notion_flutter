import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:notion_flutter/data_types/text_data.dart';

class GeneralTextData extends Equatable {
  final List<String> textList;
  final int dateLastEdited;

  GeneralTextData({@required this.textList, @required this.dateLastEdited});

  @override
  List<Object> get props => [textList, dateLastEdited];

  GeneralTextData copyWith({
    List<String> textList,
    int dateLastEdited,
  }) {
    return GeneralTextData(
      textList: textList ?? this.textList,
      dateLastEdited: dateLastEdited ?? this.dateLastEdited,
    );
  }

  factory GeneralTextData.addTextSimpleEnd({
    @required String text,
    @required GeneralTextData generalTextData,
  }) {
    return generalTextData.copyWith(
      textList: [...generalTextData.textList, text],
      dateLastEdited: DateTime.now().millisecondsSinceEpoch,
    );
  }

  factory GeneralTextData.entirelyNew() {
    return GeneralTextData(
      textList: [],
      dateLastEdited: DateTime.now().millisecondsSinceEpoch,
    );
  }

  factory GeneralTextData.addTextByID ({
    @required int index,
    @required String text,
    @required GeneralTextData generalTextData,
  }) {
    //final lastItem = text.split("\n").last;
    //print("lastItem: $lastItem");
    if (generalTextData.textList.length - 1 == index) {
      return GeneralTextData.addTextSimpleEnd(text: text, generalTextData: generalTextData);
    } else {
      var tempList = generalTextData.textList;
      tempList.insert(index + 1, text);
      return GeneralTextData(
        textList: tempList,
        dateLastEdited: DateTime.now().millisecondsSinceEpoch,
      );
    }
  }

  @override
  String toString() =>
      "GeneralTextData { dateLastEdited: $dateLastEdited, textList: ${textList.map((text) => "$text")}";
}
