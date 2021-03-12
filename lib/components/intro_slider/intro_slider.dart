import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_titans/components/intro_slider/widgets/dot_indicator/dot_indicator.dart';
import 'package:tech_titans/components/intro_slider/widgets/dot_indicator/dots_decorator.dart';
import 'package:tech_titans/components/intro_slider/widgets/slider.dart';
import 'package:tech_titans/components/intro_slider/widgets/transparent_image.dart';

import 'package:tech_titans/screens/login/login_page.dart';

class IntroPage extends HookWidget {
  static const route = "/intro-page";
  final PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    final index = useState<double>(0);
    Function onPageChanged2 = (idx) {
      index.value = idx.toDouble();
    };

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
        elevation: 0,
        brightness: Theme.of(context).brightness,
        centerTitle: true,
        title: Text("Monthly Survey",
            style: TextStyle(
                color: Theme.of(context).primaryColorDark.withOpacity(0.8))),
      ),
      body: Container(
        child: Stack(
          children: [
            AnimatedPositioned(
              left: 0 - index.value * 50,
              curve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 2000),
              child: Container(
                width: MediaQuery.of(context).size.width + 5 * 50.0,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor.withOpacity(0.7),
                      Theme.of(context).brightness == Brightness.light
                          ? BlendMode.lighten
                          : BlendMode.darken),
                  child: FadeInImage(
                    placeholder: MemoryImage(TransparentImage.tranparentImage),
                    image: const AssetImage("assets/images/city.jpg"),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    alignment: const FractionalOffset(0.5, 0),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.1),
                    Colors.transparent
                  ])),
            ),
            IntroSlider(
                pageController: _pageController,
                onPageChanged2: onPageChanged2),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  DotsIndicator(
                    dotsCount: 5,
                    position: index.value,
                    decorator: DotsDecorator(
                      color: Colors.white.withOpacity(0.5),
                      activeColor: Colors.white,
                      size: const Size.fromRadius(6.0),
                      activeSize: const Size.fromRadius(8.0),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 6),
                          backgroundColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("SUBMIT",
                            style: GoogleFonts.sourceSansPro(
                                color: Colors.grey[600],
                                letterSpacing: 1,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10.0,
                                    color:
                                        const Color.fromARGB(20, 20, 20, 255),
                                  ),
                                ])),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Skip All",
                            style: GoogleFonts.sourceSansPro(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10.0,
                                    color:
                                        const Color.fromARGB(20, 20, 20, 255),
                                  ),
                                ])),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
