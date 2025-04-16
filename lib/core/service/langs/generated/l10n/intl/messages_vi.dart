// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(name, budget) =>
      "Thêm danh mục ${name} với ngân sách ${budget} ( Tin nhắn tự động )";

  static String m1(name) => "Thêm ${name}";

  static String m2(percent) => "Khi chi tiêu đạt ${percent}% ngân sách";

  static String m3(selectedCount) =>
      "Đã chọn ${selectedCount} danh mục. Nhấn vào danh mục để thêm hoặc cập nhật hạn mức";

  static String m4(unit) => "Ngân sách hiện tại (${unit})";

  static String m5(email) => "Chúng tôi đã gửi mã đến ${email}s";

  static String m6(time) => "Gửi mã lại sau ${time}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutMoneyMate": MessageLookupByLibrary.simpleMessage("Về Money Mate"),
    "account": MessageLookupByLibrary.simpleMessage("Tài khoản"),
    "accountStatus": MessageLookupByLibrary.simpleMessage(
      "Trạng thái tài khoản",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Đang hoạt đồng"),
    "add": MessageLookupByLibrary.simpleMessage("Thêm"),
    "addBudgetCategoryAutoMessage": m0,
    "addCategoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Thao tác này sẽ thêm danh mục vào kế hoạch ngân sách của bạn",
    ),
    "addName": m1,
    "admin": MessageLookupByLibrary.simpleMessage("Quản trị viên"),
    "backupData": MessageLookupByLibrary.simpleMessage("Sao lưu dữ liệu"),
    "balance": MessageLookupByLibrary.simpleMessage("Số dư"),
    "budget": MessageLookupByLibrary.simpleMessage("Ngân sách"),
    "budgetMustBeNum": MessageLookupByLibrary.simpleMessage(
      "Ngân sách phải là số",
    ),
    "budgetWarn": MessageLookupByLibrary.simpleMessage("Cảnh báo ngân sách"),
    "budgetWarnWhen": m2,
    "cameraPermissionMessage": MessageLookupByLibrary.simpleMessage(
      "Để chụp ảnh, vui lòng bật quyền truy cập máy ảnh trong Cài đặt.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Huỷ"),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Hủy"),
    "cancelConfirm": MessageLookupByLibrary.simpleMessage("Xác nhận huỷ bỏ"),
    "cancelTransaction": MessageLookupByLibrary.simpleMessage("Huỷ bỏ"),
    "cancelTransactionConfirm": MessageLookupByLibrary.simpleMessage(
      "Bạn có chắc chắn muốn huỷ giao dịch này?",
    ),
    "categories": MessageLookupByLibrary.simpleMessage("Danh mục"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Đổi mật khẩu"),
    "changePasswordDescription": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập mật khẩu hiện tại và mật khẩu mới để cập nhật",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
    "confirmNewPassword": MessageLookupByLibrary.simpleMessage(
      "Nhập lại mật khẩu mới",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "Nhập lại mật khẩu",
    ),
    "countSelected": m3,
    "createdAt": MessageLookupByLibrary.simpleMessage("Ngày tạo"),
    "currencyUnit": MessageLookupByLibrary.simpleMessage("Đơn vị tiền tệ"),
    "currentBudget": m4,
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "Mật khẩu hiện tại",
    ),
    "currentT": MessageLookupByLibrary.simpleMessage("Hiện tại"),
    "data": MessageLookupByLibrary.simpleMessage("Dữ liệu"),
    "delete": MessageLookupByLibrary.simpleMessage("Xoá bỏ"),
    "deleteData": MessageLookupByLibrary.simpleMessage("Xoá tất cả dữ liệu"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailToNext": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập email đã đăng ký để tiếp tục",
    ),
    "emptyFieldError": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập đủ thông tin",
    ),
    "enableAccessTitle": MessageLookupByLibrary.simpleMessage(
      "Cho phép truy cập",
    ),
    "enterBudget": MessageLookupByLibrary.simpleMessage("Nhập ngân sách"),
    "enterName": MessageLookupByLibrary.simpleMessage("Nhập tên"),
    "enterOtp": MessageLookupByLibrary.simpleMessage("Nhập mã OTP"),
    "errorOpenSettings": MessageLookupByLibrary.simpleMessage(
      "Không thể mở cài đặt.",
    ),
    "expense": MessageLookupByLibrary.simpleMessage("Chi tiêu"),
    "expenseByCategory": MessageLookupByLibrary.simpleMessage(
      "Chi tiêu theo danh mục",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Quên mật khẩu"),
    "general": MessageLookupByLibrary.simpleMessage("Chung"),
    "genericPermissionMessage": MessageLookupByLibrary.simpleMessage(
      "Để sử dụng tính năng này, vui lòng bật quyền trong Cài đặt.",
    ),
    "getCategoriesError": MessageLookupByLibrary.simpleMessage(
      "Lỗi khi lấy danh mục, vui lòng thử lại",
    ),
    "haveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Bạn đã có tài khoản?",
    ),
    "helpAndSupport": MessageLookupByLibrary.simpleMessage(
      "Trợ giúp và hỗ trợ",
    ),
    "income": MessageLookupByLibrary.simpleMessage("Thu nhập"),
    "information": MessageLookupByLibrary.simpleMessage("Thông tin"),
    "lackOfOTP": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập đủ 4 số OTP",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
    "lastUpdatedAt": MessageLookupByLibrary.simpleMessage("Lần cuối cập nhật"),
    "locationPermissionMessageIos": MessageLookupByLibrary.simpleMessage(
      "Bạn đã từ chối quyền truy cập vị trí, điều này cần thiết để thực hiện thao tác đã chọn. Vui lòng cấp quyền từ phần cài đặt ứng dụng.",
    ),
    "locationPermissionTitle": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu quyền truy cập vị trí",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
    "loginNow": MessageLookupByLibrary.simpleMessage("Đăng nhập ngay"),
    "loginWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Đăng nhập với Google",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
    "logoutConfirm": MessageLookupByLibrary.simpleMessage("Xác nhận đăng xuất"),
    "logoutQuestion": MessageLookupByLibrary.simpleMessage(
      "Bạn có chắc chắn muốn đăng xuất?",
    ),
    "name": MessageLookupByLibrary.simpleMessage("Tên của bạn"),
    "newPassword": MessageLookupByLibrary.simpleMessage("Mật khẩu mới"),
    "next": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
    "noNotification": MessageLookupByLibrary.simpleMessage(
      "Bạn không có thông báo nào",
    ),
    "noTransactions": MessageLookupByLibrary.simpleMessage(
      "Bạn chưa có dữ liệu chi tiêu nào",
    ),
    "notActive": MessageLookupByLibrary.simpleMessage("Không hoạt động"),
    "notHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Bạn chưa có tài khoản?",
    ),
    "notReceivedOtp": MessageLookupByLibrary.simpleMessage(
      "Không nhận được mã?",
    ),
    "notificationPermissionMessage": MessageLookupByLibrary.simpleMessage(
      "Để nhận thông báo, vui lòng bật quyền truy cập thông báo trong Cài đặt.",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Thông báo"),
    "okButton": MessageLookupByLibrary.simpleMessage("Đồng ý"),
    "otpAlreadySent": MessageLookupByLibrary.simpleMessage(
      "Mã OTP đã được gửi đến bạn",
    ),
    "otpAlreadySentTo": m5,
    "ownCategories": MessageLookupByLibrary.simpleMessage("Danh mục tiêu dùng"),
    "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
    "passwordLengthLessThanRegulation": MessageLookupByLibrary.simpleMessage(
      "Mật khẩu phải có ít nhất 6 ký tự",
    ),
    "passwordNotMatch": MessageLookupByLibrary.simpleMessage(
      "Mật khẩu không trùng khớp",
    ),
    "permissionDeniedTitle": MessageLookupByLibrary.simpleMessage(
      "Đã từ chối quyền",
    ),
    "photosPermissionMessage": MessageLookupByLibrary.simpleMessage(
      "Để chọn ảnh, vui lòng bật quyền truy cập thư viện ảnh trong Cài đặt.",
    ),
    "recentTransactions": MessageLookupByLibrary.simpleMessage(
      "Chi tiêu gần đây",
    ),
    "record": MessageLookupByLibrary.simpleMessage("Hồ sơ người dùng"),
    "register": MessageLookupByLibrary.simpleMessage("Đăng ký"),
    "registerNow": MessageLookupByLibrary.simpleMessage("Đăng ký ngay"),
    "registerWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Đăng ký với Google",
    ),
    "reports": MessageLookupByLibrary.simpleMessage("Báo cáo"),
    "resend": MessageLookupByLibrary.simpleMessage("Gửi lại"),
    "resendAfter": m6,
    "resetPassword": MessageLookupByLibrary.simpleMessage("Đặt lại mật khẩu"),
    "resetPasswordPlease": MessageLookupByLibrary.simpleMessage(
      "Vui lòng đặt lại mật khẩu mới cho tài khoản của bạn",
    ),
    "resetPasswordSuccess": MessageLookupByLibrary.simpleMessage(
      "Đặt lại mật khẩu thành công",
    ),
    "restart": MessageLookupByLibrary.simpleMessage("Khởi động lại"),
    "restartConfirm": MessageLookupByLibrary.simpleMessage(
      "Bạn có chắc chắn muốn khởi động lại ứng dụng?",
    ),
    "restore": MessageLookupByLibrary.simpleMessage("Khôi phục"),
    "restoreData": MessageLookupByLibrary.simpleMessage("Khôi phục dữ liệu"),
    "restoreTransaction": MessageLookupByLibrary.simpleMessage(
      "Khôi phục giao dịch",
    ),
    "restoreTransactionConfirm": MessageLookupByLibrary.simpleMessage(
      "Bạn có chắc chắn muốn khôi phục giao dịch này?",
    ),
    "returnToLogin": MessageLookupByLibrary.simpleMessage("Quay lại đăng nhập"),
    "role": MessageLookupByLibrary.simpleMessage("Vai trò"),
    "save": MessageLookupByLibrary.simpleMessage("Lưu"),
    "security": MessageLookupByLibrary.simpleMessage("Bảo mật"),
    "selectCategories": MessageLookupByLibrary.simpleMessage("Chọn danh mục"),
    "selectLanguage": MessageLookupByLibrary.simpleMessage("Chọn ngôn ngữ"),
    "selectLessMinExpenseCategoriesError": MessageLookupByLibrary.simpleMessage(
      "Bạn phải chọn ít nhất 3 danh mục chi tiêu",
    ),
    "selectLessMinExpenseIncomeError": MessageLookupByLibrary.simpleMessage(
      "Bạn phải chọn ít nhất 1 danh mục thu nhập",
    ),
    "selectedCategoriesDescription": MessageLookupByLibrary.simpleMessage(
      "Chọn các danh mục phù hợp với thu chi của bạn (tối thiểu 3 danh mục chi tiêu và 1 danh mục thu nhập)",
    ),
    "sendOTPError": MessageLookupByLibrary.simpleMessage(
      "Lỗi khi gửi OTP, vui lòng thử lại",
    ),
    "setBudget": MessageLookupByLibrary.simpleMessage("Đặt ngân sách"),
    "setUpCategoriesError": MessageLookupByLibrary.simpleMessage(
      "Lỗi khi cài đặt danh mục, vui lòng thử lại",
    ),
    "setting": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "settingsButton": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "setup": MessageLookupByLibrary.simpleMessage("Thiết lập tài khoản"),
    "setupPlease": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập thêm thông tin (Tên và ngân sách hiện tại của bạn) để thiết lập tài khoản",
    ),
    "startUse": MessageLookupByLibrary.simpleMessage("Bắt đầu sử dụng"),
    "thisMonth": MessageLookupByLibrary.simpleMessage("Tháng này"),
    "today": MessageLookupByLibrary.simpleMessage("Hôm nay"),
    "total": MessageLookupByLibrary.simpleMessage("Tổng"),
    "transactions": MessageLookupByLibrary.simpleMessage("Giao dịch"),
    "turnOnNotification": MessageLookupByLibrary.simpleMessage("Bật thông báo"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Đã có lỗi xảy ra"),
    "update": MessageLookupByLibrary.simpleMessage("Cập nhật"),
    "updateName": MessageLookupByLibrary.simpleMessage("Cập nhật tên"),
    "updatePassSuccess": MessageLookupByLibrary.simpleMessage(
      "Cập nhật mật khẩu thành công",
    ),
    "user": MessageLookupByLibrary.simpleMessage("Người dùng"),
    "userNameMinLengthError": MessageLookupByLibrary.simpleMessage(
      "Tên phải có tối thiểu 4 ký tự",
    ),
    "verified": MessageLookupByLibrary.simpleMessage("Xác thực thành công"),
    "verifyingOtp": MessageLookupByLibrary.simpleMessage("Mã đang được gửi..."),
    "waitingForResending": MessageLookupByLibrary.simpleMessage(
      "Vui lòng đợi trước khi gửi lại mã OTP",
    ),
    "whatBudgetYouSpent": MessageLookupByLibrary.simpleMessage(
      "Bạn vừa chi tiền vào điều gì?",
    ),
  };
}
