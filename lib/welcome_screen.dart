import 'package:flutter/material.dart';
import 'package:myapp/reg_screen.dart';
import 'package:myapp/login.dart';
import 'package:myapp/localization/localization_manager.dart';

final LocalizationManager _localizationManager = LocalizationManager();

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter JSON i18n Demo'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String lang) async {
              await _localizationManager.loadLanguage(lang);
              //setState(() {});  // Update the UI after changing the language
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 'en', child: Text('English')),
                PopupMenuItem(value: 'fr', child: Text('Français')),
              ];
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffB81736),
            Color(0xff281537),
          ]),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Image(image: AssetImage('assets/logo.png')),
            ),
            const SizedBox(height: 100),
            Text(
              _localizationManager.getString('welcome'),
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Container(
                height: 53,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    _localizationManager.getString('sign_in'),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegScreen()),
                );
              },
              child: Container(
                height: 53,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    _localizationManager.getString('sign_up'),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              _localizationManager.getString('social_media'),
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Image(image: AssetImage('assets/logo_google.png')),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}