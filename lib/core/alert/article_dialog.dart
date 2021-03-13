// import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class LeaderDialog extends Dialog {
  final String title, descriptions, text;
  final Image? img;
  final isPrivate;
  const LeaderDialog(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text,
      this.isPrivate = true,
      this.img})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: !isPrivate
          ? PublicContent(title: title, descriptions: descriptions, image: img)
          : Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "Bitcoin's price is skyrocketing — so is its carbon footprint",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Scrollbar(
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          descriptions,
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "CLOSE",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 18),
                  ),
                ),
              ),
            ]),
    );
  }
}

class PublicContent extends StatelessWidget {
  const PublicContent({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.image,
  }) : super(key: key);

  final String title;
  final String descriptions;
  final image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        Image(image: image,),
        Container(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Scrollbar(
              isAlwaysShown: true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    descriptions,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 22,
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "DONE",
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
