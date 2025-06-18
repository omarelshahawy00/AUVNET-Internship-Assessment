// Events
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserData extends UserEvent {
  final String userId;

  const LoadUserData(this.userId);

  @override
  List<Object> get props => [userId];
}


