import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yamstack/src/view/common/widgets/background_image.dart';
import 'package:yamstack/src/view/screens/intro/welcome/widgets/button_group.dart';
import 'package:yamstack/src/view/screens/intro/welcome/widgets/title_group.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static const ROUTE = '/intro';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            const BackgroundImage(image: 'assets/image/intro_bg.jpg'),
            Container(color: Colors.black.withAlpha(30)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 16),
                const TitleGroup(),
                const ButtonGroup(),
              ],
            )
          ],
        ),
      );
}
