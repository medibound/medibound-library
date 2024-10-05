import 'dart:math';


extension DoubleExtension on double {
  /// Rounds the double to a total of `totalDigits` significant digits.
  String roundedToString({int totalDigits = 3}) {
    double roundedValue = rounded(totalDigits: totalDigits);
    if (roundedValue == roundedValue.toInt()) {
      // It's effectively an integer, so return as integer string
      return roundedValue.toInt().toString();
    } else {
      // It has a fractional part, so return with fractional part
      // Note: Adjust the format as needed to limit the total digits, including decimal points.
      return roundedValue.toStringAsFixed(1);
    }
  }

  /// Rounds the Double to a total of `totalDigits` significant digits.
  double rounded({int totalDigits = 3}) {
    int digitCount = (this == 0 ? 0 : 1 + log(this.abs()) / ln10).floor();
    int decimalPlaces = max(0, totalDigits - digitCount);

    // Use this factor to round the number.
    double divisor =
        pow(10.0, decimalPlaces.toDouble()).toDouble(); // Cast to double
    return (this * divisor).round() / divisor;
  }
}