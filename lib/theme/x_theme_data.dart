part of 'package:design_x/design_x.dart';

class XTheme extends InheritedWidget {
  const XTheme({required super.child, required this.data, super.key});

  static XThemeData of(BuildContext context) {
    final metricsData =
        context.dependOnInheritedWidgetOfExactType<XTheme>()?.data;

    assert(metricsData != null, 'No XTheme found in context');

    return metricsData!;
  }

  static XThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<XTheme>()?.data;
  }

  final XThemeData data;

  @override
  bool updateShouldNotify(XTheme oldWidget) => data != oldWidget.data;
}

class XThemeData extends MixThemeData {
  final StyledTokens<AssetToken, String> assets;
  final StyledTokens<BoxShadowToken, BoxShadow> boxShadows;
  final StyledTokens<DurationToken, Duration> durations;
  final StyledTokens<ElevationToken, double> elevations;
  final StyledTokens<FontToken, String> fonts;
  // final StyledTokens<GapToken, Gap> gaps;
  final StyledTokens<ImageToken, Image> images;
  final StyledTokens<SvgToken, SvgPicture> svgs;
  final StyledTokens<TextShadowToken, Shadow> textShadows;

  const XThemeData.raw({
    required this.assets,
    required this.boxShadows,
    required super.breakpoints,
    required super.colors,
    required this.durations,
    required this.elevations,
    required this.fonts,
    // required this.gaps,
    required this.images,
    required super.radii,
    required super.spaces,
    required this.svgs,
    required this.textShadows,
    required super.textStyles,
  }) : super.raw();

  const XThemeData.empty()
      : assets = const StyledTokens.empty(),
        boxShadows = const StyledTokens.empty(),
        durations = const StyledTokens.empty(),
        elevations = const StyledTokens.empty(),
        fonts = const StyledTokens.empty(),
        // gaps = const StyledTokens.empty(),
        images = const StyledTokens.empty(),
        svgs = const StyledTokens.empty(),
        textShadows = const StyledTokens.empty(),
        super.empty();

  factory XThemeData({
    Map<AssetToken, String>? assets,
    Map<BoxShadowToken, BoxShadow>? boxShadows,
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<DurationToken, Duration>? durations,
    Map<ElevationToken, double>? elevations,
    Map<FontToken, String>? fonts,
    // Map<GapToken, Gap>? gaps,
    Map<ImageToken, Image>? images,
    Map<RadiusToken, Radius>? radii,
    Map<SpaceToken, double>? spaces,
    Map<SvgToken, SvgPicture>? svgs,
    Map<TextShadowToken, Shadow>? textShadows,
    Map<TextStyleToken, TextStyle>? textStyles,
  }) {
    return XThemeData.raw(
      assets: StyledTokens(assets ?? const {}),
      boxShadows: StyledTokens(boxShadows ?? const {}),
      breakpoints: StyledTokens(breakpoints ?? const {}),
      colors: StyledTokens(colors ?? const {}),
      durations: StyledTokens(durations ?? const {}),
      elevations: StyledTokens(elevations ?? const {}),
      fonts: StyledTokens(fonts ?? const {}),
      // gaps: StyledTokens((gaps == null || gaps.isEmpty)
      //     ? spaces?.map((spaceToken, value) => MapEntry(GapToken(spaceToken.name), Gap(value))) ?? {}
      //     : gaps),
      images: StyledTokens(images ?? const {}),
      radii: StyledTokens(radii ?? const {}),
      spaces: StyledTokens(spaces ?? const {}),
      svgs: StyledTokens(svgs ?? const {}),
      textShadows: StyledTokens(textShadows ?? const {}),
      textStyles: StyledTokens(textStyles ?? const {}),
    );
  }

