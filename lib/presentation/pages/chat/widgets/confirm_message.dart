import 'package:flutter/material.dart';
import 'dart:async';

class TransactionInfoMessage extends StatefulWidget {
  final double amount;
  final String category;
  final VoidCallback onCancel;

  const TransactionInfoMessage({
    super.key,
    required this.amount,
    required this.category,
    required this.onCancel,
  });

  @override
  _TransactionInfoMessageState createState() => _TransactionInfoMessageState();
}

class _TransactionInfoMessageState extends State<TransactionInfoMessage> {
  int _remainingSeconds = 5;
  late Timer _timer;
  bool _isCountdownComplete = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
        setState(() {
          _isCountdownComplete = true;
        });
        widget.onCancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Transaction Details
          Row(
            children: [
              // Checkmark icon (visible only when countdown is complete)
              if (_isCountdownComplete)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.check_circle, 
                    color: Colors.teal[700], 
                    size: 24
                  ),
                ),
              
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.category_outlined, 
                  color: Colors.teal[700], 
                  size: 20
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.category,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Expense Category',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.amount >= 0 
                    ? Colors.teal[50] 
                    : Colors.red[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${widget.amount >= 0 ? '+' : '-'}${widget.amount.abs().toStringAsFixed(0)}đ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: widget.amount >= 0 ? Colors.teal[800] : Colors.red[800],
                  ),
                ),
              ),
            ],
          ),
          
          // Cancel Button with Countdown (only shown before countdown completes)
          if (!_isCountdownComplete)
            Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: widget.onCancel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Cancel', style: TextStyle(fontSize: 14)),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '$_remainingSeconds',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}