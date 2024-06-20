part of 'package:design_x/design_x.dart';

// const $standard = StandardTokens();
const $material = MaterialTokens();
const $token = XTokens();

@immutable
class XTokens
// extends MixTokens
{
  final breakpoint = const BreakpointTokenUtil();
  final color = const ColorTokenUtil();
  final radius = const RadiusTokenUtil();
  final space = const SpaceTokenUtil();
  final textStyle = const TextStyleTokenUtil();

  final asset = const AssetTokenUtil();
  final boxShadow = const BoxShadowTokenUtil();
  final duration = const DurationTokenUtil();
  final elevation = const ElevationTokenUtil();
  final font = const FontTokenUtil();
  // final gap = const GapTokenUtil();
  final image = const ImageTokenUtil();
  final svg = const SvgTokenUtil();
  final textShadow = const TextShadowTokenUtil();

  const XTokens();
}

@immutable
class BreakpointTokenUtil {
  const BreakpointTokenUtil();
}

@immutable
class ColorTokenUtil {
  const ColorTokenUtil();
}

@immutable
class RadiusTokenUtil {
  const RadiusTokenUtil();
}

@immutable
class SpaceTokenUtil {
  const SpaceTokenUtil();
}

@immutable
class TextStyleTokenUtil {
  const TextStyleTokenUtil();
}

@immutable
class AssetTokenUtil {
  const AssetTokenUtil();
}

@immutable
class BoxShadowTokenUtil {
  const BoxShadowTokenUtil();
}

@immutable
class DurationTokenUtil {
  const DurationTokenUtil();
}

@immutable
class ElevationTokenUtil {
  const ElevationTokenUtil();
}

@immutable
class FontTokenUtil {
  const FontTokenUtil();
}

// @immutable
// class GapTokenUtil {
//   const GapTokenUtil();
// }

@immutable
class ImageTokenUtil {
  const ImageTokenUtil();
}

@immutable
class SvgTokenUtil {
  const SvgTokenUtil();
}

@immutable
class TextShadowTokenUtil {
  const TextShadowTokenUtil();
}
