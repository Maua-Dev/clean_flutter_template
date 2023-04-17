class Error implements Exception {
  final String message;

  Error({required this.message});
}

class NoItemsFound extends Error {
  NoItemsFound({required super.message});
}

class DuplicatedItem extends Error {
  DuplicatedItem({required super.message});
}

class ForbiddenAction extends Error {
  ForbiddenAction({required super.message});
}
