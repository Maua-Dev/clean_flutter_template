class Failure implements Exception {
  final String message;

  Failure({required this.message});
}

class EntityError extends Failure {
  EntityError({required String message})
      : super(message: 'Field $message is not valid');
}

class EmptyList extends Failure {
  EmptyList()
      : super(message: 'List is empty, no items found for this request');
}

class ErrorRequest extends Failure {
  ErrorRequest({required String message}) : super(message: message);
}

class NoItemsFound extends Failure {
  NoItemsFound({required String message})
      : super(message: 'No items found for $message');
}
