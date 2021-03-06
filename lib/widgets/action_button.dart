import 'package:bloc_kokorin_web_4/bloc/user_bloc.dart';
import 'package:bloc_kokorin_web_4/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // ignore: deprecated_member_use
        RaisedButton(
          color: Colors.green,
          child: Text('Load'),
          onPressed: () {
            userBloc.add(UserLoadEvent());
          },
        ),
        SizedBox(
          width: 8,
        ),
        // ignore: deprecated_member_use
        RaisedButton(
          color: Colors.red,
          child: Text('Clear'),
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
        ),
      ],
    );
  }
}
