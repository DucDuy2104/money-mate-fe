import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Scale animation for logo
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    // Fade animation for background
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();

    // Navigate to the next screen after animation
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF121212),
              Color(0xFF1E1E2C),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Decorative elements (circles and squares)
            Positioned(
              top: AppDimens.paddingLarge * 2,
              left: AppDimens.padding,
              child: FadeIn(
                delay: const Duration(milliseconds: 300),
                child: Container(
                  width: AppDimens.iconSizeSmall + AppDimens.paddingSmall,
                  height: AppDimens.iconSizeSmall + AppDimens.paddingSmall,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: AppDimens.paddingLarge * 5,
              right: AppDimens.paddingLarge,
              child: FadeIn(
                delay: const Duration(milliseconds: 500),
                child: Container(
                  width: AppDimens.iconSize + AppDimens.paddingSmall,
                  height: AppDimens.iconSize + AppDimens.paddingSmall,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                  ),
                ),
              ),
            ),
            Positioned(
              top: AppDimens.paddingLarge * 6,
              right: AppDimens.paddingLarge * 2,
              child: FadeIn(
                delay: const Duration(milliseconds: 400),
                child: Container(
                  width: AppDimens.iconSizeSmall,
                  height: AppDimens.iconSizeSmall,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            // Main content
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ZoomIn(
                        child: Image.asset(
                          'assets/images/app_logo.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                      AppDimens.spaceLarge,
                      FadeInUp(
                        child: Text(
                          'MoneyMate',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: [
                                  AppColors.primaryColor,
                                  AppColors.primaryColor.withOpacity(0.8),
                                  AppColors.primaryColor,
                                ],
                              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      AppDimens.spaceMedium,
                      FadeInUp(
                        delay: const Duration(milliseconds: 300),
                        child: Text(
                          'Smart finances, brighter future',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor.withOpacity(0.7),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}