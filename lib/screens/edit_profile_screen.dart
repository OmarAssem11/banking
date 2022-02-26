import 'package:banking/providers/user_provider.dart';
import 'package:banking/shared/components/change_image_widget.dart';
import 'package:banking/shared/components/profile_settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/edit_profile';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userModel;
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
                backgroundImage: NetworkImage(user!.imageUrl),
                radius: 50,
              ),
            ),
            Text(
              user.name,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 16),
            const ChangeImageWidget(),
            ProfileSettingsWidget.editName(context),
            ProfileSettingsWidget.editEmail(context),
            ProfileSettingsWidget.editPassword(context),
            ProfileSettingsWidget.editPhone(context),
          ],
        ),
      ),
    );
  }
}
