import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../models/feud.dart';
import '../models/foe.dart';

class FeudForm extends StatefulWidget {
  final void Function(Feud) onSubmit;

  const FeudForm({super.key, required this.onSubmit});

  @override
  State<FeudForm> createState() => _FeudFormState();
}

class _FeudFormState extends State<FeudForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  // Ids of foe form fields
  final List<int> _foeFields = [0, 1];

  void _addFoeField() {
    setState(() {
      _foeFields.add(_foeFields.length);
    });
  }

  void _removeFoeField(int index) {
    setState(() {
      if (_foeFields.length > 1) {
        _foeFields.removeAt(index);
      }
    });
  }

  void _submit() {
    var formState = _formKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      var name = formState.fields["name"]!.value as String;
      var foes = <Foe>[];
      for (int i = 0; i < _foeFields.length; i++) {
        final value = formState.fields['foe_$i']?.value?.toString().trim();
        if (value != null && value.isNotEmpty) {
          foes.add(Foe(name: value));
        }
      }
      var feud = Feud(name: name, foes: foes);
      widget.onSubmit(feud);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormBuilderTextField(
              name: 'name',
              decoration: const InputDecoration(
                hintText: 'Name your feud',
                border: OutlineInputBorder(),
              ),
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: FormBuilderValidators.required(),
            ),
            const SizedBox(height: 16),
            ..._buildFoeFields(),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Foe'),
                onPressed: _addFoeField,
              ),
            ),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Start the feud"),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFoeFields() {
    List<Widget> fields = [];
    for (int i = 0; i < _foeFields.length; i++) {
      fields.add(
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'foe_$i',
                decoration: const InputDecoration(
                  hintText: 'Foe name',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed:
                  _foeFields.length > 2 ? () => _removeFoeField(i) : null,
              color: _foeFields.length > 2 ? Colors.red : Colors.grey,
              tooltip: _foeFields.length > 2
                  ? 'Remove this foe'
                  : 'At least two foes are required',
            ),
          ],
        ),
      );
      // Add spacing between rows
      if (i < _foeFields.length - 1) {
        fields.add(const SizedBox(height: 12));
      }
    }
    return fields;
  }
}
