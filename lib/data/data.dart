class Data {
  // nice
  static const String nice = '''
  [
      { "field_name": "f1", "widget": "dropdown", "valid_values": ["A", "B"] },
      { "field_name": "f2", "widget": "textfield", "visible": "f1=='A'" },
      { "field_name": "f3", "widget": "textfield", "visible": "f1=='A'" },
      { "field_name": "f4", "widget": "textfield", "visible": "f1=='A'" },
      { "field_name": "f5", "widget": "textfield", "visible": "f1=='B'" },
      { "field_name": "f6", "widget": "textfield", "visible": "f1=='B'" }
    ]
''';

  // valid values do not match
  static const String valuesNotMatching = '''
  [
      { "field_name": "a1", "widget": "dropdown", "valid_values": ["a", "B"] },
      { "field_name": "a2", "widget": "textfield", "visible": "a1=='a'" },
      { "field_name": "a3", "widget": "textfield", "visible": "a1=='b'" },
      { "field_name": "a4", "widget": "textfield", "visible": "a1=='a'" },
      { "field_name": "a5", "widget": "textfield", "visible": "a1=='b'" },
      { "field_name": "a6", "widget": "textfield", "visible": "a1=='a'" }
    ]
  ''';

  // some fasteners are missing
  static const String jsonError = '''
  [
      { "field_name": "a1", "widget": "dropdown", "valid_values": ["a", "B"] },
      { "field_name": "a2", "widget": "textfield", "visible": "a1=='a'" },
      { "field_name": "a3", "widget": "textfield", "visible": "a1=='b'" },
      { "field_name": "a4", "widget": "textfield", "visible": "a1=='a'" },
      { "field_name": "a5", "widget": "textfield", "visible": "a1=='b'" },
      { "field_name": "a6", "widget": "textfield", "visible": "a1=='a'" }
    ]
  ''';
}