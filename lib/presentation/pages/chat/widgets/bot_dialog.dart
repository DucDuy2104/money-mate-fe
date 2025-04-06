import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/bot.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

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
    _descriptionController = TextEditingController(text: widget.bot.description);
    
    // Add listeners to detect changes
    _nameController.addListener(_checkIfDataChanged);
    _descriptionController.addListener(_checkIfDataChanged);
  }

  void _checkIfDataChanged() {
    final nameChanged = _nameController.text != widget.bot.name;
    final descriptionChanged = _descriptionController.text != widget.bot.description;
    
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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.paddingLarge),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
          border: Border.all(color: const Color(0xFF2C2C2C)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thông tin bot',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            AppDimens.spaceMedium,
            _buildEditField(
              context,
              label: 'Tên',
              controller: _nameController,
            ),
            AppDimens.spaceMedium,
            _buildEditField(
              context,
              label: 'Mô tả',
              controller: _descriptionController,
              maxLines: 3,
            ),
            AppDimens.spaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white70,
                  ),
                  child: const Text('Huỷ'),
                ),
                AppDimens.spaceSmall,
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
                      borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
                    ),
                    disabledBackgroundColor: const Color(0xFF66B2FF).withOpacity(0.3),
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
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.white70,
              ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingSmall,
              vertical: AppDimens.paddingSmall,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
              borderSide: const BorderSide(color: Color(0xFF3D3D3D)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
              borderSide: const BorderSide(color: Color(0xFF66B2FF), width: 2),
            ),
            filled: true,
            fillColor: const Color(0xFF2A2A2A),
          ),
        ),
      ],
    );
  }
}

void showUpdateBotDialog(BuildContext context, Bot bot, Function(Bot) onUpdate) {
  showDialog(
    context: context,
    builder: (context) => EditBotDialog(bot: bot, onUpdate: onUpdate),
  );
}