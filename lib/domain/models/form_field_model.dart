class FormFieldModel {

  FormFieldModel({
    required this.fieldName,
    required this.widget,
    this.validValues,
    this.visible,
  });

  factory FormFieldModel.fromJson(Map<String, dynamic> json) => FormFieldModel(
    fieldName: json['field_name'],
    widget: json['widget'],
    validValues: json['valid_values'] == null ? null : List<String>.from(json['valid_values'].map((x) => x)),
    visible: json['visible'],
  );

  String fieldName;
  String widget;
  List<String>? validValues;
  String? visible;

  Map<String, dynamic> toJson() => {
    'field_name': fieldName,
    'widget': widget,
    'valid_values': validValues == null ? null : List<dynamic>.from(validValues!.map((x) => x)),
    'visible': visible,
  };
}
