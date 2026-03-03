import 'package:flutter/material.dart';
import '../models/user.dart';

class UserNotifier extends InheritedNotifier<User> {
  // We tell the inherited notifier super class, that it should user the provided user
  // as the change notifier it "inherits"
  const UserNotifier({super.key, required super.child, required User user})
    : super(notifier: user);

  // Finds the most recent User Notifier class in the tree
  static UserNotifier? maybeOf(BuildContext context) {
    // Searches through the build context (widget tree) for the most recent UserNotifier
    return context.dependOnInheritedWidgetOfExactType<UserNotifier>();
  }

  // Provides access to the User app state from anywhere in the tree
  static User of(BuildContext context) {
    // First check if the user notifier is actually in the tree
    final result = maybeOf(context);

    // If not throw an error
    if (result == null || result.notifier == null) {
      throw StateError('No UserNotifier Found in the Tree');
    }

    // If yes return the User (State) of the user notifier
    return result.notifier!;
  }
}
