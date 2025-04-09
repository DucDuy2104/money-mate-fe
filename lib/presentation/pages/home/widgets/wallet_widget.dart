import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/shared/constants/constants.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';

class SimpleWalletWidget extends StatelessWidget {
  const SimpleWalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        double balance =
            BlocProvider.of<ProfileBloc>(context).getProfile()?.budget ?? 0;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.account_balance_wallet,
              size: AppDimens.iconSize
            ),
            AppDimens.spaceSm,
            Text(
              CurrencyHelper.formatCurrency(balance),
            ),
          ],
        );
      },
    );
  }
}
