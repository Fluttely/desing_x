part of 'package:design_x/design_x.dart';

typedef ElevationRef = double;

extension ElevationRefExt on ElevationRef {
  double resolve(BuildContext context) {
    final token = XTheme.of(context).elevations.findByRef(this);

    assert(
      token != null,
      'ElevationRef $this is not defined in the theme',
    );

    return token?.resolve(context) ?? 0.0;
  }
}

@immutable
class ElevationToken extends MixToken<double> {
  const ElevationToken(super.name);

  @override
  double call() => hashCode * -1.0;

  @override
  double resolve(BuildContext context) {
    final themeValue = XTheme.of(context).elevations[this];
    assert(
      themeValue != null,
      'ElevationToken $name is not defined in the theme',
    );

    return themeValue!;
  }
}
