part of 'package:design_x/design_x.dart';

class TextShadowToken extends MixToken<Shadow> {
  const TextShadowToken(super.name);

  @override
  TextShadowRef call() => TextShadowRef(this);

  @override
  Shadow resolve(BuildContext context) {
    final themeValue = XTheme.of(context).textShadows[this];
    assert(
      themeValue != null,
      'TextShadowToken $name is not defined in the theme and has no default value',
    );

    final resolvedValue = themeValue is TextShadowResolver
        ? themeValue.resolve(context)
        : themeValue;

    return resolvedValue ?? const Shadow();
  }
}

@immutable
class TextShadowResolver extends Shadow with WithTokenResolver<Shadow> {
  @override
  final BuildContextResolver<Shadow> resolve;

  const TextShadowResolver(this.resolve) : super();
}

@immutable
class TextShadowRef extends Shadow with TokenRef<TextShadowToken, Shadow> {
  @override
  final TextShadowToken token;

  const TextShadowRef(this.token) : super();

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextShadowRef && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

@immutable
class UtilityWithShadowTokens<T> {
  final T Function(Shadow value) _fn;

  const UtilityWithShadowTokens(T Function(Shadow value) fn) : _fn = fn;

  factory UtilityWithShadowTokens.shorthand(
    T Function(Shadow p1, [Shadow? p2, Shadow? p3, Shadow? p4]) fn,
  ) {
    return UtilityWithShadowTokens((Shadow value) => fn(value));
  }

  T call(Shadow value) => _fn(value);
}
