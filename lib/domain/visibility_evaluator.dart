// ignore_for_file: avoid_classes_with_only_static_members

class VisibilityEvaluator {
  static bool evaluate(String condition, Map<String, String> formValues) {
    final parts = condition.split('==');
    final field = parts[0].trim();
    final value = parts[1].replaceAll("'", '').trim();
    return formValues[field] == value;
  }
}
