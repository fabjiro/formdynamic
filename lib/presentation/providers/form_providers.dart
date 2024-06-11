import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formdynamictest/domain/models/form_field_model.dart';

final  formFieldsProvider = StateProvider<List<FormFieldModel>>((ref) => []);
final formValuesProvider = StateProvider<Map<String, String>>((ref) => {});