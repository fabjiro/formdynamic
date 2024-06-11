import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formdynamictest/domain/visibility_evaluator.dart';
import 'package:formdynamictest/presentation/providers/form_providers.dart';

class DynamicFormWidget extends ConsumerWidget {
  const DynamicFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formFields = ref.watch(formFieldsProvider);
    final formValues = ref.watch(formValuesProvider);

    return Column(
      children: formFields.map((field) {
        final isVisible = field.visible == null || VisibilityEvaluator.evaluate(field.visible!, formValues);
        
        if (!isVisible) {
          return const SizedBox();
        }

        switch (field.widget) {
          case 'dropdown':
            return DropdownButtonFormField<String>(
              value: formValues[field.fieldName],
              items: field.validValues!.map((value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
              onChanged: (value) {
                if (value != null) {
                  ref.read(formValuesProvider.notifier).update((state) {
                    return {...state, field.fieldName: value};
                  });
                }
              },
            );
          case 'textfield':
            return TextFormField(
              initialValue: formValues[field.fieldName],
              onChanged: (value) {
                ref.read(formValuesProvider.notifier).update((state) {
                  return {...state, field.fieldName: value};
                });
              },
            );
          default:
            return Container();
        }
      }).toList(),
    );
  }
}
