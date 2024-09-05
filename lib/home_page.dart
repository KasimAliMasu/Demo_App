import 'package:demo_app/login_page.dart';
// import 'package:demo_app/main.dart';

// import 'package:demo_app/main.dart';
import 'package:demo_app/photos_api.dart';
import 'package:demo_app/post_api.dart';
import 'package:demo_app/shopping_page.dart';
import 'package:demo_app/upload_image.dart';
import 'package:demo_app/users_api.dart';
import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key, required this.title});

  final String title;

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('helloWorld'.tr),
        actions: [
          IconButton(
            onPressed: () {
              _showLanguageSelectionDialog(context);
            },
            icon: const Icon(
              Icons.language_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      title: 'loginPageTitle'.tr,
                    ),
                  ),
                );
              },
              child: Text('loginPageTitle'.tr),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostApiScreen(),
                  ),
                );
              },
              child: Text('goToPostApiPage'.tr),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhotosApiPage(),
                  ),
                );
              },
              child: Text('goToPhotosApiPage'.tr),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UsersApiPage(),
                  ),
                );
              },
              child: Text('goToUsersApiPage'.tr),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UploadImageScreen(),
                  ),
                );
              },
              child: Text('goToImageUploadPage'.tr),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingPage(),
                  ),
                );
              },
              child: Text('goToShoppingPage'.tr),
            ),
          ),
        ],
      ),
    );
  }
}

void _showLanguageSelectionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('selectLanguage'.tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () {
              Get.updateLocale(const Locale('en', 'US'));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Hindi'),
            onTap: () {
              Get.updateLocale(const Locale('hi', 'IN'));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Spanish'),
            onTap: () {
              Get.updateLocale(const Locale('es', 'ES'));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Arabic'),
            onTap: () {
              Get.updateLocale(const Locale('ar', 'SA'));
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    ),
  );
}
