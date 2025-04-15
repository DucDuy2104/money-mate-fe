import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/core/service/langs/cubit/locale_cubit.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/core/service/langs/localization_service.dart';
import 'package:money_mate/domain/entities/localization.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/pages/category/bloc/categories_bloc.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/confirm_dialog.dart';
import 'package:money_mate/shared/components/single_choice_dialog.dart';
import 'package:money_mate/shared/constants/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  String _currency = 'VND';
  double _budgetWarningThreshold = 0.8;

  final List<String> _currencyOptions = ['VND', 'USD', 'EUR', 'JPY', 'GBP'];

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.setting),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(EvaIcons.menu2Outline, size: AppDimens.iconSize),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const AppDrawer(currentRoute: RouteNames.settings),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingSm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // General Settings
            _buildSectionHeader(s.general),
            _buildSettingItem(
              icon: Icons.language,
              title: s.language,
              subtitle: _getCurrentLocalization().name,
              onTap: () => _showLanguageDialog(context),
            ),
            _buildSettingItem(
              icon: Icons.currency_exchange,
              title: s.currencyUnit,
              subtitle: _currency,
              onTap: () => _showCurrencyDialog(),
            ),
            const Divider(height: 1),

            // Security
            _buildSectionHeader(s.security),
            _buildSettingItem(
              icon: Icons.lock,
              title: s.changePassword,
              onTap: () {
                context.pushNamed(RouteNames.updatePasswordName);
              },
            ),
            const Divider(height: 1),

            // Notifications
            _buildSectionHeader(s.notifications),
            _buildSwitchItem(
              icon: Icons.notifications,
              title: s.turnOnNotification,
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            _buildSettingItem(
              icon: Icons.warning_amber,
              title: s.budgetWarn,
              subtitle:
                  s.budgetWarnWhen((_budgetWarningThreshold * 100).toInt()),
              onTap: () => _showBudgetWarningDialog(),
              enabled: _notificationsEnabled,
            ),
            const Divider(height: 1),

            // About & Support
            _buildSectionHeader(s.information),
            _buildSettingItem(
              icon: Icons.info,
              title: s.aboutMoneyMate,
              subtitle: 'Phiên bản 1.0.0',
              onTap: () {
                // Hiển thị thông tin về ứng dụng
              },
            ),
            _buildSettingItem(
              icon: Icons.help,
              title: s.helpAndSupport,
              onTap: () {
                // Mở trang trợ giúp
              },
            ),
            AppDimens.spaceXs,
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.paddingMd,
          top: AppDimens.paddingMd,
          bottom: AppDimens.paddingXs),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    bool enabled = true,
    bool danger = false,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingMd,
        vertical: AppDimens.paddingXs,
      ),
      leading: Icon(
        icon,
        size: AppDimens.iconSize,
        color: danger
            ? Colors.red
            : (enabled ? Colors.grey[300] : Colors.grey[700]),
      ),
      title: Text(
        title,
        style: TextStyle(
          color:
              danger ? Colors.red : (enabled ? Colors.white : Colors.grey[700]),
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                color: enabled ? Colors.grey[400] : Colors.grey[800],
                fontSize: 13,
              ),
            )
          : null,
      enabled: enabled,
      onTap: enabled ? onTap : null,
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingMd,
        vertical: AppDimens.paddingXs,
      ),
      leading: Icon(icon, size: AppDimens.iconSize, color: Colors.grey[300]),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: subtitle != null
          ? Text(subtitle,
              style: TextStyle(color: Colors.grey[400], fontSize: 13))
          : null,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primaryColor,
      ),
    );
  }

  // Dialog để chọn đơn vị tiền tệ
  void _showCurrencyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title:
            const Text('Đơn vị tiền tệ', style: TextStyle(color: Colors.white)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: AppDimens.paddingSm),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _currencyOptions.length,
            itemBuilder: (context, index) {
              final currency = _currencyOptions[index];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.paddingMd),
                title:
                    Text(currency, style: const TextStyle(color: Colors.white)),
                trailing: _currency == currency
                    ? const Icon(Icons.check,
                        color: AppColors.primaryColor,
                        size: AppDimens.iconSizeSmall)
                    : null,
                onTap: () {
                  setState(() {
                    _currency = currency;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _showBudgetWarningDialog() {
    double tempThreshold = _budgetWarningThreshold;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Cảnh báo ngân sách',
            style: TextStyle(color: Colors.white)),
        contentPadding: const EdgeInsets.all(AppDimens.paddingMd),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Cảnh báo khi chi tiêu đạt ${(tempThreshold * 100).toInt()}% ngân sách',
                  style: TextStyle(color: Colors.grey[300]),
                ),
                AppDimens.spaceMd,
                Slider(
                  value: tempThreshold,
                  min: 0.5,
                  max: 1.0,
                  divisions: 10,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: Colors.grey[700],
                  label: '${(tempThreshold * 100).toInt()}%',
                  onChanged: (value) {
                    setState(() {
                      tempThreshold = value;
                    });
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('Lưu',
                style: TextStyle(color: AppColors.primaryColor)),
            onPressed: () {
              setState(() {
                _budgetWarningThreshold = tempThreshold;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

void _showLanguageDialog(BuildContext context) {
  final s = S.of(context);
  showDialog(
      context: context,
      builder: (context) => SingleChoiceDialog(
          title: s.selectLanguage,
          items: LocalizationService.supportedLocales,
          displayStringForItem: (localization) => localization.name,
          initialSelection: _getCurrentLocalization(),
          onSelect: (item) async {
            context.pop();
            showDialog(
                context: context,
                builder: (context) => ConfirmDialog(
                    title: s.restart,
                    message: s.restartConfirm,
                    onConfirm: () async {
                      BlocProvider.of<LocaleCubit>(context)
                          .changeLocale(item.locale);
                      Phoenix.rebirth(context);
                      context.goNamed(RouteNames.homeName);
                    }));
          }));
}

Localization _getCurrentLocalization() {
  return LocalizationService.supportedLocales.firstWhere((localization) =>
      localization.locale.languageCode ==
      getIt<LocalizationService>().getCurrentLocale().languageCode);
}
