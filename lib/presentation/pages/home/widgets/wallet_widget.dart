import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleWalletWidget extends StatefulWidget {
  final double balance;
  final Color textColor;
  final Color iconColor;
  final double fontSize;
  final String currencyLocale;

  const SimpleWalletWidget({
    Key? key,
    this.balance = 0,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.fontSize = 16,
    this.currencyLocale = 'vi_VN',
  }) : super(key: key);

  @override
  _SimpleWalletWidgetState createState() => _SimpleWalletWidgetState();
}

class _SimpleWalletWidgetState extends State<SimpleWalletWidget> {
  late double _balance;
  late NumberFormat _formatter;
  
  @override
  void initState() {
    super.initState();
    _balance = widget.balance;
    _formatter = NumberFormat.currency(
      locale: widget.currencyLocale,
      symbol: '₫',
      decimalDigits: 0,
    );
    _loadBalance();
  }
  
  Future<void> _loadBalance() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _balance = prefs.getDouble('wallet_balance') ?? widget.balance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.account_balance_wallet,
          color: widget.iconColor,
          size: widget.fontSize + 4,
        ),
        SizedBox(width: 8),
        Text(
          _formatter.format(_balance),
          style: TextStyle(
            color: widget.textColor,
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}