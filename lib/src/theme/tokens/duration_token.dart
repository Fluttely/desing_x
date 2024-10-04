part of 'package:design_x/design_x.dart';

class DurationToken extends MixToken<Duration> {
  const DurationToken(super.name);

  @override
  DurationRef call() => DurationRef(this);

  @override
  Duration resolve(BuildContext context) {
    final themeValue = XTheme.of(context).durations[this];
    assert(
      themeValue != null,
      'DurationToken $name is not defined in the theme and has no default value',
    );

    final resolvedValue = themeValue is DurationResolver ? themeValue.resolve(context) : themeValue;

    return resolvedValue ?? const Duration();
  }
}

@immutable
class DurationResolver extends Duration with WithTokenResolver<Duration> {
  @override
  final BuildContextResolver<Duration> resolve;

  const DurationResolver(this.resolve) : super();
}

@immutable
class DurationRef extends Duration with TokenRef<DurationToken> {
  @override
  final DurationToken token;

  const DurationRef(this.token) : super();

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DurationRef && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

@immutable
class UtilityWithDurationTokens<T> {
  final T Function(Duration value) _fn;

  const UtilityWithDurationTokens(T Function(Duration value) fn) : _fn = fn;

  factory UtilityWithDurationTokens.shorthand(
    T Function(Duration p1, [Duration? p2, Duration? p3, Duration? p4]) fn,
  ) {
    return UtilityWithDurationTokens((Duration value) => fn(value));
  }

  T call(Duration value) => _fn(value);
}
