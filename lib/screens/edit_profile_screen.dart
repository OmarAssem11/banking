import 'package:banking/providers/login_provider.dart';
import 'package:banking/shared/components/change_image_widget.dart';
import 'package:banking/shared/components/profile_settings_widget.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            ProfileSettingsWidget.editName(
              context: context,
              userModel: user,
            ),
            ProfileSettingsWidget.editEmail(
              context: context,
              userModel: user,
            ),
            ProfileSettingsWidget.editPassword(
              context: context,
              userModel: user,
            ),
            ProfileSettingsWidget.editPhone(
              context: context,
              userModel: user,
            ),
          ],
        ),
      ),
    );
  }
}
