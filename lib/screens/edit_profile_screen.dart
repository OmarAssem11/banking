import 'package:banking/components/change_image_widget.dart';
import 'package:banking/components/profile_settings_widget.dart';
import 'package:banking/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/edit_profile';
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginProvider>(context).userModel;
    final controller = TextEditingController();
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
          const ChangeImageWidget(),
          ProfileSettingsWidget(
            icon: Icons.account_circle_outlined,
            text: 'name',
            controller: controller,
            keyboardType: TextInputType.name,
          ),
          ProfileSettingsWidget(
            icon: Icons.email_outlined,
            text: 'email address',
            controller: controller,
            keyboardType: TextInputType.emailAddress,
          ),
          ProfileSettingsWidget(
            icon: Icons.lock_outline,
            text: 'password',
            controller: controller,
            keyboardType: TextInputType.visiblePassword,
          ),
          ProfileSettingsWidget(
            icon: Icons.phone_outlined,
            text: 'phone number',
            controller: controller,
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
