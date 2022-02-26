import 'package:banking/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileSettingsWidget extends StatefulWidget {
  late final String text;
  late final IconData icon;
  late final TextInputType keyboardType;
  late final TextEditingController controller;
  late final VoidCallback onPressed;
  ProfileSettingsWidget.editName(BuildContext context) {
    text = 'name';
    icon = Icons.account_circle_outlined;
    keyboardType = TextInputType.name;
    controller = TextEditingController();
    onPressed = () => Provider.of<UserProvider>(
          context,
          listen: false,
        ).changeName(controller.text);
  }
  ProfileSettingsWidget.editEmail(BuildContext context) {
    text = 'email address';
    icon = Icons.email_outlined;
    keyboardType = TextInputType.emailAddress;
    controller = TextEditingController();
    onPressed = () => Provider.of<UserProvider>(
          context,
          listen: false,
        ).changeEmail(controller.text);
  }
  ProfileSettingsWidget.editPassword(BuildContext context) {
    text = 'password';
    icon = Icons.lock_outline;
    keyboardType = TextInputType.visiblePassword;
    controller = TextEditingController();
    onPressed = () => Provider.of<UserProvider>(
          context,
          listen: false,
        ).changePassword(controller.text);
  }
  ProfileSettingsWidget.editPhone(BuildContext context) {
    text = 'phone number';
    icon = Icons.phone_outlined;
    keyboardType = TextInputType.phone;
    controller = TextEditingController();
    onPressed = () => Provider.of<UserProvider>(
          context,
          listen: false,
        ).changePhone(controller.text);
  }
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
                context: context,
                text: widget.text,
                keyboardType: widget.keyboardType,
                controller: widget.controller,
                onPressed: widget.onPressed,
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

  Row showFormField({
    required BuildContext context,
    required String text,
    required TextInputType keyboardType,
    required TextEditingController controller,
    required VoidCallback onPressed,
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
          onPressed: () {
            if (controller.text.isEmpty) {
              final snackBar = SnackBar(
                backgroundColor: const Color.fromARGB(255, 192, 0, 0),
                content: Row(
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    Text("${toBeginningOfSentenceCase(text)} can't be empty"),
                  ],
                ),
                duration: const Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              final snackBar = SnackBar(
                backgroundColor: const Color.fromARGB(255, 2, 117, 5),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${toBeginningOfSentenceCase(text)} changed successfully",
                    ),
                    const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 26,
                    ),
                  ],
                ),
                duration: const Duration(seconds: 2),
              );
              onPressed();
              setState(() => isClicked = false);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
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
