import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/Radios.dart';
import '../../providers/settings_provider.dart';

class RadioController extends StatefulWidget {
  Radios radioResponse;
  Function play;

  Function pause;

  RadioController(
      {required this.radioResponse, required this.play, required this.pause});

  @override
  State<RadioController> createState() => _RadioControllerState();
}

class _RadioControllerState extends State<RadioController> {
  @override
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            widget.radioResponse.name ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                color:
                    settingProvider.isDarkMood() ? Colors.white : Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // widget.play();
                },
                icon: Icon(
                  Icons.play_arrow,
                  size: 45,
                  color: settingProvider.isDarkMood()
                      ? Theme.of(context).accentColor
                      : Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  // widget.
                  // pause();
                },
                icon: Icon(
                  Icons.pause,
                  size: 45,
                  color: settingProvider.isDarkMood()
                      ? Theme.of(context).accentColor
                      : Theme.of(context).primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
