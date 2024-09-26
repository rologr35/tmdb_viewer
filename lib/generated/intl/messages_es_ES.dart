// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es_ES locale. All the
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
  String get localeName => 'es_ES';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("TMDB Viewer"),
        "badRequest":
            MessageLookupByLibrary.simpleMessage("Solicitud inválida"),
        "conflicts": MessageLookupByLibrary.simpleMessage("Conflicto"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favoritas"),
        "forbidden": MessageLookupByLibrary.simpleMessage("Denegado"),
        "internalServerError":
            MessageLookupByLibrary.simpleMessage("Error interno de servidor"),
        "movies": MessageLookupByLibrary.simpleMessage("Películas"),
        "noInternetConnection": MessageLookupByLibrary.simpleMessage(
            "No existe conexión a internet"),
        "notFound": MessageLookupByLibrary.simpleMessage("No encontrado"),
        "popular": MessageLookupByLibrary.simpleMessage("Populares"),
        "someErrorOccurs":
            MessageLookupByLibrary.simpleMessage("Ocurrió un error"),
        "unauthorized": MessageLookupByLibrary.simpleMessage("No autorizado")
      };
}
