part of 'package:design_x/design_x.dart';

typedef FontRef = String;

extension FontRefExt on FontRef {
  String resolve(BuildContext context) {
    final token = XTheme.of(context).fonts.findByRef(this);

    assert(
      token != null,
      'FontRef $this is not defined in the theme',
    );

    return token?.resolve(context) ?? '';
  }
}

@immutable
class FontToken extends MixToken<String> {
  const FontToken(super.name);

  @override
  String call() => (hashCode * -1).toString();

  @override
  String resolve(BuildContext context) {
    final themeValue = XTheme.of(context).fonts[this];
    assert(
      themeValue != null,
      'FontToken $name is not defined in the theme',
    );

    return themeValue!;
  }
}
