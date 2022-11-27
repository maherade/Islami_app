import 'package:flutter/material.dart';
import 'package:islami_app/sura_details/sura_details_arguments.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'sura-details-screen';

  @override
  Widget build(BuildContext context) {
    SuraDetailsScreenArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsScreenArgs;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.name),
          ),
        ));
  }
}
