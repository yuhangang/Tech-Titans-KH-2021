import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_titans/components/intro_slider/widgets/slider_item.dart';

class IntroSlider extends HookWidget {
  IntroSlider({
    required PageController pageController,
    required this.onPageChanged2,
  }) : _pageController = pageController;

  final PageController _pageController;
  final Function onPageChanged2;
  final List<Widget> widgets = [SliderItem1()];

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
          return widgets[0];
        });
  }
}

class SliderItem1 extends StatefulWidget {
  const SliderItem1({
    Key? key,
  }) : super(key: key);

  @override
  _SliderItemState createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem1> {
  double sliderElectric = 0;
  double sliderGasoline = 0;

  @override
  Widget build(BuildContext context) {
    final TextStyle topicStyle = Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(fontWeight: FontWeight.w500);
    final TextStyle valueStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 18, fontWeight: FontWeight.w300);
    return SafeArea(
      child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Home Electricity Bill",
                              style: topicStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Slider(
                                    value: sliderElectric,
                                    max: 500,
                                    onChanged: (_) {
                                      setState(() {
                                        sliderElectric = _;
                                      });
                                    }),
                                Text(
                                  "RM ${sliderElectric.toStringAsFixed(0)}",
                                  style: valueStyle,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Gasoline Bill",
                              style: topicStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Slider(
                                    value: sliderGasoline,
                                    max: 500,
                                    onChanged: (_) {
                                      setState(() {
                                        sliderGasoline = _;
                                      });
                                    }),
                                Text(
                                  "RM ${sliderGasoline.toStringAsFixed(0)}",
                                  style: valueStyle,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}

class SliderItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
