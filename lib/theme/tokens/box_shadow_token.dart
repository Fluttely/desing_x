part of 'package:design_x/design_x.dart';

class BoxShadowToken extends MixToken<BoxShadow> {
  const BoxShadowToken(super.name);

  @override
  BoxShadowRef call() => BoxShadowRef(this);

  @override
  BoxShadow resolve(BuildContext context) {
    final themeValue = XTheme.of(context).boxShadows[this];
    assert(
      themeValue != null,
      'BoxShadowToken $name is not defined in the theme and has no default value',
    );

    final resolvedValue = themeValue is BoxShadowResolver ? themeValue.resolve(context) : themeValue;

    return resolvedValue ?? const BoxShadow();
  }
}

@immutable
class BoxShadowResolver extends BoxShadow with WithTokenResolver<BoxShadow> {
  @override
  final BuildContextResolver<BoxShadow> resolve;

  const BoxShadowResolver(this.resolve) : super();
}

@immutable
class BoxShadowRef extends BoxShadow with TokenRef<BoxShadowToken, BoxShadow> {
  @override
  final BoxShadowToken token;

  const BoxShadowRef(this.token) : super();

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoxShadowRef && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

@immutable
class UtilityWithBoxShadowTokens<T> {
  final T Function(BoxShadow value) _fn;

  const UtilityWithBoxShadowTokens(T Function(BoxShadow value) fn) : _fn = fn;

  factory UtilityWithBoxShadowTokens.shorthand(
    T Function(BoxShadow p1, [BoxShadow? p2, BoxShadow? p3, BoxShadow? p4]) fn,
  ) {
    return UtilityWithBoxShadowTokens((BoxShadow value) => fn(value));
  }

  T call(BoxShadow value) => _fn(value);
}
