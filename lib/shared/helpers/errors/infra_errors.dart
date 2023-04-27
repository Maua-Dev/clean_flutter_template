class InfraErrors implements Exception {
  final String message;

  InfraErrors({required this.message});
}

class EmptyList extends InfraErrors {
  EmptyList()
      : super(message: 'List is empty, no items found for this request');
}

class ErrorRequest extends InfraErrors {
  ErrorRequest({required String message}) : super(message: message);
}

class NoItemsFound extends InfraErrors {
  NoItemsFound({required String message})
      : super(message: 'No items found for $message');
}
