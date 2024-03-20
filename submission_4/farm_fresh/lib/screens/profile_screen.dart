import 'package:farm_fresh/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:farm_fresh/services/assets_manager.dart';

import 'package:farm_fresh/widgets/subtitle_text.dart';

import '../providers/theme_provider.dart';
import '../widgets/app_name_text.dart';
import '../widgets/title_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.logo,
          ),
        ),
        title: const AppNameTextWidget(
          fontSize: 20,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: TitlesTextWidget(
                label: "Please login to have unlimited access",
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Colors.green, width: 3),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitlesTextWidget(label: "John Doe"),
                      SizedBox(
                        height: 6,
                      ),
                      SubtitleTextWidget(label: "johndoe@gmail.com")
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitlesTextWidget(
                  label: "Details",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomListTile(
                  text: "All Orders",
                  imagePath: AssetsManager.orderSvg,
                  function: () {},
                ),
                CustomListTile(
                  text: "Address",
                  imagePath: AssetsManager.address,
                  function: () {},
                ),
                CustomListTile(
                  text: "Viewed Recently",
                  imagePath: AssetsManager.recent,
                  function: () {},
                ),
                const SizedBox(
                  height: 6,
                ),
                const Divider(
                  thickness: 1,
                ),
                const TitlesTextWidget(
                  label: "Settings",
                ),
                const SizedBox(
                  height: 10,
                ),
                SwitchListTile(
                  secondary: Image.asset(
                    AssetsManager.theme,
                    height: 34,
                  ),
                  title: Text(themeProvider.getIsDarkTheme
                      ? "Dark Mode"
                      : "Light Mode"),
                  value: themeProvider.getIsDarkTheme,
                  onChanged: (value) {
                    themeProvider.setDarkTheme(themeValue: value);
                  },
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
              ),
              icon: const Icon(Icons.login),
              label: const Text("Login"),
                  onPressed: () async {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                  // await MyAppFunctions.showErrorOrWarningDialog(
                  //     context: context,
                  //     subtitle: "Are you sure you want to signout",
                  //     fct: () {},
                  //     isError: false,);
                },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(
        imagePath,
        height: 34,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}