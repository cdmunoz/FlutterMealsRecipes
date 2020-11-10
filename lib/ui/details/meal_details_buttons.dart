import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetailsButtons extends StatefulWidget {
  const MealDetailsButtons({
    Key key,
    @required Meal meal,
  })  : _meal = meal,
        super(key: key);

  final Meal _meal;

  @override
  _MealDetailsButtonsState createState() => _MealDetailsButtonsState();
}

class _MealDetailsButtonsState extends State<MealDetailsButtons> {
  BuildContext scaffoldContext;

  Future<void> _launchYoutubeVideo(Meal meal) async {
    String youtubeUrl = meal.strYoutube;
    if (youtubeUrl != null && youtubeUrl.isNotEmpty) {
      if (await canLaunch(youtubeUrl)) {
        final bool _nativeAppLaunchSucceeded = await launch(
          youtubeUrl,
          forceSafariVC: false,
          universalLinksOnly: true,
        );
        if (!_nativeAppLaunchSucceeded) {
          await launch(youtubeUrl, forceSafariVC: true);
        }
      }
    } else {
      _displaySnackBar("No video info available.");
    }
  }

  Future<void> _launchBrowser(Meal meal) async {
    String url = meal.strSource;
    if (url != null && url.isNotEmpty) {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: false,
          universalLinksOnly: false,
          headers: <String, String>{'header_key': 'header_value'},
        );
      } else {
        throw 'Could not launch $url';
      }
    } else {
      _displaySnackBar("No source info available.");
    }
  }

  void _displaySnackBar(String message) {
    final snackBar = new SnackBar(
      content: new Text(
        message,
        style: TextStyle(
          fontSize: generalTextSize,
        ),
      ),
      backgroundColor: primaryColor,
    );
    Scaffold.of(scaffoldContext).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    scaffoldContext = context;
    return SafeArea(
      top: false,
      child: Padding(
        padding:
            EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0, bottom: 8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  _launchYoutubeVideo(widget._meal);
                },
                child: Ink(
                  height: 50.0,
                  decoration: new BoxDecoration(
                    color: whiteColor,
                    border: Border.all(
                      color: primaryColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      "Youtube".toUpperCase(),
                      style: TextStyle(
                        fontSize: contentTextSize,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  _launchBrowser(widget._meal);
                },
                child: Ink(
                  height: 50.0,
                  decoration: new BoxDecoration(
                    color: whiteColor,
                    border: Border.all(
                      color: accentColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      "Source".toUpperCase(),
                      style: TextStyle(
                        fontSize: contentTextSize,
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
