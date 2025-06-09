class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpFauiler extends AuthState {
  final String errorMessage;

  SignUpFauiler({required this.errorMessage});
}

final class CheckBoxStateUpdate extends AuthState {}

final class ObscureTextUpdateState extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInFauiler extends AuthState {
  final String errorMessage;

  SignInFauiler({required this.errorMessage});
}

final class PasswordResetEmailSuccess extends AuthState {}

final class PasswordResetEmailLoading extends AuthState {}

final class PasswordResetEmailFauiler extends AuthState {
  final String errorMessage;

  PasswordResetEmailFauiler({required this.errorMessage});
}
