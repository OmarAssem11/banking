import 'package:flutter/material.dart';

class ProfileSettingsWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const ProfileSettingsWidget({
    required this.icon,
    required this.text,
    required this.onTap,
  });
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
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: const Color.fromARGB(255, 153, 8, 88),
            ),
            const SizedBox(width: 16),
            Text(
              text,
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
}
