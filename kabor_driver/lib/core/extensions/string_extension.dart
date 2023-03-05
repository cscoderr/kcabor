// ignore_for_file: public_member_api_docs

import 'package:intl/intl.dart';

extension StringX on String {
  String get ngnSymbol => '₦';
  String get ngn => 'NGN';
  String get svg => 'assets/images/svg/$this.svg';
  String get png => 'assets/images/png/$this.png';
  String get capitalizeFirst => isNotEmpty && [0].isNotEmpty
      ? '${this[0].toUpperCase()}${substring(1)}'
      : '';
  String get formatMoney =>
      ngn + NumberFormat.currency(symbol: '').format(double.parse(this));
  String get formatNumber => NumberFormat.currency(symbol: '', decimalDigits: 0)
      .format(double.parse(this));
  String get capitalize =>
      trim().split(' ').map((e) => e.capitalizeFirst).join(' ');

  String get formatDate =>
      '${DateFormat.d().format(DateTime.parse(this))}/${DateFormat.M().format(DateTime.parse(this))}/${DateFormat.y().format(DateTime.parse(this))}';

  String get formatFbDate {
    final splitedDate = split('/');
    return splitedDate.reversed.join('-');
  }

  String get formatTime => DateFormat.jm().format(DateTime.parse(this));

  bool get isAlphanumeric =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\?\$&*~]).{8,}$')
          .hasMatch(this);
}
