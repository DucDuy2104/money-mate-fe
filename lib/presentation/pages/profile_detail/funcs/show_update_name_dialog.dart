import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

void showNameUpdateDialog(BuildContext context, String currentName) {
  final TextEditingController nameController =
      TextEditingController(text: currentName);

  void onUpdate(VoidCallback callback) {
    if (nameController.text.trim().length < 4) {
      AppToast.error(context, "Tên phải có tối thiểu 4 ký tự!");
      return;
    }
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(ProfileEvent.updateProfile(nameController.text.trim(), () {
      profileBloc.add(const ProfileEvent.reloadProfile());
      nameController.clear();
    }));

    callback();
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.paddingMd),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            border: Border.all(
              color: AppColors.primaryColor.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppDimens.radiusSm),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: AppDimens.iconSize,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  AppDimens.spaceMd,
                  Text(
                    'Cập nhật tên',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
              AppDimens.spaceMd,
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Nhập tên mới',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color(0xFF2A2A2A),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.paddingMd,
                      vertical: AppDimens.paddingMd),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 1.5),
                  ),
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: AppColors.primaryColor,
                  ),
                ),
                cursorColor: AppColors.primaryColor,
                autofocus: true,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Nút Hủy
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.paddingMd,
                            vertical: AppDimens.paddingMd),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppDimens.radiusSm),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                        ),
                        child: const Text(
                          'Hủy',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppDimens.spaceSm,
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        onUpdate(() {
                          Navigator.of(context).pop();
                        });
                      },
                      borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.paddingMd,
                            vertical: AppDimens.paddingMd),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.circular(AppDimens.radiusSm),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Lưu',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
