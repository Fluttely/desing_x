import 'dart:convert';

import 'package:design_x/design_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return XTheme(
      data: themeData,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            primary: Colors.red,
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

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

  final mediumBorderRadius =
      theme.radii[$token.radius.medium]!.toBorderRadius();

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

/// TOKENS
extension AssetTokenUtilExtension on AssetTokenUtil {
  AssetToken get sample => const AssetToken('sample');
}

extension BoxShadowTokenUtilExtension on BoxShadowTokenUtil {
  BoxShadowToken get large => const BoxShadowToken('large');
}

extension BreakpointTokenUtilExtension on BreakpointTokenUtil {
  BreakpointToken get mobile => const BreakpointToken('mobile');
}

extension ColorTokenUtilExtension on ColorTokenUtil {
  ColorToken get primary => const ColorToken('primary');
  ColorToken get card => const ColorToken('card');
}

extension DurationTokenUtilExtension on DurationTokenUtil {
  DurationToken get quick => const DurationToken('quick');
}

extension ElevationTokenUtilExtension on ElevationTokenUtil {
  ElevationToken get level2 => const ElevationToken('level2');
}

extension FontTokenUtilExtension on FontTokenUtil {
  FontToken get astronaut => const FontToken('astronaut');
}

extension ImageTokenUtilExtension on ImageTokenUtil {
  ImageToken get fruit => const ImageToken('fruit');
  ImageToken get googleLogo => const ImageToken('googleLogo');
}

extension RadiusTokenUtilExtension on RadiusTokenUtil {
  RadiusToken get medium => const RadiusToken('medium');
}

extension SpaceTokenUtilExtension on SpaceTokenUtil {
  SpaceToken get extraLarge => const SpaceToken('extraLarge');
}

extension SvgTokenUtilExtension on SvgTokenUtil {
  SvgToken get fireEmoji => const SvgToken('fireEmoji');
  SvgToken get brazilFlag => const SvgToken('brazilFlag');
}

extension TextShadowTokenUtilExtension on TextShadowTokenUtil {
  TextShadowToken get title => const TextShadowToken('title');
}

extension TextStyleTokenUtilExtension on TextStyleTokenUtil {
  TextStyleToken get title => const TextStyleToken(' d');
}

/// THEME DATA
final themeData = XThemeData.withStandard(
  assets: {
    $token.asset.sample: 'assets/data/sample.json',
  },
  boxShadows: {
    $token.boxShadow.large: BoxShadow(
      color: const Color.fromARGB(255, 255, 242, 0).withOpacity(0.5),
      spreadRadius: 4.0,
      blurRadius: 3.0,
      offset: const Offset(6.0, 6.0),
    ),
  },
  breakpoints: {
    $token.breakpoint.mobile: const Breakpoint(maxWidth: 599),
  },
  colors: {
    $token.color.primary: const Color.fromARGB(255, 0, 255, 229),
    $token.color.card: const Color.fromARGB(255, 255, 115, 22),
  },
  durations: {
    $token.duration.quick: const Duration(milliseconds: 500),
  },
  elevations: {
    $token.elevation.level2: 4.0,
  },
  fonts: {
    $token.font.astronaut: 'Astronaut_PersonalUse',
  },
  images: {
    $token.image.fruit:
        const Image(image: AssetImage('assets/images/orange.jpg')),
    $token.image.googleLogo: const Image(
        image: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png')),
  },
  radii: {
    $token.radius.medium: const Radius.circular(12),
  },
  spaces: {
    $token.space.extraLarge: 24,
  },
  svgs: {
    $token.svg.fireEmoji: SvgPicture.asset('assets/svgs/fire.svg'),
    $token.svg.brazilFlag: SvgPicture.network(
      'https://upload.wikimedia.org/wikipedia/commons/0/05/Flag_of_Brazil.svg',
      fit: BoxFit.contain,
      height: 128,
    ),
  },
  textShadows: {
    $token.textShadow.title: Shadow(
      color: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.5),
      blurRadius: 1.0,
      offset: const Offset(-3.0, 3.0),
    ),
  },
  textStyles: {
    $token.textStyle.title: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 68, 255),
    ),
  },
);

class User {
  final int id;
  final String name;
  final String email;
  final String age;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }
}
