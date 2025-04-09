import 'package:flutter/material.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

class TypingIndicator extends StatefulWidget {
  final Color dotColor;
  final double dotSize;
  final Duration animationDuration;

  const TypingIndicator({
    Key? key,
    this.dotColor = Colors.grey,
    this.dotSize = 10.0,
    this.animationDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat(reverse: true);

    _animation1 = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    _animation2 = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 0.6, curve: Curves.easeInOut),
      ),
    );

    _animation3 = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDot(_animation1, 0),
          SizedBox(width: 4),
          _buildDot(_animation2, 1),
          SizedBox(width: 4),
          _buildDot(_animation3, 2),
        ],
      ),
    );
  }

  Widget _buildDot(Animation<double> animation, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.paddingXs),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.scale(
            scale: animation.value,
            child: Container(
              width: widget.dotSize,
              height: widget.dotSize,
              decoration: BoxDecoration(
                color: widget.dotColor,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}