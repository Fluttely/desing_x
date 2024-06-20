part of 'package:design_x/design_x.dart';

extension on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get color => Theme.of(this).colorScheme;
}

final materialXTheme = XThemeData(
  colors: {
    $material.colorScheme.primary:
        //  const Color.fromARGB(255, 255, 0, 0),
        ColorResolver((c) => c.color.primary),
    $material.colorScheme.secondary: ColorResolver((c) => c.color.secondary),
    $material.colorScheme.tertiary: ColorResolver((c) => c.color.tertiary),
    $material.colorScheme.surface: ColorResolver((c) => c.color.surface),
    $material.colorScheme.background: ColorResolver((c) => c.color.surface),
    $material.colorScheme.error: ColorResolver((c) => c.color.error),
    $material.colorScheme.onPrimary: ColorResolver((c) => c.color.onPrimary),
    $material.colorScheme.onSecondary: ColorResolver((c) => c.color.onSecondary),
    $material.colorScheme.onTertiary: ColorResolver((c) => c.color.onTertiary),
    $material.colorScheme.onSurface: ColorResolver((c) => c.color.onSurface),
    $material.colorScheme.onBackground: ColorResolver((c) => c.color.onSurface),
    $material.colorScheme.onError: ColorResolver((c) => c.color.onError),
  },
  textStyles: {
    $material.textTheme.displayLarge: TextStyleResolver((c) => c.text.displayLarge!),
    $material.textTheme.displayMedium: TextStyleResolver((c) => c.text.displayMedium!),
    $material.textTheme.displaySmall: TextStyleResolver((c) => c.text.displaySmall!),
    $material.textTheme.headlineLarge: TextStyleResolver((c) => c.text.headlineLarge!),
    $material.textTheme.headlineMedium: TextStyleResolver((c) => c.text.headlineMedium!),
    $material.textTheme.headlineSmall: TextStyleResolver((c) => c.text.headlineSmall!),
    $material.textTheme.titleLarge: TextStyleResolver((c) => c.text.titleLarge!),
    $material.textTheme.titleMedium: TextStyleResolver((c) => c.text.titleMedium!),
    $material.textTheme.titleSmall: TextStyleResolver((c) => c.text.titleSmall!),
    $material.textTheme.bodyLarge: TextStyleResolver((c) => c.text.bodyLarge!),
    $material.textTheme.bodyMedium: TextStyleResolver((c) => c.text.bodyMedium!),
    $material.textTheme.bodySmall: TextStyleResolver((c) => c.text.bodySmall!),
    $material.textTheme.labelLarge: TextStyleResolver((c) => c.text.labelLarge!),
    $material.textTheme.labelMedium: TextStyleResolver((c) => c.text.labelMedium!),
    $material.textTheme.labelSmall: TextStyleResolver((c) => c.text.labelSmall!),
    $material.textTheme.headline1: TextStyleResolver((c) => c.text.displayLarge!),
    $material.textTheme.headline2: TextStyleResolver((c) => c.text.displayMedium!),
    $material.textTheme.headline3: TextStyleResolver((c) => c.text.displaySmall!),
    $material.textTheme.headline4: TextStyleResolver((c) => c.text.headlineMedium!),
    $material.textTheme.headline5: TextStyleResolver((c) => c.text.headlineSmall!),
    $material.textTheme.headline6: TextStyleResolver((c) => c.text.titleLarge!),
    $material.textTheme.subtitle1: TextStyleResolver((c) => c.text.titleMedium!),
    $material.textTheme.subtitle2: TextStyleResolver((c) => c.text.titleSmall!),
    $material.textTheme.bodyText1: TextStyleResolver((c) => c.text.bodyLarge!),
    $material.textTheme.bodyText2: TextStyleResolver((c) => c.text.bodyMedium!),
    $material.textTheme.caption: TextStyleResolver((c) => c.text.bodySmall!),
    $material.textTheme.button: TextStyleResolver((c) => c.text.labelLarge!),
    $material.textTheme.overline: TextStyleResolver((c) => c.text.labelSmall!),
  },
);
