import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notion_flutter/blocs/text/bloc.dart';
import 'package:notion_flutter/blocs/text_list/bloc.dart';
import 'package:notion_flutter/ui/editor_bottom/editor_bottom.dart';

class EditorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CustomScrollView(
                  slivers: <Widget>[
                    BlocBuilder<TextListBloc, TextListState>(
                      builder: (context, state) {
                        if (state is CurrentTextList) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return TextField(
                                    controller: TextEditingController(text: state.textList.elementAt(index)),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                },
                              childCount: state.textList.length,
                            ),
                          );
                        } else {
                          return SliverToBoxAdapter(child: Container());
                        }
                      },
                    ),
                    SliverFillRemaining(
                      child: TextField(
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        autofocus: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(0)
                        ),
                        onChanged: (String text) {
                          //print(text);
                          BlocProvider.of<TextBloc>(context).add(ChangeText(text: text));
                        },
                        onSubmitted: (String text) {
                          print("submitted");
                          BlocProvider.of<TextBloc>(context).add(AddToTextListBloc());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            EditorBottom(),
          ],
        ),
      ),
    );
  }
}
