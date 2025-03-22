import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScaffold extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color backgroundColor;
  final String? loadingMessage;
  final Color? loadingColor;

  const LoadingScaffold({
    super.key,
    required this.isLoading,
    required this.child,
    this.backgroundColor = Colors.black,
    this.loadingMessage,
    this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Main content
          child,
          
          // Loading overlay
          if (isLoading)
            Container(
              color: backgroundColor.withOpacity(0.8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Lottie animation as loading indicator
                    // SizedBox(
                    //   width: 150,
                    //   height: 150,
                    //   child: Lottie.asset(
                    //     'assets/animations/loading_animation.json',
                    //     frameRate: FrameRate.max,
                    //   ),
                    // ),
                    
                    // Alternative SpinKit animation if Lottie isn't available
                    // Uncomment below and comment out Lottie section if preferred
          
                    SpinKitFoldingCube(
                      color: loadingColor ?? Colors.white,
                      size: 50.0,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Optional loading message
                    if (loadingMessage != null)
                      Text(
                        loadingMessage!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: loadingColor ?? Theme.of(context).primaryColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}