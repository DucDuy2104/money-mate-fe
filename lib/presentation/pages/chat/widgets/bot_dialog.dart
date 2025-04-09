import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/bot.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class EditBotDialog extends StatefulWidget {
  final Bot bot;
  final Function(Bot) onUpdate;

  const EditBotDialog({
    super.key,
    required this.bot,
    required this.onUpdate,
  });

  @override
  State<EditBotDialog> createState() => _EditBotDialogState();
}

class _EditBotDialogState extends State<EditBotDialog> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  bool _isDataChanged = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.bot.name);
    _descriptionController =
        TextEditingController(text: widget.bot.description);

    // Add listeners to detect changes
    _nameController.addListener(_checkIfDataChanged);
    _descriptionController.addListener(_checkIfDataChanged);
  }

  void _checkIfDataChanged() {
    final nameChanged = _nameController.text != widget.bot.name;
    final descriptionChanged =
        _descriptionController.text != widget.bot.description;

    setState(() {
      _isDataChanged = nameChanged || descriptionChanged;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.colorsData(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.paddingLg),
        decoration: BoxDecoration(
          color: colors.dialogColor,
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          border: Border.all(color: const Color(0xFF2C2C2C)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thông tin bot',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w700)),
            AppDimens.spaceMd,
            _buildEditField(
              context,
              label: 'Tên',
              controller: _nameController,
            ),
            AppDimens.spaceMd,
            _buildEditField(
              context,
              label: 'Mô tả',
              controller: _descriptionController,
              maxLines: 3,
            ),
            AppDimens.spaceLg,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Huỷ'),
                ),
                AppDimens.spaceSm,
                ElevatedButton(
                  onPressed: _isDataChanged
                      ? () {
                          final updatedBot = Bot(
                            id: widget.bot.id,
                            name: _nameController.text,
                            description: _descriptionController.text,
                          );
                          widget.onUpdate(updatedBot);
                          Navigator.of(context).pop();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF66B2FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                    ),
                    disabledBackgroundColor:
                        const Color(0xFF66B2FF).withOpacity(0.3),
                    disabledForegroundColor: Colors.white70,
                  ),
                  child: const Text('Cập nhật'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium
        ),
        AppDimens.spaceXs,
        TextField(
          controller: controller,
          maxLines: maxLines,
        ),
      ],
    );
  }
}

void showUpdateBotDialog(
    BuildContext context, Bot bot, Function(Bot) onUpdate) {
  showDialog(
    context: context,
    builder: (context) => EditBotDialog(bot: bot, onUpdate: onUpdate),
  );
}
