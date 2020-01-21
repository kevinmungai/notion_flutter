import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notion_flutter/blocs/text/text_bloc.dart';
import 'package:notion_flutter/blocs/text_list/bloc.dart';
import 'package:notion_flutter/ui/editor_page/editor_page.dart';
import 'package:notion_flutter/ui/text_field_error/text_field_error.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TextListBloc>(
          create: (context) => TextListBloc(),
        ),
        BlocProvider<TextBloc>(
          create: (context) => TextBloc(
            textListBloc: BlocProvider.of<TextListBloc>(context),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/editor-page",
      routes: {
        "/editor-page": (context) => EditorPage(),
        "/text-field-error": (context) => TextFieldError(),
      },
    );
  }
}
