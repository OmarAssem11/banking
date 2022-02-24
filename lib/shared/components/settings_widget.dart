import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final String routeName;
  const SettingsWidget({
    required this.text,
    required this.color,
    required this.icon,
    required this.routeName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 27,
        left: 22,
        top: 16,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(routeName),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: color,
              child: Icon(
                icon,
                size: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: Theme.of(context).textTheme.headline1,
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
