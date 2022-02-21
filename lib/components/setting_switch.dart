import 'package:flutter/material.dart';

class SettingSwitch extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final bool value;
  final Function(bool) onChange;
  const SettingSwitch({
    required this.text,
    required this.color,
    required this.icon,
    required this.value,
    required this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 22,
        left: 22,
        top: 16,
      ),
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
          Switch.adaptive(
            value: value,
            onChanged: onChange,
            activeColor: const Color(0xff3282B8),
          ),
        ],
      ),
    );
  }
}
