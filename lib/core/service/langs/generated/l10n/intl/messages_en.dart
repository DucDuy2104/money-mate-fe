// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(name, budget) =>
      "Added category ${name} with a budget of ${budget} (Automated message)";

  static String m1(name) => "Add ${name}";

  static String m2(percent) =>
      "When spending reaches ${percent}% of the budget";

  static String m3(selectedCount) =>
      "${selectedCount} categories selected. Tap a category to add or update its budget";

  static String m4(unit) => "Current budget (${unit})";

  static String m5(email) => "We have sent the code to ${email}";

  static String m6(time) => "Resend after ${time}s";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutMoneyMate": MessageLookupByLibrary.simpleMessage("About Money Mate"),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "accountStatus": MessageLookupByLibrary.simpleMessage("Account status"),
    "active": MessageLookupByLibrary.simpleMessage("Active"),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addBudgetCategoryAutoMessage": m0,
    "addCategoryConfirm": MessageLookupByLibrary.simpleMessage(
      "This action will add the category to your budget plan",
    ),
    "addName": m1,
    "admin": MessageLookupByLibrary.simpleMessage("Admin"),
    "backupData": MessageLookupByLibrary.simpleMessage("Backup data"),
    "balance": MessageLookupByLibrary.simpleMessage("Balance"),
    "budget": MessageLookupByLibrary.simpleMessage("Budget"),
    "budgetMustBeNum": MessageLookupByLibrary.simpleMessage(
      "Budget must be a number",
    ),
    "budgetWarn": MessageLookupByLibrary.simpleMessage("Budget Warning"),
    "budgetWarnWhen": m2,
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelConfirm": MessageLookupByLibrary.simpleMessage(
      "Confirm cancellation",
    ),
    "cancelTransaction": MessageLookupByLibrary.simpleMessage("Cancel trans"),
    "cancelTransactionConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to cancel this transaction?",
    ),
    "categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change password"),
    "changePasswordDescription": MessageLookupByLibrary.simpleMessage(
      "Please enter your current password and a new one to update",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmNewPassword": MessageLookupByLibrary.simpleMessage(
      "Confirm New Password",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm password"),
    "countSelected": m3,
    "createdAt": MessageLookupByLibrary.simpleMessage("Created at"),
    "currencyUnit": MessageLookupByLibrary.simpleMessage("Currency unit"),
    "currentBudget": m4,
    "currentPassword": MessageLookupByLibrary.simpleMessage("Current Password"),
    "currentT": MessageLookupByLibrary.simpleMessage("Current"),
    "data": MessageLookupByLibrary.simpleMessage("Data"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteData": MessageLookupByLibrary.simpleMessage("Delete all data"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailToNext": MessageLookupByLibrary.simpleMessage(
      "Please enter your registered email to continue",
    ),
    "emptyFieldError": MessageLookupByLibrary.simpleMessage(
      "Please fill in all required fields",
    ),
    "enterBudget": MessageLookupByLibrary.simpleMessage("Enter budget"),
    "enterName": MessageLookupByLibrary.simpleMessage("Enter Name"),
    "enterOtp": MessageLookupByLibrary.simpleMessage("Enter OTP"),
    "expense": MessageLookupByLibrary.simpleMessage("Expense"),
    "expenseByCategory": MessageLookupByLibrary.simpleMessage(
      "Expenses by Category",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "getCategoriesError": MessageLookupByLibrary.simpleMessage(
      "Failed to fetch categories, please try again",
    ),
    "haveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "helpAndSupport": MessageLookupByLibrary.simpleMessage("Help and support"),
    "income": MessageLookupByLibrary.simpleMessage("Income"),
    "information": MessageLookupByLibrary.simpleMessage("Information"),
    "lackOfOTP": MessageLookupByLibrary.simpleMessage(
      "Please enter all 4 digits of the OTP",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "lastUpdatedAt": MessageLookupByLibrary.simpleMessage("Last updated at"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginNow": MessageLookupByLibrary.simpleMessage("Login now"),
    "loginWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Login with Google",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutConfirm": MessageLookupByLibrary.simpleMessage("Confirm logout"),
    "logoutQuestion": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to logout?",
    ),
    "name": MessageLookupByLibrary.simpleMessage("Your name"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "noNotification": MessageLookupByLibrary.simpleMessage(
      "You haven\'t had any notifications",
    ),
    "noTransactions": MessageLookupByLibrary.simpleMessage(
      "You haven\'t had any transactions",
    ),
    "notActive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "notHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "notReceivedOtp": MessageLookupByLibrary.simpleMessage(
      "Didn\'t receive the code?",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "otpAlreadySent": MessageLookupByLibrary.simpleMessage(
      "OTP has been sent to you",
    ),
    "otpAlreadySentTo": m5,
    "ownCategories": MessageLookupByLibrary.simpleMessage(
      "Personal categories",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordLengthLessThanRegulation": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "passwordNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "recentTransactions": MessageLookupByLibrary.simpleMessage(
      "Recent transactions",
    ),
    "record": MessageLookupByLibrary.simpleMessage("User record"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerNow": MessageLookupByLibrary.simpleMessage("Register now"),
    "registerWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Register with Google",
    ),
    "reports": MessageLookupByLibrary.simpleMessage("Reports"),
    "resend": MessageLookupByLibrary.simpleMessage("Resend"),
    "resendAfter": m6,
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
    "resetPasswordPlease": MessageLookupByLibrary.simpleMessage(
      "Please set a new password for your account",
    ),
    "resetPasswordSuccess": MessageLookupByLibrary.simpleMessage(
      "Password reset successful",
    ),
    "restart": MessageLookupByLibrary.simpleMessage("Restart"),
    "restartConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to restart the application?",
    ),
    "restore": MessageLookupByLibrary.simpleMessage("Restore"),
    "restoreData": MessageLookupByLibrary.simpleMessage("Restore data"),
    "restoreTransaction": MessageLookupByLibrary.simpleMessage(
      "Restore transaction",
    ),
    "restoreTransactionConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to restore this transaction?",
    ),
    "returnToLogin": MessageLookupByLibrary.simpleMessage("Back to login"),
    "role": MessageLookupByLibrary.simpleMessage("Role"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "security": MessageLookupByLibrary.simpleMessage("Security"),
    "selectCategories": MessageLookupByLibrary.simpleMessage(
      "Select categories",
    ),
    "selectLanguage": MessageLookupByLibrary.simpleMessage("Select language"),
    "selectLessMinExpenseCategoriesError": MessageLookupByLibrary.simpleMessage(
      "You must select at least 3 expense categories",
    ),
    "selectLessMinExpenseIncomeError": MessageLookupByLibrary.simpleMessage(
      "You must select at least 1 income category",
    ),
    "selectedCategoriesDescription": MessageLookupByLibrary.simpleMessage(
      "Choose categories that match your income and expenses (minimum 3 expense and 1 income categories)",
    ),
    "sendOTPError": MessageLookupByLibrary.simpleMessage(
      "Failed to send OTP, please try again",
    ),
    "setBudget": MessageLookupByLibrary.simpleMessage("Set budget"),
    "setUpCategoriesError": MessageLookupByLibrary.simpleMessage(
      "Failed to set up categories, please try again",
    ),
    "setting": MessageLookupByLibrary.simpleMessage("Setting"),
    "setup": MessageLookupByLibrary.simpleMessage("Account setup"),
    "setupPlease": MessageLookupByLibrary.simpleMessage(
      "Please enter your name and current budget to set up your account",
    ),
    "startUse": MessageLookupByLibrary.simpleMessage("Start using"),
    "thisMonth": MessageLookupByLibrary.simpleMessage("This Month"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "transactions": MessageLookupByLibrary.simpleMessage("Transactions"),
    "turnOnNotification": MessageLookupByLibrary.simpleMessage(
      "Enable notifications",
    ),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "An error has occurred",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateName": MessageLookupByLibrary.simpleMessage("Update Name"),
    "updatePassSuccess": MessageLookupByLibrary.simpleMessage(
      "Password updated successfully",
    ),
    "user": MessageLookupByLibrary.simpleMessage("User"),
    "userNameMinLengthError": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 4 characters",
    ),
    "verified": MessageLookupByLibrary.simpleMessage("Verification successful"),
    "verifyingOtp": MessageLookupByLibrary.simpleMessage("Verifying OTP..."),
    "waitingForResending": MessageLookupByLibrary.simpleMessage(
      "Please wait before resending the OTP",
    ),
    "whatBudgetYouSpent": MessageLookupByLibrary.simpleMessage(
      "What did you just spend money on?",
    ),
  };
}
