part of 'package:design_x/design_x.dart';
// TODO: REMOVE image: AssetImage('') from all file

class ImageToken extends MixToken<Image> {
  const ImageToken(super.name);

  @override
  ImageRef call() => ImageRef(this);

  @override
  Image resolve(BuildContext context) {
    final themeValue = XTheme.of(context).images[this];
    assert(
      themeValue != null,
      'ImageToken $name is not defined in the theme and has no default value',
    );

    final resolvedValue =
        themeValue is ImageResolver ? themeValue.resolve(context) : themeValue;

    return resolvedValue ?? const Image(image: AssetImage(''));
  }
}

@immutable
class ImageResolver extends Image with WithTokenResolver<Image> {
  @override
  final BuildContextResolver<Image> resolve;

  const ImageResolver(this.resolve, {super.key})
      : super(image: const AssetImage(''));
}

@immutable
class ImageRef extends Image with TokenRef<ImageToken, Image> {
  @override
  final ImageToken token;
  const ImageRef(this.token, {super.key}) : super(image: const AssetImage(''));

  // @override
  // operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is ImageRef && other.token == token;
  // }

  // @override
  // int get hashCode => token.hashCode;
}

@immutable
class UtilityWithImageTokens<T> {
  final T Function(Image value) _fn;

  const UtilityWithImageTokens(T Function(Image value) fn) : _fn = fn;

  factory UtilityWithImageTokens.shorthand(
    T Function(Image p1, [Image? p2, Image? p3, Image? p4]) fn,
  ) {
    return UtilityWithImageTokens((Image value) => fn(value));
  }

  T call(Image value) => _fn(value);
}
