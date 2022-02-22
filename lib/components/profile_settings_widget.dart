import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileSettingsWidget extends StatefulWidget {
  final IconData icon;
  final String text;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const ProfileSettingsWidget({
    required this.icon,
    required this.text,
    required this.controller,
    required this.keyboardType,
  });
  @override
  State<ProfileSettingsWidget> createState() => _ProfileSettingsWidgetState();
}

class _ProfileSettingsWidgetState extends State<ProfileSettingsWidget> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(
        right: 22,
        left: 22,
        top: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: InkWell(
        onTap: () => setState(() => isClicked = true),
        child: isClicked
            ? showFormField(
                text: widget.text,
                context: context,
                keyboardType: widget.keyboardType,
                controller: widget.controller,
              )
            : Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 28,
                    color: const Color.fromARGB(255, 153, 8, 88),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Change ${widget.text}',
                    style: theme.textTheme.headline6,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 27,
                    color: Colors.grey,
                  ),
                ],
              ),
      ),
    );
  }

  void onTap({
    required BuildContext context,
    required String text,
    required TextEditingController controller,
    required TextInputType keyboardType,
  }) {
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      context: context,
      builder: (_) => Form(
        key: _formKey,
        child: Container(),
      ),
    );
  }

  Row showFormField({
    required String text,
    required BuildContext context,
    required TextInputType keyboardType,
    required TextEditingController controller,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter new $text',
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.secondary),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            autocorrect: false,
            keyboardType: keyboardType,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "${toBeginningOfSentenceCase(text)} can't be empty";
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 4),
        TextButton(
          onPressed: () {},
          child: const Text(
            'SUBMIT',
            style: TextStyle(
              color: Color.fromARGB(255, 153, 8, 88),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
