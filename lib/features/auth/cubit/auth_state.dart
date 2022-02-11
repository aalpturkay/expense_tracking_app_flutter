part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoaded extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String? message;

  AuthError({this.message});

  @override
  List<Object?> get props => [message];
}
