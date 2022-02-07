class UserConflictExeption implements Exception {
  final String message;

  UserConflictExeption(this.message);
}

class InternalServerErrorExeption implements Exception {
  final String message;

  InternalServerErrorExeption(this.message);
}

class UnauthorizedExeption implements Exception {
  final String message;

  UnauthorizedExeption(this.message);
}
