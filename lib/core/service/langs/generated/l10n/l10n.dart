// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Please fill in all required fields`
  String get emptyFieldError {
    return Intl.message(
      'Please fill in all required fields',
      name: 'emptyFieldError',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred`
  String get unknownError {
    return Intl.message(
      'An error has occurred',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Register with Google`
  String get registerWithGoogle {
    return Intl.message(
      'Register with Google',
      name: 'registerWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get notHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'notHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Login now`
  String get loginNow {
    return Intl.message('Login now', name: 'loginNow', desc: '', args: []);
  }

  /// `Passwords do not match`
  String get passwordNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your registered email to continue`
  String get emailToNext {
    return Intl.message(
      'Please enter your registered email to continue',
      name: 'emailToNext',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Back to login`
  String get returnToLogin {
    return Intl.message(
      'Back to login',
      name: 'returnToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send OTP, please try again`
  String get sendOTPError {
    return Intl.message(
      'Failed to send OTP, please try again',
      name: 'sendOTPError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter all 4 digits of the OTP`
  String get lackOfOTP {
    return Intl.message(
      'Please enter all 4 digits of the OTP',
      name: 'lackOfOTP',
      desc: '',
      args: [],
    );
  }

  /// `OTP has been sent to you`
  String get otpAlreadySent {
    return Intl.message(
      'OTP has been sent to you',
      name: 'otpAlreadySent',
      desc: '',
      args: [],
    );
  }

  /// `Verifying OTP...`
  String get verifyingOtp {
    return Intl.message(
      'Verifying OTP...',
      name: 'verifyingOtp',
      desc: '',
      args: [],
    );
  }

  /// `Verification successful`
  String get verified {
    return Intl.message(
      'Verification successful',
      name: 'verified',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get enterOtp {
    return Intl.message('Enter OTP', name: 'enterOtp', desc: '', args: []);
  }

  /// `We have sent the code to {email}`
  String otpAlreadySentTo(Object email) {
    return Intl.message(
      'We have sent the code to $email',
      name: 'otpAlreadySentTo',
      desc: '',
      args: [email],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Didn't receive the code?`
  String get notReceivedOtp {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'notReceivedOtp',
      desc: '',
      args: [],
    );
  }

  /// `Resend after {time}s`
  String resendAfter(Object time) {
    return Intl.message(
      'Resend after ${time}s',
      name: 'resendAfter',
      desc: '',
      args: [time],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Please wait before resending the OTP`
  String get waitingForResending {
    return Intl.message(
      'Please wait before resending the OTP',
      name: 'waitingForResending',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordLengthLessThanRegulation {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordLengthLessThanRegulation',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successful`
  String get resetPasswordSuccess {
    return Intl.message(
      'Password reset successful',
      name: 'resetPasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Please set a new password for your account`
  String get resetPasswordPlease {
    return Intl.message(
      'Please set a new password for your account',
      name: 'resetPasswordPlease',
      desc: '',
      args: [],
    );
  }

  /// `Budget must be a number`
  String get budgetMustBeNum {
    return Intl.message(
      'Budget must be a number',
      name: 'budgetMustBeNum',
      desc: '',
      args: [],
    );
  }

  /// `Account setup`
  String get setup {
    return Intl.message('Account setup', name: 'setup', desc: '', args: []);
  }

  /// `Please enter your name and current budget to set up your account`
  String get setupPlease {
    return Intl.message(
      'Please enter your name and current budget to set up your account',
      name: 'setupPlease',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get name {
    return Intl.message('Your name', name: 'name', desc: '', args: []);
  }

  /// `Current budget ({unit})`
  String currentBudget(Object unit) {
    return Intl.message(
      'Current budget ($unit)',
      name: 'currentBudget',
      desc: '',
      args: [unit],
    );
  }

  /// `Failed to fetch categories, please try again`
  String get getCategoriesError {
    return Intl.message(
      'Failed to fetch categories, please try again',
      name: 'getCategoriesError',
      desc: '',
      args: [],
    );
  }

  /// `You must select at least 3 expense categories`
  String get selectLessMinExpenseCategoriesError {
    return Intl.message(
      'You must select at least 3 expense categories',
      name: 'selectLessMinExpenseCategoriesError',
      desc: '',
      args: [],
    );
  }

  /// `You must select at least 1 income category`
  String get selectLessMinExpenseIncomeError {
    return Intl.message(
      'You must select at least 1 income category',
      name: 'selectLessMinExpenseIncomeError',
      desc: '',
      args: [],
    );
  }

  /// `Failed to set up categories, please try again`
  String get setUpCategoriesError {
    return Intl.message(
      'Failed to set up categories, please try again',
      name: 'setUpCategoriesError',
      desc: '',
      args: [],
    );
  }

  /// `Select categories`
  String get selectCategories {
    return Intl.message(
      'Select categories',
      name: 'selectCategories',
      desc: '',
      args: [],
    );
  }

  /// `Choose categories that match your income and expenses (minimum 3 expense and 1 income categories)`
  String get selectedCategoriesDescription {
    return Intl.message(
      'Choose categories that match your income and expenses (minimum 3 expense and 1 income categories)',
      name: 'selectedCategoriesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get expense {
    return Intl.message('Expense', name: 'expense', desc: '', args: []);
  }

  /// `Income`
  String get income {
    return Intl.message('Income', name: 'income', desc: '', args: []);
  }

  /// `{selectedCount} categories selected. Tap a category to add or update its budget`
  String countSelected(Object selectedCount) {
    return Intl.message(
      '$selectedCount categories selected. Tap a category to add or update its budget',
      name: 'countSelected',
      desc: '',
      args: [selectedCount],
    );
  }

  /// `Start using`
  String get startUse {
    return Intl.message('Start using', name: 'startUse', desc: '', args: []);
  }

  /// `Personal categories`
  String get ownCategories {
    return Intl.message(
      'Personal categories',
      name: 'ownCategories',
      desc: '',
      args: [],
    );
  }

  /// `Recent transactions`
  String get recentTransactions {
    return Intl.message(
      'Recent transactions',
      name: 'recentTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message('Reports', name: 'reports', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Confirm logout`
  String get logoutConfirm {
    return Intl.message(
      'Confirm logout',
      name: 'logoutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logoutQuestion {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logoutQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Currency unit`
  String get currencyUnit {
    return Intl.message(
      'Currency unit',
      name: 'currencyUnit',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Security`
  String get security {
    return Intl.message('Security', name: 'security', desc: '', args: []);
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Enable notifications`
  String get turnOnNotification {
    return Intl.message(
      'Enable notifications',
      name: 'turnOnNotification',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get data {
    return Intl.message('Data', name: 'data', desc: '', args: []);
  }

  /// `Restore data`
  String get restoreData {
    return Intl.message(
      'Restore data',
      name: 'restoreData',
      desc: '',
      args: [],
    );
  }

  /// `Delete all data`
  String get deleteData {
    return Intl.message(
      'Delete all data',
      name: 'deleteData',
      desc: '',
      args: [],
    );
  }

  /// `Backup data`
  String get backupData {
    return Intl.message('Backup data', name: 'backupData', desc: '', args: []);
  }

  /// `About Money Mate`
  String get aboutMoneyMate {
    return Intl.message(
      'About Money Mate',
      name: 'aboutMoneyMate',
      desc: '',
      args: [],
    );
  }

  /// `Help and support`
  String get helpAndSupport {
    return Intl.message(
      'Help and support',
      name: 'helpAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `Enter budget`
  String get enterBudget {
    return Intl.message(
      'Enter budget',
      name: 'enterBudget',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Add {name}`
  String addName(Object name) {
    return Intl.message('Add $name', name: 'addName', desc: '', args: [name]);
  }

  /// `Set budget`
  String get setBudget {
    return Intl.message('Set budget', name: 'setBudget', desc: '', args: []);
  }

  /// `This action will add the category to your budget plan`
  String get addCategoryConfirm {
    return Intl.message(
      'This action will add the category to your budget plan',
      name: 'addCategoryConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Cancel trans`
  String get cancelTransaction {
    return Intl.message(
      'Cancel trans',
      name: 'cancelTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this transaction?`
  String get cancelTransactionConfirm {
    return Intl.message(
      'Are you sure you want to cancel this transaction?',
      name: 'cancelTransactionConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirm cancellation`
  String get cancelConfirm {
    return Intl.message(
      'Confirm cancellation',
      name: 'cancelConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Restore transaction`
  String get restoreTransaction {
    return Intl.message(
      'Restore transaction',
      name: 'restoreTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to restore this transaction?`
  String get restoreTransactionConfirm {
    return Intl.message(
      'Are you sure you want to restore this transaction?',
      name: 'restoreTransactionConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Restore`
  String get restore {
    return Intl.message('Restore', name: 'restore', desc: '', args: []);
  }

  /// `Budget Warning`
  String get budgetWarn {
    return Intl.message(
      'Budget Warning',
      name: 'budgetWarn',
      desc: '',
      args: [],
    );
  }

  /// `When spending reaches {percent}% of the budget`
  String budgetWarnWhen(Object percent) {
    return Intl.message(
      'When spending reaches $percent% of the budget',
      name: 'budgetWarnWhen',
      desc: '',
      args: [percent],
    );
  }

  /// `Information`
  String get information {
    return Intl.message('Information', name: 'information', desc: '', args: []);
  }

  /// `Budget`
  String get budget {
    return Intl.message('Budget', name: 'budget', desc: '', args: []);
  }

  /// `What did you just spend money on?`
  String get whatBudgetYouSpent {
    return Intl.message(
      'What did you just spend money on?',
      name: 'whatBudgetYouSpent',
      desc: '',
      args: [],
    );
  }

  /// `Added category {name} with a budget of {budget} (Automated message)`
  String addBudgetCategoryAutoMessage(Object name, Object budget) {
    return Intl.message(
      'Added category $name with a budget of $budget (Automated message)',
      name: 'addBudgetCategoryAutoMessage',
      desc: '',
      args: [name, budget],
    );
  }

  /// `Password updated successfully`
  String get updatePassSuccess {
    return Intl.message(
      'Password updated successfully',
      name: 'updatePassSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your current password and a new one to update`
  String get changePasswordDescription {
    return Intl.message(
      'Please enter your current password and a new one to update',
      name: 'changePasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Balance`
  String get balance {
    return Intl.message('Balance', name: 'balance', desc: '', args: []);
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `This Month`
  String get thisMonth {
    return Intl.message('This Month', name: 'thisMonth', desc: '', args: []);
  }

  /// `User record`
  String get record {
    return Intl.message('User record', name: 'record', desc: '', args: []);
  }

  /// `Role`
  String get role {
    return Intl.message('Role', name: 'role', desc: '', args: []);
  }

  /// `Created at`
  String get createdAt {
    return Intl.message('Created at', name: 'createdAt', desc: '', args: []);
  }

  /// `Last updated at`
  String get lastUpdatedAt {
    return Intl.message(
      'Last updated at',
      name: 'lastUpdatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Account status`
  String get accountStatus {
    return Intl.message(
      'Account status',
      name: 'accountStatus',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Inactive`
  String get notActive {
    return Intl.message('Inactive', name: 'notActive', desc: '', args: []);
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Admin`
  String get admin {
    return Intl.message('Admin', name: 'admin', desc: '', args: []);
  }

  /// `Name must be at least 4 characters`
  String get userNameMinLengthError {
    return Intl.message(
      'Name must be at least 4 characters',
      name: 'userNameMinLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Update Name`
  String get updateName {
    return Intl.message('Update Name', name: 'updateName', desc: '', args: []);
  }

  /// `Enter Name`
  String get enterName {
    return Intl.message('Enter Name', name: 'enterName', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Select language`
  String get selectLanguage {
    return Intl.message(
      'Select language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get currentT {
    return Intl.message('Current', name: 'currentT', desc: '', args: []);
  }

  /// `Restart`
  String get restart {
    return Intl.message('Restart', name: 'restart', desc: '', args: []);
  }

  /// `Are you sure you want to restart the application?`
  String get restartConfirm {
    return Intl.message(
      'Are you sure you want to restart the application?',
      name: 'restartConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message('Setting', name: 'setting', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Expenses by Category`
  String get expenseByCategory {
    return Intl.message(
      'Expenses by Category',
      name: 'expenseByCategory',
      desc: '',
      args: [],
    );
  }

  /// `You haven't had any transactions`
  String get noTransactions {
    return Intl.message(
      'You haven\'t had any transactions',
      name: 'noTransactions',
      desc: '',
      args: [],
    );
  }

  /// `You haven't had any notifications`
  String get noNotification {
    return Intl.message(
      'You haven\'t had any notifications',
      name: 'noNotification',
      desc: '',
      args: [],
    );
  }

  /// `Enable Access`
  String get enableAccessTitle {
    return Intl.message(
      'Enable Access',
      name: 'enableAccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `To take photos, please enable camera access in Settings.`
  String get cameraPermissionMessage {
    return Intl.message(
      'To take photos, please enable camera access in Settings.',
      name: 'cameraPermissionMessage',
      desc: '',
      args: [],
    );
  }

  /// `To select images, please enable photo library access in Settings.`
  String get photosPermissionMessage {
    return Intl.message(
      'To select images, please enable photo library access in Settings.',
      name: 'photosPermissionMessage',
      desc: '',
      args: [],
    );
  }

  /// `To receive notifications, please enable notification access in Settings.`
  String get notificationPermissionMessage {
    return Intl.message(
      'To receive notifications, please enable notification access in Settings.',
      name: 'notificationPermissionMessage',
      desc: '',
      args: [],
    );
  }

  /// `To use this feature, please enable permissions in Settings.`
  String get genericPermissionMessage {
    return Intl.message(
      'To use this feature, please enable permissions in Settings.',
      name: 'genericPermissionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsButton {
    return Intl.message('Settings', name: 'settingsButton', desc: '', args: []);
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message('Cancel', name: 'cancelButton', desc: '', args: []);
  }

  /// `Could not open settings.`
  String get errorOpenSettings {
    return Intl.message(
      'Could not open settings.',
      name: 'errorOpenSettings',
      desc: '',
      args: [],
    );
  }

  /// `Location Permission Needed`
  String get locationPermissionTitle {
    return Intl.message(
      'Location Permission Needed',
      name: 'locationPermissionTitle',
      desc: '',
      args: [],
    );
  }

  /// `You denied location permission which is required to execute selected operation. Please grant it from app settings.`
  String get locationPermissionMessageIos {
    return Intl.message(
      'You denied location permission which is required to execute selected operation. Please grant it from app settings.',
      name: 'locationPermissionMessageIos',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get okButton {
    return Intl.message('OK', name: 'okButton', desc: '', args: []);
  }

  /// `Permission Denied`
  String get permissionDeniedTitle {
    return Intl.message(
      'Permission Denied',
      name: 'permissionDeniedTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
