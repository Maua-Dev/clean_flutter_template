// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt_BR';

  static String m0(placeholders, entityErrorMessage) =>
      "Campo ${entityErrorMessage} não é válido";

  static String m1(placeholders, message) =>
      "Items não encontrados para: ${message}";

  static String m2(placeholders, message) => "${message}";

  static String m3(schema) => "${Intl.select(schema, {
            'APPROVED': 'Aprovado',
            'PENDING': 'Pendente',
            'REJECTED': 'Rejeitado',
            'other': 'Other',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "createPageTitle":
            MessageLookupByLibrary.simpleMessage("Crie um novo usuário"),
        "emptyListErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Lista vazia, itens não encontrados para essa requisição"),
        "entityErrorMessage": m0,
        "fieldInvalidEmail": MessageLookupByLibrary.simpleMessage(
            "O campo deve ser um endereço de e-mail válido"),
        "fieldMinLength": MessageLookupByLibrary.simpleMessage(
            "O campo deve ter pelo menos 6 caracteres"),
        "fieldRequired":
            MessageLookupByLibrary.simpleMessage("Campo é obrigatório"),
        "homePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Explore as funcionalidades do template:"),
        "homePageTitle": MessageLookupByLibrary.simpleMessage(
            "Bem-vindo ao Clean Flutter Template"),
        "noItemsFoundErrorMessage": m1,
        "requestErrorMessage": m2,
        "stateNameSchema": m3
      };
}
