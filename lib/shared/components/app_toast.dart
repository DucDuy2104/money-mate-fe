import 'package:flutter/material.dart';

enum ToastType { success, error, info, warning }

class AppToast {
  static final AppToast _instance = AppToast._internal();
  factory AppToast() => _instance;
  AppToast._internal();

  static OverlayEntry? _currentToast;
  static bool _isVisible = false;

  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 2),
    VoidCallback? onDismiss,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    // Hide any existing toast first
    if (_isVisible) {
      dismiss();
    }

    // Create overlay
    _isVisible = true;
    final overlay = Overlay.of(context);
    _currentToast = OverlayEntry(
      builder: (context) => _ToastOverlay(
        message: message,
        type: type,
        duration: duration,
        onDismiss: () {
          dismiss();
          onDismiss?.call();
        },
        actionLabel: actionLabel,
        onAction: onAction != null
            ? () {
                dismiss();
                onAction();
              }
            : null,
      ),
    );

    overlay.insert(_currentToast!);

    // Auto dismiss after duration if not an action toast
    if (actionLabel == null) {
      Future.delayed(duration, () {
        if (_isVisible) {
          dismiss();
          onDismiss?.call();
        }
      });
    }
  }

  static void dismiss() {
    if (_isVisible && _currentToast != null) {
      _currentToast!.remove();
      _currentToast = null;
      _isVisible = false;
    }
  }

  // Convenience methods
  static void success(BuildContext context, String message, {Duration? duration}) {
    show(context, message: message, type: ToastType.success, duration: duration ?? const Duration(seconds: 2));
  }

  static void error(BuildContext context, String message, {Duration? duration}) {
    show(context, message: message, type: ToastType.error, duration: duration ?? const Duration(seconds: 3));
  }

  static void info(BuildContext context, String message, {Duration? duration}) {
    show(context, message: message, type: ToastType.info, duration: duration ?? const Duration(seconds: 2));
  }

  static void warning(BuildContext context, String message, {Duration? duration}) {
    show(context, message: message, type: ToastType.warning, duration: duration ?? const Duration(seconds: 3));
  }
}

class _ToastOverlay extends StatefulWidget {
  final String message;
  final ToastType type;
  final Duration duration;
  final VoidCallback onDismiss;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _ToastOverlay({
    required this.message,
    required this.type,
    required this.duration,
    required this.onDismiss,
    this.actionLabel,
    this.onAction,
  });

  @override
  State<_ToastOverlay> createState() => _ToastOverlayState();
}

class _ToastOverlayState extends State<_ToastOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0.0, -0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getToastColor() {
    switch (widget.type) {
      case ToastType.success:
        return Colors.green.shade800;
      case ToastType.error:
        return Colors.red.shade800;
      case ToastType.warning:
        return Colors.orange.shade800;
      case ToastType.info:
      default:
        return Colors.blue.shade800;
    }
  }

  IconData _getToastIcon() {
    switch (widget.type) {
      case ToastType.success:
        return Icons.check_circle_outline_rounded;
      case ToastType.error:
        return Icons.error_outline_rounded;
      case ToastType.warning:
        return Icons.warning_amber_rounded;
      case ToastType.info:
      default:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return SafeArea(
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                elevation: 6,
                shadowColor: _getToastColor().withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                color: isDarkMode 
                    ? Color.lerp(_getToastColor(), Colors.black, 0.5)
                    : Color.lerp(_getToastColor(), Colors.white, 0.85),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth * 0.9,
                    minWidth: screenWidth * 0.5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getToastIcon(),
                          color: _getToastColor(),
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.message,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isDarkMode ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (widget.actionLabel != null) ...[
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: widget.onAction,
                                  child: Text(
                                    widget.actionLabel!,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: _getToastColor(),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        if (widget.actionLabel == null) ...[
                          const SizedBox(width: 8),
                          IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 18,
                              color: isDarkMode ? Colors.white60 : Colors.black54,
                            ),
                            onPressed: widget.onDismiss,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}