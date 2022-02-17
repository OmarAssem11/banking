import 'package:banking/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

DropdownButtonFormField customDropDownButton({
  required BuildContext context,
  required Iterable<int> list,
  Function(dynamic)? onChange,
  required String hint,
  required int amount,
}) {
  final themeColor = Theme.of(context).colorScheme;
  return DropdownButtonFormField(
    iconEnabledColor: themeColor.secondary,
    iconDisabledColor: themeColor.onSurface,
    isExpanded: true,
    menuMaxHeight: 150,
    items: list
        .map(
          (e) => DropdownMenuItem(
            alignment: Alignment.center,
            value: e,
            child: Text('${e + amount}'),
          ),
        )
        .toList(),
    hint: Text(
      hint,
      style: TextStyle(color: themeColor.secondary),
    ),
    onChanged: onChange,
    decoration: const InputDecoration(
      constraints: BoxConstraints(
        maxWidth: 100,
        maxHeight: 60,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    validator: (value) {
      if (value == null) {
        return "$hint can't be empty";
      }
      return null;
    },
  );
}

TextFormField customTextFormField({
  required BuildContext context,
  required TextEditingController controller,
  required String text,
  required IconData prefix,
  required TextInputType keyboardType,
}) {
  final themeColor = Theme.of(context).colorScheme;
  return TextFormField(
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: themeColor.secondary),
      hintText: text,
      hintStyle: TextStyle(color: themeColor.secondary),
      prefixIcon: Icon(
        prefix,
        color: themeColor.secondary,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    autocorrect: false,
    keyboardType: keyboardType,
    controller: controller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "$text can't be empty";
      }
      return null;
    },
  );
}

TextFormField passwordTextFormField({
  required BuildContext context,
  required TextEditingController controller,
}) {
  final provider = Provider.of<GlobalProvider>(context);
  final themeColor = Theme.of(context).colorScheme;

  return TextFormField(
    decoration: InputDecoration(
      hintText: 'Password',
      labelStyle: TextStyle(color: themeColor.secondary),
      labelText: 'Password',
      hintStyle: TextStyle(color: themeColor.secondary),
      prefixIcon: Icon(
        Icons.lock_outline,
        color: themeColor.secondary,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          provider.isObscure
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: themeColor.secondary,
        ),
        onPressed: provider.changeObscure,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    obscureText: provider.isObscure,
    autocorrect: false,
    enableSuggestions: false,
    controller: controller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Password can't be empty";
      }
      return null;
    },
  );
}

ButtonStyle customButtonStyle({required BuildContext context}) {
  final themeColor = Theme.of(context).colorScheme;
  final provider = Provider.of<GlobalProvider>(context);
  return ButtonStyle(
    fixedSize: MaterialStateProperty.all(
      const Size(360, 60),
    ),
    backgroundColor: MaterialStateProperty.all(themeColor.onBackground),
    foregroundColor: provider.isDark
        ? MaterialStateProperty.all(themeColor.secondary)
        : MaterialStateProperty.all(Colors.white),
  );
}

Padding transactionWidget(BuildContext context) {
  final theme = Theme.of(context);
  final dateFormat = DateFormat('dd-MM-yyyy  hh:mm');
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 32,
      vertical: 8,
    ),
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1645017448~exp=1645018048~hmac=193ded0c9ac37adbdf730275dc5c688b843b169302e3be45b00e2885e0400a3b&w=1060',
            ),
            radius: 22,
          ),
        ),
        Column(
          children: [
            Text(
              'Mohamed Salem',
              style: theme.textTheme.headline2,
            ),
            Text(
              dateFormat.format(DateTime.now()),
              style: theme.textTheme.subtitle2,
            ),
          ],
        ),
        const Spacer(),
        Text(
          '+\$860',
          style: theme.textTheme.headline5,
        ),
      ],
    ),
  );
}

Container settingsSwitch({
  required BuildContext context,
  required String text,
  required Color color,
  required IconData icon,
  required bool value,
  required Function(bool) onChange,
}) {
  final textTheme = Theme.of(context).textTheme;
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
          style: textTheme.headline1,
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
