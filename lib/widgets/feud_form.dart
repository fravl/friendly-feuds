import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../models/feud.dart';

class FeudForm extends StatelessWidget {
  final void Function(Feud) onSubmit;
  final _formKey = GlobalKey<FormBuilderState>();

  FeudForm({super.key, required this.onSubmit});

  _submit() {
    var formState = _formKey.currentState;
    if (formState != null) {
      var feud = Feud(name: formState.fields["name"]!.value);
      onSubmit(feud);
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
                      validator: FormBuilderValidators.required()),
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: _submit,
                            child: const Text("Start the feud")))
                  ])
                ])));
  }
}
