import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/shared/components/app_toast.dart';

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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            border: Border.all(
              color: const Color(0xFF66B2FF).withOpacity(0.3),
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
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 18,
                      color: Color(0xFF66B2FF),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Cập nhật tên',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Nhập tên mới',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color(0xFF2A2A2A),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Color(0xFF66B2FF), width: 1.5),
                  ),
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Color(0xFF66B2FF),
                  ),
                ),
                cursorColor: const Color(0xFF66B2FF),
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
                      borderRadius: BorderRadius.circular(8),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
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
                  const SizedBox(width: 12),
                  // Nút Lưu
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        onUpdate(() {
                          Navigator.of(context).pop();
                        });
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF66B2FF),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF66B2FF).withOpacity(0.3),
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
