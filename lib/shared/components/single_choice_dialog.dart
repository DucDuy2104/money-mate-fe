import 'package:flutter/material.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

/// A dialog that allows selecting a single item from a list.
///
/// Generic type T represents the data type of your list items.
class SingleChoiceDialog<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T) displayStringForItem;
  final void Function(T) onSelect;
  final T? initialSelection;

  const SingleChoiceDialog({
    super.key,
    required this.title,
    required this.items,
    required this.displayStringForItem,
    required this.onSelect,
    this.initialSelection,
  });

  @override
  State<SingleChoiceDialog<T>> createState() => _SingleChoiceDialogState<T>();
}

class _SingleChoiceDialogState<T> extends State<SingleChoiceDialog<T>> {
  T? _selectedItem;
  T? _initialItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialSelection;
    _initialItem = widget.initialSelection;
  }

  bool _isSelected(T item) {
    if (_selectedItem == null) return false;
    return _selectedItem == item;
  }

  void _selectItem(T item) {
    setState(() {
      _selectedItem = item;
    });
  }

  // Check if the current selection is different from the initial selection
  bool _hasChanged() {
    if (_initialItem == null && _selectedItem == null) return false;
    if (_initialItem == null || _selectedItem == null) return true;
    return _initialItem != _selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final colors = AppColors.colorsData(context);

    return Dialog(
      backgroundColor: colors.dialogColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingLg, vertical: AppDimens.paddingMd),
            color: AppColors.primaryColor,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: context.textTheme.titleLarge
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 24,
                ),
              ],
            ),
          ),

          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = _isSelected(item);

                return Material(
                  color: isSelected
                      ? AppColors.primaryColor.withOpacity(0.1)
                      : null,
                  child: InkWell(
                    onTap: () => _selectItem(item),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.paddingLg,
                        vertical: AppDimens.paddingMd,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: AppDimens.paddingMd,
                            height: AppDimens.paddingMd,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade400,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: isSelected
                                  ? Container(
                                      width: AppDimens.paddingSm * 1.5,
                                      height: AppDimens.paddingSm * 1.5,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          AppDimens.spaceSm,
                          Expanded(
                            child: Text(
                              widget.displayStringForItem(item),
                              style: context.textTheme.bodyLarge?.copyWith(
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                color:
                                    isSelected ? AppColors.primaryColor : null,
                              ),
                            ),
                          ),
                          // Show indicator for initial item
                          if (_initialItem != null && _initialItem == item)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: AppColors.primaryColor
                                        .withOpacity(0.3)),
                              ),
                              child: Text(
                                s.currentT,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(AppDimens.paddingMd),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    s.cancel,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
                AppDimens.spaceSm,
                ElevatedButton(
                  onPressed: (_selectedItem == null || !_hasChanged())
                      ? null
                      : () {
                          widget.onSelect(_selectedItem as T);
                        },
                  child: Text(
                    s.save,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
