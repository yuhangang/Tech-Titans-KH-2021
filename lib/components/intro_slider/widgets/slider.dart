import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_titans/components/intro_slider/widgets/slider_item.dart';

class IntroSlider extends HookWidget {
  const IntroSlider({
    required PageController pageController,
    required this.onPageChanged2,
  }) : _pageController = pageController;

  final PageController _pageController;
  final Function onPageChanged2;

  @override
  Widget build(BuildContext context) {
    final opacity = useState<double>(0);
    Future.delayed(Duration.zero, () {
      opacity.value = 1;
    });
    return PageView.builder(
        itemCount: 5,
        controller: _pageController,
        onPageChanged: onPageChanged2 as void Function(int)?,
        itemBuilder: (_, index) {
          return SliderItem();
        });
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "YOUR VOICE",
                  style: GoogleFonts.cinzel(
                      color: Colors.white,
                      fontSize: 70,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          offset: const Offset(2, 2),
                          blurRadius: 10.0,
                          color: const Color.fromARGB(20, 20, 20, 255),
                        ),
                      ]),
                ),
              ),
            ))
          ],
        ));
  }
}
