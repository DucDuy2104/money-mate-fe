import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:money_mate/shared/constants/app_constants.dart';
import 'package:timeago/timeago.dart' as timeago;

abstract class StringHelper {
  static final _formatCurrency = NumberFormat.simpleCurrency(
    decimalDigits: 0,
  );

  static String capitalizeFirstLetter(String? s) {
    if (s == null || s.isEmpty) return '';
    return s[0].toUpperCase() + s.substring(1);
  }

  static String capitalizeWords(String? s) {
    if (s == null || s.isEmpty) return '';
    return s.split(' ').map(capitalizeFirstLetter).join(' ');
  }

  static String toCurrencyString(dynamic value) {
    final price = num.tryParse(value?.toString() ?? "0");
    return _formatCurrency.format(price);
  }

  static String getTimeAgo(DateTime time) {
    return timeago.format(time, locale: 'vi');
  }

  static void getTimeAgoVi() {
    timeago.setLocaleMessages('vi', ViMessages());
  }

  static dynamic getMessage(dynamic exception) {
    String defaultMsg = 'Unknown Error Occurred';
    dynamic message = '';

    if (exception == null) {
      message = defaultMsg;
    } else if (exception is PlatformException) {
      message = exception.message ?? defaultMsg;
    } else if (exception is Map) {
      message = exception.values.map((value) {
        if (value is Map && value.containsKey('msg')) {
          return value['msg'];
        } else {
          return getMessage(value);
        }
      }).join('\n');
    } else if (exception is List) {
      message = exception.map(getMessage).join('\n');
    } else {
      message = exception;
      // const pattern = 'Exception: ';
      // if (message.startsWith(pattern)) {
      //   message = message.substring(pattern.length);
      // }
    }
    return message;
  }

  static String toName(List<dynamic> list) {
    final formattedList = list.where((item) {
      return item is String && item.isNotEmpty;
    }).map((item) {
      final words = item.split(' ');
      final formattedWords = words.map((word) {
        if (word.isNotEmpty) {
          final firstLetter = word[0].toUpperCase();
          final restOfWord = word.substring(1).toLowerCase();
          return '$firstLetter$restOfWord';
        }
        return '';
      }).join(' ');

      return formattedWords;
    }).toList();

    return formattedList.join(', ');
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat().add_yMMMd().format(dateTime);
  }

  static String formatDateSmall(DateTime dateTime) {
    return DateFormat().add_MMMd().format(dateTime);
  }

  static String formatDateHour(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime.toLocal());
  }

  static String formatCurrencySmall(num? value) {
    if (value == null || value == 0) return '0';
    return NumberFormat.compactSimpleCurrency(
      locale: 'en_US',
      decimalDigits: 0,
    ).format(value);
  }

  static String? formatDateTimeRange(DateTimeRange? range) {
    if (range == null) return null;
    final dateFormat = DateFormat(AppConstants.formatDateDisplay);
    return '${dateFormat.format(range.start)}|${dateFormat.format(range.end)}';
  }

  static Future<String> imageBase64String(File file) async {
    return 'data:image/pdf/docs;base64,${base64Encode(await file.readAsBytes())}';
  }
}

class ViMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'trước';
  @override
  String suffixFromNow() => 'từ bây giờ';
  @override
  String lessThanOneMinute(int seconds) => 'vài giây';
  @override
  String aboutAMinute(int minutes) => 'khoảng 1 phút';
  @override
  String minutes(int minutes) => '$minutes phút';
  @override
  String aboutAnHour(int minutes) => 'khoảng 1 giờ';
  @override
  String hours(int hours) => '$hours giờ';
  @override
  String aDay(int hours) => 'một ngày';
  @override
  String days(int days) => '$days ngày';
  @override
  String aboutAMonth(int days) => 'khoảng 1 tháng';
  @override
  String months(int months) => '$months tháng';
  @override
  String aboutAYear(int year) => 'khoảng 1 năm';
  @override
  String years(int years) => '$years năm';
  @override
  String wordSeparator() => ' ';
}
