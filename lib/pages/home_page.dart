import 'package:bloc_kokorin_web_4/bloc/user_bloc.dart';
import 'package:bloc_kokorin_web_4/services/user_repository.dart';
import 'package:bloc_kokorin_web_4/widgets/action_button.dart';
import 'package:bloc_kokorin_web_4/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  //const MyHomePage({Key key}) : super(key: key);
  final UsersReposytory usersReposytory = UsersReposytory();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository: usersReposytory),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(
              child: UserList(),
            ),
          ],
        ),
      ),
    );
  }
}
