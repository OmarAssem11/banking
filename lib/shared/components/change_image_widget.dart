import 'package:banking/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeImageWidget extends StatelessWidget {
  const ChangeImageWidget();
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
        onTap: () => Provider.of<UserProvider>(
          context,
          listen: false,
        ).changeProfileImage(),
        child: Row(
          children: [
            const Icon(
              Icons.image_rounded,
              size: 28,
              color: Color.fromARGB(255, 153, 8, 88),
            ),
            const SizedBox(width: 16),
            Text(
              'Change profile image',
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
