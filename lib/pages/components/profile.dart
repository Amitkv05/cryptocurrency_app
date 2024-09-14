import 'package:cryptocurrency_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isThemeSwitch = true;
  bool isNotificationSwitch = false;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    // var isThemeSwitch = themeProvider.toggleTheme();
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 36, left: 10, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: CircleAvatar(
                          radius: 46,
                          backgroundColor: Colors.white,
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: myWidth * 0.06),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Amit Kumar',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: myHeight * 0.003),
                          Text(
                            '+918791234567',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(height: myHeight * 0.003),
                          Text(
                            'xyz@gamil.com',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 52),
                decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 15, top: 18),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.color_lens_outlined,
                            size: 28,
                          ),
                          title: const Text(
                            'Dark mode',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          trailing: Switch(
                            value: isThemeSwitch,
                            onChanged: ((value) {
                              setState(() {
                                themeProvider.toggleTheme();
                                isThemeSwitch = value;
                              });
                            }),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.notifications_none_rounded,
                            size: 28,
                          ),
                          title: const Text(
                            'Notification',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          trailing: Switch(
                            value: isNotificationSwitch,
                            onChanged: ((newvalue) {
                              setState(() {
                                isNotificationSwitch = newvalue;
                              });
                            }),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.bookmark_border_rounded,
                            size: 28,
                          ),
                          title: Text(
                            'Bookmark',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.add_box_outlined,
                            size: 28,
                          ),
                          title: Text(
                            'Create News',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.edit_document,
                            size: 28,
                          ),
                          title: Text(
                            'Manage News',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.thumbs_up_down_outlined,
                            size: 28,
                          ),
                          title: Text(
                            'Manage Preferences',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.security,
                            size: 28,
                          ),
                          title: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.description_outlined,
                            size: 28,
                          ),
                          title: Text(
                            'Terms & Conditions',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            size: 28,
                          ),
                          title: Text(
                            'About us',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.contact_page_outlined,
                            size: 28,
                          ),
                          title: Text(
                            'Contact Us',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
