import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/home/widgets/transaction_item.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/extensions/datetime_ext.dart';
import 'package:money_mate/shared/extensions/transactions_ext.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final transactions = state.maybeMap(
            loaded: (value) =>
                value.data.transactions.toFilterTransactionCreatedAt(),
            orElse: () => [] as List<Transaction>);
        return Scaffold(
          appBar: AppBar(
            title: Text(s.transactions),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.paddingMd),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final transaction = transactions.elementAt(index);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (transaction.isShowTime) ...[
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: AppDimens.paddingSm),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.paddingSm,
                            vertical: AppDimens.paddingXs,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceVariant
                                .withOpacity(0.5),
                            borderRadius:
                                BorderRadius.circular(AppDimens.radiusMd),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                              const SizedBox(width: AppDimens.paddingXs),
                              Text(
                                transaction.createdAt.formatDateTime(),
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      TransactionItem(transaction: transaction),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    AppDimens.divider,
                itemCount: transactions.length),
          ),
        );
      },
    );
  }
}
