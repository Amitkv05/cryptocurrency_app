import 'package:cryptocurrency_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isThemeSwitch = false;
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
                        const EdgeInsets.only(left: 20, right: 14, top: 18),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          options(
                            icons: Icons.color_lens_outlined,
                            title: 'Dark Mode',
                            trailing: Switch(
                              value: isThemeSwitch,
                              onChanged: ((value) {
                                setState(() {
                                  isThemeSwitch = value;
                                  themeProvider.toggleTheme();
                                });
                              }),
                            ),
                          ),
                          options(
                            icons: Icons.account_circle_outlined,
                            title: 'Account',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                          options(
                            icons: Icons.wallet_rounded,
                            title: 'Billing/Payment',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                          options(
                            icons: Icons.history_rounded,
                            title: 'History',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                          options(
                            icons: Icons.translate,
                            title: 'Language',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                          options(
                            icons: Icons.settings,
                            title: 'Settings',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                          options(
                            icons: Icons.security,
                            title: 'Privacy Policy',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                          options(
                            icons: Icons.question_mark_rounded,
                            title: 'FAQ',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                          options(
                            icons: Icons.description_outlined,
                            title: 'Terms & Conditions',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                          options(
                            icons: Icons.info_outline,
                            title: 'About us',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                          options(
                            icons: Icons.contact_page_outlined,
                            title: 'Contact Us',
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class options extends StatelessWidget {
  const options({
    super.key,
    required this.icons,
    required this.title,
    this.trailing,
  });
  final IconData icons;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: ListTile(
            leading: CircleAvatar(
              child: Icon(
                icons,
                size: 30,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            trailing: trailing),
      ),
    );
  }
}
