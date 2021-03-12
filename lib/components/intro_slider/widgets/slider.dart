import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_titans/components/intro_slider/widgets/slider_item.dart';

class IntroSlider extends HookWidget {
  IntroSlider(
      {required PageController pageController,
      required this.onPageChanged2,
      required GlobalKey<SliderItemState> sliderKey1,
      required GlobalKey<SliderItem2State> sliderKey2})
      : _pageController = pageController,
        widgets = [SliderItem1(key: sliderKey1), SliderItem2(key: sliderKey2)];

  final PageController _pageController;
  final Function onPageChanged2;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    final opacity = useState<double>(0);
    Future.delayed(Duration.zero, () {
      opacity.value = 1;
    });
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        controller: _pageController,
        onPageChanged: onPageChanged2 as void Function(int)?,
        itemBuilder: (_, index) {
          return widgets[index];
        });
  }
}

class SliderItem1 extends StatefulWidget {
  const SliderItem1({
    Key? key,
  }) : super(key: key);

  @override
  SliderItemState createState() => SliderItemState();
}

class SliderItemState extends State<SliderItem1>
    with AutomaticKeepAliveClientMixin {
  double sliderElectric = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final TextStyle topicStyle = Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(fontWeight: FontWeight.w500);
    final TextStyle valueStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 18, fontWeight: FontWeight.w400);
    return SafeArea(
      child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 200, left: 20, right: 20),
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
                                    max: 1000,
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
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}

class SliderItem2 extends StatefulWidget {
  const SliderItem2({
    Key? key,
  }) : super(key: key);
  @override
  SliderItem2State createState() => SliderItem2State();
}

class SliderItem2State extends State<SliderItem2>
    with AutomaticKeepAliveClientMixin {
  double sliderGasoline = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final TextStyle topicStyle = Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(fontWeight: FontWeight.w500);
    final TextStyle valueStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 18, fontWeight: FontWeight.w400);
    return SafeArea(
      child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 200, left: 20, right: 20),
                    child: Column(
                      children: [
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
                                    max: 1000,
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
