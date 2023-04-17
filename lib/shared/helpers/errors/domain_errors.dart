class DomainErrors implements Exception {
  final String message;

  DomainErrors({required this.message});
}

class EntityError extends DomainErrors {
  EntityError({required String message})
      : super(message: 'Field $message is not valid');
}