  // factory XThemeData.withMaterial({
  //   Map<AssetToken, String>? assets,
  //   Map<BoxShadowToken, BoxShadow>? boxShadows,
  //   Map<BreakpointToken, Breakpoint>? breakpoints,
  //   Map<ColorToken, Color>? colors,
  //   Map<DurationToken, Duration>? durations,
  //   Map<ElevationToken, double>? elevations,
  //   Map<FontToken, String>? fonts,
  //   // Map<GapToken, Gap>? gaps,
  //   Map<ImageToken, Image>? images,
  //   Map<RadiusToken, Radius>? radii,
  //   Map<SpaceToken, double>? spaces,
  //   Map<SvgToken, SvgPicture>? svgs,
  //   Map<TextShadowToken, Shadow>? textShadows,
  //   Map<TextStyleToken, TextStyle>? textStyles,
  // }) {
  //   return materialXTheme.merge2(
  //     XThemeData(
  //       assets: assets,
  //       boxShadows: boxShadows,
  //       breakpoints: breakpoints,
  //       colors: colors,
  //       durations: durations,
  //       elevations: elevations,
  //       fonts: fonts,
  //       // gaps: gaps,
  //       images: images,
  //       radii: radii,
  //       spaces: spaces,
  //       svgs: svgs,
  //       textShadows: textShadows,
  //       textStyles: textStyles,
  //     ),
  //   );
  // }

  factory XThemeData.withStandard({
    Map<AssetToken, String>? assets,
    Map<BoxShadowToken, BoxShadow>? boxShadows,
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<DurationToken, Duration>? durations,
    Map<ElevationToken, double>? elevations,
    Map<FontToken, String>? fonts,
    // Map<GapToken, Gap>? gaps,
    Map<ImageToken, Image>? images,
    Map<RadiusToken, Radius>? radii,
    Map<SpaceToken, double>? spaces,
    Map<SvgToken, SvgPicture>? svgs,
    Map<TextShadowToken, Shadow>? textShadows,
    Map<TextStyleToken, TextStyle>? textStyles,
  }) {
    return materialXTheme.merge2(
      XThemeData(
        assets: assets,
        boxShadows: boxShadows,
        breakpoints: breakpoints,
        colors: colors,
        durations: durations,
        elevations: elevations,
        fonts: fonts,
        // gaps: gaps,
        images: images,
        radii: radii,
        spaces: spaces,
        svgs: svgs,
        textShadows: textShadows,
        textStyles: textStyles,
      ),
    );
  }

  @override
  XThemeData copyWith({
    Map<AssetToken, String>? assets,
    Map<BoxShadowToken, BoxShadow>? boxShadows,
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<DurationToken, Duration>? durations,
    Map<ElevationToken, double>? elevations,
    Map<FontToken, String>? fonts,
    // Map<GapToken, Gap>? gaps,
    Map<ImageToken, Image>? images,
    Map<RadiusToken, Radius>? radii,
    Map<SpaceToken, double>? spaces,
    Map<SvgToken, SvgPicture>? svgs,
    Map<TextShadowToken, Shadow>? textShadows,
    Map<TextStyleToken, TextStyle>? textStyles,
  }) {
    return XThemeData.raw(
      assets: assets == null ? this.assets : StyledTokens(assets),
      boxShadows:
          boxShadows == null ? this.boxShadows : StyledTokens(boxShadows),
      durations: durations == null ? this.durations : StyledTokens(durations),
      elevations:
          elevations == null ? this.elevations : StyledTokens(elevations),
      fonts: fonts == null ? this.fonts : StyledTokens(fonts),
      // gaps: gaps == null ? this.gaps : StyledTokens(gaps),
      images: images == null ? this.images : StyledTokens(images),
      svgs: svgs == null ? this.svgs : StyledTokens(svgs),
      textShadows:
          textShadows == null ? this.textShadows : StyledTokens(textShadows),
      textStyles:
          textStyles == null ? this.textStyles : StyledTokens(textStyles),
      colors: colors == null ? this.colors : StyledTokens(colors),
      breakpoints:
          breakpoints == null ? this.breakpoints : StyledTokens(breakpoints),
      radii: radii == null ? this.radii : StyledTokens(radii),
      spaces: spaces == null ? this.spaces : StyledTokens(spaces),
    );
  }

  XThemeData merge2(XThemeData other) {
    return XThemeData.raw(
      assets: assets.merge(other.assets),
      boxShadows: boxShadows.merge(other.boxShadows),
      durations: durations.merge(other.durations),
      elevations: elevations.merge(other.elevations),
      fonts: fonts.merge(other.fonts),
      // gaps: gaps.merge(other.gaps),
      images: images.merge(other.images),
      svgs: svgs.merge(other.svgs),
      textShadows: textShadows.merge(other.textShadows),
      textStyles: textStyles.merge(other.textStyles),
      colors: colors.merge(other.colors),
      breakpoints: breakpoints.merge(other.breakpoints),
      radii: radii.merge(other.radii),
      spaces: spaces.merge(other.spaces),
    );
  }
}
