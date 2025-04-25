import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/data/models/category_model.dart';
import 'package:money_mate/data/models/invoice_item_model.dart';
import 'package:money_mate/data/models/transaction_model.dart';
import 'package:money_mate/domain/entities/message.dart';
import 'package:money_mate/shared/enums/message_type.dart';
import 'package:money_mate/shared/extensions/datetime_ext.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String user,
    required String conversation,
    required TransactionModel? transaction,
    required CategoryModel? category,
    required List<InvoiceItemModel>? invoiceItems,
    required String type,
    required String? content,
    required bool isSentByMe,
    required List<String>? assets,
    required DateTime createdAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

extension MessageModelX on MessageModel {
  Message toEntity() {
    return Message(
      id: id,
      user: user,
      conversation: conversation,
      transaction: transaction?.toEntity(),
      category: category?.toEntity(),
      type: MessageType.fromString(type),
      content: content,
      isSentByMe: isSentByMe,
      createdAt: createdAt.toUtcPlus7(),
      assets: assets ?? [],
      invoiceItems: invoiceItems?.map((e) => e.toEntity()).toList(),
    );
  }
}
