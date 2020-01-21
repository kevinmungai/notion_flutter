import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notion_flutter/blocs/text/bloc.dart';
import 'package:notion_flutter/blocs/text_list/bloc.dart';
import 'package:notion_flutter/ui/editor_bottom/editor_controls.dart';
import 'package:notion_flutter/ui/editor_page/editor_widget.dart';
import 'package:notion_flutter/ui/editor_page/text_widget.dart';

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
                    SliverToBoxAdapter(
                      child: Text("ddjfkfjjsjs s", style: TextStyle(fontSize: 16),),
                    ),
                    BlocBuilder<TextListBloc, TextListState>(
                      builder: (context, state) {
                        if (state is CurrentTextList) {
                          print("if");
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return TextWidget(text: state.textList.elementAt(index));
                                },
                              childCount: state.textList.length,
                            ),
                          );
                        } else {
                          print("else");
                          return SliverToBoxAdapter(child: Container());
                        }
                      },
                    ),
                    SliverFillRemaining(
                      child: EditorWidget(),
                    ),
                  ],
                ),
              ),
            ),
            EditorControls(),
          ],
        ),
      ),
    );
  }
}
