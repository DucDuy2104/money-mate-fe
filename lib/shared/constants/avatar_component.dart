import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:money_mate/shared/constants/app_assets.dart';
import 'package:money_mate/shared/constants/constants.dart';

class AvatarComponent extends StatelessWidget {
  final String? url;
  final double radius;
  final VoidCallback? onTap;
  final Color shadowColor;
  final double spreadRadius;
  final double blurRadius;

  const AvatarComponent({
    super.key,
    this.url,
    this.radius = 50,
    this.onTap,
    this.shadowColor = const Color(0xFF66B2FF),
    this.spreadRadius = 2,
    this.blurRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.3),
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: AppColors.primaryColor,
          child: CircleAvatar(
            radius: radius - 1,
            child: ClipOval(
              child: url == null || url!.isEmpty
                  ? Image.asset(
                      AppAssets.tempAvatar,
                      fit: BoxFit.cover,
                      width: radius * 2 - 4,
                      height: radius * 2 - 4,
                    )
                  : CachedNetworkImage(
                      imageUrl: url!,
                      fit: BoxFit.cover,
                      width: radius * 2 - 4,
                      height: radius * 2 - 4,
                      errorWidget: (context, url, error) => Image.asset(
                        AppAssets.tempAvatar,
                        fit: BoxFit.cover,
                        width: radius * 2 - 4,
                        height: radius * 2 - 4,
                      ),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
