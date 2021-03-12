import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tech_titans/components/intro_slider/widgets/dot_indicator/dot_indicator.dart';
import 'package:tech_titans/components/intro_slider/widgets/dot_indicator/dots_decorator.dart';
import 'package:tech_titans/components/intro_slider/widgets/slider.dart';
import 'package:tech_titans/components/intro_slider/widgets/transparent_image.dart';
import 'package:tech_titans/providers/summary_provider.dart';
import 'package:tech_titans/providers/theme_provider.dart';

import 'package:tech_titans/screens/login/login_page.dart';

class IntroPage extends HookWidget {
  static const route = "/intro-page";
  final PageController _pageController = new PageController();
  final GlobalKey<SliderItemState> sliderState1 = new GlobalKey();
  final GlobalKey<SliderItem2State> sliderState2 = new GlobalKey();

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
              left: 0 - index.value * 100,
              curve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 2000),
              child: Container(
                width: MediaQuery.of(context).size.width + 2 * 100.0,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.7),
                      Theme.of(context).brightness == Brightness.light
                          ? BlendMode.lighten
                          : BlendMode.difference),
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
                      end: Provider.of<ThemeProvider>(context, listen: false)
                              .isDarkTheme
                          ? Alignment.bottomCenter
                          : Alignment.topCenter,
                      begin: Provider.of<ThemeProvider>(context, listen: false)
                              .isDarkTheme
                          ? Alignment.topCenter
                          : Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.1),
                    Colors.transparent
                  ])),
            ),
            IntroSlider(
              pageController: _pageController,
              onPageChanged2: onPageChanged2,
              sliderKey1: sliderState1,
              sliderKey2: sliderState2,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  DotsIndicator(
                    dotsCount: 2,
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
                        if (index.value == 0) {
                          index.value = 1;
                          _pageController.animateToPage(1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOutCirc);
                        } else {
                          Provider.of<SummaryProvider>(context, listen: false)
                              .submitSurvey(
                                  transportBill: sliderState1
                                          .currentState?.sliderElectric ??
                                      0,
                                  electricityBill: sliderState2
                                          .currentState?.sliderGasoline ??
                                      0);
                          Navigator.pop(context);
                        }
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 6),
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey[200]
                                  : Colors.blueGrey[700],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(index.value == 0 ? "NEXT" : "SUBMIT",
                            style: GoogleFonts.sourceSansPro(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.grey[600]
                                    : Colors.grey[100],
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
                        if (index.value == 0) {
                          Navigator.pop(context);
                        } else {
                          index.value = 0;
                          _pageController.animateToPage(0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOutCirc);
                        }
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(index.value == 0 ? "Skip All" : "Previous",
                            style: GoogleFonts.sourceSansPro(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 5.0,
                                    color: const Color.fromARGB(50, 20, 20, 20),
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
