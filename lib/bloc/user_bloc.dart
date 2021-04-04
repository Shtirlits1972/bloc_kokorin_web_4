import 'package:bloc_kokorin_web_4/bloc/user_event.dart';
import 'package:bloc_kokorin_web_4/bloc/user_state.dart';
import 'package:bloc_kokorin_web_4/models/user.dart';
import 'package:bloc_kokorin_web_4/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersReposytory usersRepository;
  UserBloc({this.usersRepository}) : assert(usersRepository != null);
  @override
  // TODO: implement initialState
  get initialState => UserEmptyState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<User> _loadeUserList = await usersRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadeUserList);
      } catch (_) {
        yield UserErrorState();
      }
    }else if(event is UserClearEvent){
      yield UserEmptyState();
    }
  }
}
