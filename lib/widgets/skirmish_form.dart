import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../models/skirmish.dart';
import '../models/foe.dart';

class SkirmishForm extends StatelessWidget {
  final List<Foe> foes;
  final void Function(Skirmish) onSubmit;
  final _formKey = GlobalKey<FormBuilderState>();

  SkirmishForm({
    super.key,
    required this.foes,
    required this.onSubmit,
  });

  void _submit() {
    final formState = _formKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      final values = formState.value;
      final date = values['date'] as DateTime;
      final Map<Foe, int> results = {};

      for (var foe in foes) {
        final score = int.tryParse(values['foe_${foe.name}'].toString()) ?? 0;
        results[foe] = score;
      }

      onSubmit(
        Skirmish(results: results, date: date),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Skirmish',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              FormBuilderDateTimePicker(
                name: 'date',
                initialValue: DateTime.now(),
                inputType: InputType.date,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                decoration: const InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              ...foes.map((foe) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: FormBuilderTextField(
                      name: 'foe_${foe.name}',
                      decoration: InputDecoration(
                        labelText: 'Score for ${foe.name}',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                    ),
                  )),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Add Skirmish'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
