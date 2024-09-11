import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

blogLauncherUrl (String url) async {
  var uri = Uri.parse(url);
  if(await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("Could not launch ${uri.toString()}");
  }

}