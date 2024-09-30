import 'dart:convert';

import 'package:design_x/design_x.dart';
import 'package:example/full_example/models/user.dart';
import 'package:example/full_example/theme/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  Future<List<User>> _loadJson(String path) async {
    String jsonString = await rootBundle.loadString(path);
    List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = XTheme.of(context);
    final sampleAsset = theme.assets[$token.asset.sample]!;
    final mobileBreakpoint = theme.breakpoints[$token.breakpoint.mobile]!;
    final quickDuration = theme.durations[$token.duration.quick]!;
    final astronautFont = theme.fonts[$token.font.astronaut]!;
    final titleTextShadow = theme.textShadows[$token.textShadow.title]!;
    final titleTextStyle = theme.textStyles[$token.textStyle.title]!;
    final primaryColor = theme.colors[$token.color.primary]!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('titleTextStyle'),
        titleTextStyle: titleTextStyle.copyWith(
          shadows: [
            titleTextShadow,
          ],
          fontFamily: astronautFont,
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await Future.delayed(quickDuration);
              final loadedUsers = await _loadJson(sampleAsset);
              setState(() {
                users = loadedUsers;
              });
            },
            child: const Text('Load Users'),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < mobileBreakpoint.maxWidth) {
            return Column(
              children: _body(users, context),
            );
          } else {
            return Row(
              children: _body(users, context),
            );
          }
        },
      ),
    );
  }
}

List<Widget> _body(List<User> users, BuildContext context) {
  final theme = XTheme.of(context);

  final largeBoxShadow = theme.boxShadows[$token.boxShadow.large]!;

  final primaryColor = theme.colors[$token.color.primary]!;
  // final materialPrimaryColor = theme.colors[$material.colorScheme.primary]!;
  final cardColor = theme.colors[$token.color.card]!;

  final level2Elevation = theme.elevations[$token.elevation.level2]!;

  final fruitImage = theme.images[$token.image.fruit]!;
  final fruitAssetName = fruitImage.getAssetName() ?? '';
  final googleLogo = theme.images[$token.image.googleLogo]!;
  final googleLogoUrl = googleLogo.getNetworkUrl() ?? '';

  final mediumBorderRadius = theme.radii[$token.radius.medium]!.toBorderRadius();

  final extraLargeSpace = theme.spaces[$token.space.extraLarge]!;
  final extraLargeGap = extraLargeSpace.toGap();

  final fireEmoji = theme.svgs[$token.svg.fireEmoji]!;
  final brazilFlag = theme.svgs[$token.svg.brazilFlag]!;

  final titleTextStyle = theme.textStyles[$token.textStyle.title]!;

  return [
    Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];

          return ListTile(
            tileColor: cardColor,
            titleTextStyle: titleTextStyle,
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Text(user.age),
          );
        },
      ),
    ),
    Expanded(
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                largeBoxShadow,
              ],
            ),
            child: fruitImage,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: cardColor.withOpacity(0.5),
            ),
            child: Text(fruitAssetName),
          ),
        ],
      ),
    ),
    extraLargeGap,
    SizedBox(
      width: 200,
      child: Stack(
        children: [
          googleLogo,
          DecoratedBox(
            decoration: BoxDecoration(
              color: cardColor.withOpacity(0.5),
            ),
            child: Text(googleLogoUrl),
          ),
        ],
      ),
    ),
    Card(
      color: cardColor,
      elevation: level2Elevation,
      child: fireEmoji,
    ),
    Container(
      margin: EdgeInsets.all(extraLargeSpace),
      padding: EdgeInsets.all(extraLargeSpace),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: mediumBorderRadius,
        boxShadow: [
          largeBoxShadow,
        ],
      ),
      child: Center(
        child: brazilFlag,
      ),
    ),
  ];
}
