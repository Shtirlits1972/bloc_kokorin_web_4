import 'dart:ui';

import 'package:bloc_kokorin_web_4/bloc/user_bloc.dart';
import 'package:bloc_kokorin_web_4/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              'No data received',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        } else if (state is UserLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: (index % 2 == 0)
                  ? Colors.white
                  : Colors.grey.withOpacity(0.3),
              child: ListTile(
                leading: Text(
                  'ID ${state.loadedUser[index].id}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Column(
                  children: <Widget>[
                    Text(
                      '${state.loadedUser[index].name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Email: ${state.loadedUser[index].email}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Phone: ${state.loadedUser[index].phone}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }

        if (state is UserErrorState) {
          return Center(
            child: Text(
              'Error load Users',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
