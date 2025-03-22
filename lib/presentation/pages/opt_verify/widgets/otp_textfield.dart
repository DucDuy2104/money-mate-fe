import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class OtpTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String)? onChanged;
  final Function()? onBackspacePressed;
  final TextStyle? style;

  const OtpTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.onBackspacePressed,
    this.style,
  }) : super(key: key);

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTextChange);
    super.dispose();
  }

  String _previousText = '';

  void _handleTextChange() {
    String currentText = widget.controller.text;
    
    if (currentText.isEmpty && _previousText.isNotEmpty) {
      widget.onBackspacePressed?.call();
    }
    
    _previousText = currentText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Focus(
        onKeyEvent: (FocusNode node, KeyEvent event) {
          if (event is KeyDownEvent && 
              event.logicalKey == LogicalKeyboardKey.backspace &&
              widget.controller.text.isEmpty) {
            widget.onBackspacePressed?.call();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: widget.style ?? context.textTheme.headlineMedium,
          enableInteractiveSelection: false,
          decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
            ),
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: widget.onChanged,
          onEditingComplete: () {},
          onTap: () {
          },
        ),
      ),
    );
  }
}