import 'package:banking/components/profile_settings_widget.dart';
import 'package:banking/providers/login_provider.dart';
import 'package:banking/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/edit_profile';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginProvider>(context).userModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 16,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
              radius: 50,
            ),
          ),
          Text(
            user.name,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 16),
          ProfileSettingsWidget(
            icon: Icons.account_circle_outlined,
            text: 'Change name',
            onTap: () {},
          ),
          ProfileSettingsWidget(
            icon: Icons.email_outlined,
            text: 'Change email address',
            onTap: () {},
          ),
          ProfileSettingsWidget(
            icon: Icons.lock_outline,
            text: 'Change password',
            onTap: () {},
          ),
          ProfileSettingsWidget(
            icon: Icons.image_rounded,
            text: 'Change profile image',
            onTap: () => Provider.of<ProfileProvider>(
              context,
              listen: false,
            ).changeProfileImage(oldModel: user),
          ),
          ProfileSettingsWidget(
            icon: Icons.phone_outlined,
            text: 'Change phone number',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
