// flutter pub add flutter_bloc
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_example/models/user.dart';

// Wrap our user class in a user state class because in the future we may want to expand
// it with other data (isLoading, errorMessage, etc.)
class UserState {
  UserState(User user) {
    _user = user;
  }

  // again no setter, for immutability purposes
  late final User _user;
  User get user => _user;
}

// Create our cubit that will "emits user states down the stream"
class UserCubit extends Cubit<UserState> {
  // Cubits need 2 things, state, and functions that change the state (and emit the new one)

  // We initialize our Cubit<UserState> with a default starting value
  UserCubit() : super(UserState(User('Ronald', 'McDonald')));

  // public method that emits new User States (replacing the current user)
  void updateUser(User user) {
    // emit is built in to cubit and sends the next state down the stream
    return emit(UserState(user));
  }
}
