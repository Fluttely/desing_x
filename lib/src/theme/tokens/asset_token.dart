part of 'package:design_x/design_x.dart';

typedef AssetRef = String;

extension AssetRefExt on AssetRef {
  String resolve(BuildContext context) {
    final token = XTheme.of(context).assets.findByRef(this);

    assert(
      token != null,
      'AssetRef $this is not defined in the theme',
    );

    return token?.resolve(context) ?? '';
  }
}

@immutable
class AssetToken extends MixToken<String> {
  const AssetToken(super.name);

  @override
  String call() => (hashCode * -1).toString();

  @override
  String resolve(BuildContext context) {
    final themeValue = XTheme.of(context).assets[this];
    assert(
      themeValue != null,
      'AssetToken $name is not defined in the theme',
    );

    return themeValue!;
  }
}
