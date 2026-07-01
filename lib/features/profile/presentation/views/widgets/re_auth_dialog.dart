import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class ReAuthDialog extends StatefulWidget {
  const ReAuthDialog({super.key});

  @override
  State<ReAuthDialog> createState() => _ReAuthDialogState();
}

class _ReAuthDialogState extends State<ReAuthDialog> {
  String? password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  if (value != null) password = value;
                },
                hintText: 'يرجى إدخال كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('إلغاء'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.save();
                      Navigator.pop(context, password);
                    },
                    child: const Text('تأكيد'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
