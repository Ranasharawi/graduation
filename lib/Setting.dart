import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Setting extends StatefulWidget {

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isDark=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark?Colors.grey[800]:Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: () {  },),
        title: Text('Setting'),
        titleSpacing: 0,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SettingsList(
          sections: [
            SettingsSection(
              title: 'Common',
              tiles: [
                SettingsTile(
                  title: 'Language',
                  subtitle: 'English',
                  leading: Icon(Icons.language),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile.switchTile(
                  title: 'Dark mode',
                  leading: Icon(Icons.brightness_1),
                  switchValue: false,
                  onToggle: (bool value) {
                    setState(() {
                      isDark=!isDark;
                    });

                  },


                ),
              ],
            ),
            SettingsSection(
              title: 'Account',
              tiles: [
                SettingsTile(
                  title: 'phone number',
                  leading: Icon(Icons.phone),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Email',
                  leading: Icon(Icons.email),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Change password',
                  leading: Icon(Icons.lock_outline_rounded),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Sign out',
                  leading: Icon(Icons.logout),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Misc',
              tiles: [
                SettingsTile(
                  title: 'Terms of Service',
                  leading: Icon(Icons.sticky_note_2_outlined),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
