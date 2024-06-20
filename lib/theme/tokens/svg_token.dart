part of 'package:design_x/design_x.dart';

// TODO: REMOVE SvgPicture.asset('') from all file

class SvgToken extends MixToken<SvgPicture> {
  const SvgToken(super.name);

  @override
  SvgRef call() => SvgRef(this);

  @override
  SvgPicture resolve(BuildContext context) {
    final themeValue = XTheme.of(context).svgs[this];
    assert(
      themeValue != null,
      'SvgToken $name is not defined in the theme and has no default value',
    );

    final resolvedValue = themeValue is SvgResolver ? themeValue.resolve(context) : themeValue;

    return resolvedValue ?? SvgPicture.asset('');
  }
}

@immutable
class SvgResolver extends SvgPicture with WithTokenResolver<SvgPicture> {
  @override
  final BuildContextResolver<SvgPicture> resolve;

  SvgResolver(this.resolve, {super.key})
      : super(
          const SvgAssetLoader('', packageName: null, assetBundle: null, theme: null),
        );
}

@immutable
class SvgRef extends SvgPicture with TokenRef<SvgToken, SvgPicture> {
  @override
  final SvgToken token;
  const SvgRef(this.token, {super.key})
      : super(
          const SvgAssetLoader('', packageName: null, assetBundle: null, theme: null),
        );

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SvgRef && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

@immutable
class UtilityWithSvgTokens<T> {
  final T Function(SvgPicture value) _fn;

  const UtilityWithSvgTokens(T Function(SvgPicture value) fn) : _fn = fn;

  factory UtilityWithSvgTokens.shorthand(
    T Function(SvgPicture p1, [SvgPicture? p2, SvgPicture? p3, SvgPicture? p4]) fn,
  ) {
    return UtilityWithSvgTokens((SvgPicture value) => fn(value));
  }

  T call(SvgPicture value) => _fn(value);
}
