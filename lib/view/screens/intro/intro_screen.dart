import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yamstack/view/common/components/background_image.dart';
import 'package:yamstack/view/screens/intro/intro_buttons_container.dart';
import 'package:yamstack/view/screens/intro/intro_title_container.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static const route = '/intro';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            const BackgroundImage(image: 'assets/image/intro_bg.jpg'),
            Container(color: Colors.black.withAlpha(30)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(height: 16),
                IntroTitleContainer(),
                IntroButtonsContainer(),
              ],
            )
          ],
        ),
      );
}
