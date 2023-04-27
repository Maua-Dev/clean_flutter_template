class UsecaseErrors implements Exception {
  final String message;

  UsecaseErrors({required this.message});
}

class DuplicatedItem extends UsecaseErrors {
  DuplicatedItem({required String message})
      : super(message: 'The item alredy exists for this $message');
}

class ForbiddenAction extends UsecaseErrors {
  ForbiddenAction({required String message})
      : super(message: 'That action is forbidden for this $message');
}
