import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formdynamictest/data/data.dart';
import 'package:formdynamictest/domain/models/form_field_model.dart';
import 'package:formdynamictest/presentation/providers/form_providers.dart';
import 'package:formdynamictest/presentation/widgets/dynamic_form_widget.dart';

class FormPage extends ConsumerStatefulWidget {
  const FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends ConsumerState<FormPage> {
  @override
  void initState() {
    super.initState();
    // Load the form fields here
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadFormFields();
    });
  }

  void _loadFormFields() {
    try {
      // change this
      const jsonData = Data.jsonError;

      final formFields = (json.decode(jsonData) as List<dynamic>)
          .map((item) => FormFieldModel.fromJson(item as Map<String, dynamic>))
          .toList();

      ref.read(formFieldsProvider.notifier).state = formFields;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('ups some problem load you json'),
        duration: Duration(seconds: 5),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final formFields = ref.watch(formFieldsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Generador Dinámico de Formularios')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: formFields.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : const DynamicFormWidget(),
      ),
    );
  }
}
