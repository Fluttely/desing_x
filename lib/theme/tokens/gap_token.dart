// part of 'package:design_x/design_x.dart';

// class GapToken extends MixToken<Gap> {
//   const GapToken(super.name);

//   @override
//   GapRef call() => GapRef(this);

//   @override
//   Gap resolve(BuildContext context) {
//     final themeValue = XTheme.of(context).gaps[this];
//     assert(
//       themeValue != null,
//       'GapToken $name is not defined in the theme and has no default value',
//     );

//     final resolvedValue = themeValue is GapResolver ? themeValue.resolve(context) : themeValue;

//     return resolvedValue ?? const Gap(0.0);
//   }
// }

// @immutable
// class GapResolver extends Gap with WithTokenResolver<Gap> {
//   @override
//   final BuildContextResolver<Gap> resolve;

//   const GapResolver(this.resolve, {super.key}) : super(0);
// }

// @immutable
// class GapRef extends Gap with TokenRef<GapToken, Gap> {
//   @override
//   final GapToken token;

//   const GapRef(this.token, {super.key}) : super(0);

//   @override
//   operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is GapRef && other.token == token;
//   }

//   @override
//   int get hashCode => token.hashCode;
// }

// @immutable
// class UtilityWithGapTokens<T> {
//   final T Function(Gap value) _fn;

//   const UtilityWithGapTokens(T Function(Gap value) fn) : _fn = fn;

//   factory UtilityWithGapTokens.shorthand(
//     T Function(Gap p1, [Gap? p2, Gap? p3, Gap? p4]) fn,
//   ) {
//     return UtilityWithGapTokens((Gap value) => fn(value));
//   }

//   T call(Gap value) => _fn(value);
// }
