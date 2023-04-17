class Error implements Exception {
  final String message;

  Error({required this.message});
}

class NoItemsFound extends Error {
  NoItemsFound({required String message})
      : super(message: 'No items found for $message');
}

class DuplicatedItem extends Error {
  DuplicatedItem({required String message})
      : super(message: 'The item alredy exists for this $message');
}

class ForbiddenAction extends Error {
  ForbiddenAction({required String message})
      : super(message: 'That action is forbidden for this $message');
}
