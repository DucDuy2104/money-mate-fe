import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/presentation/pages/opt_verify/bloc/verification_bloc.dart';
import 'package:money_mate/presentation/pages/opt_verify/widgets/otp_textfield.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_assets.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class OtpVerificationScreen extends StatefulWidget {
  final User user;
  const OtpVerificationScreen({super.key, required this.user});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    4,
    (index) => FocusNode(),
  );

  Timer? _timer;
  int _secondsRemaining = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();

    // Focus vào ô đầu tiên khi màn hình được mở
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sendOtp(widget.user.id, context);
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _secondsRemaining = 60;
      _canResend = false;
    });

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_secondsRemaining == 0) {
          setState(() {
            _canResend = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  void sendOtp(String userId, BuildContext context) {
    // Reset OTP fields
    for (var controller in _otpControllers) {
      controller.clear();
    }

    // Focus vào ô đầu tiên
    _focusNodes[0].requestFocus();

    try {
      BlocProvider.of<VerificationBloc>(context)
          .add(VerificationEvent.sendCode(userId));

      // Restart timer
      startTimer();
    } catch (e) {
      AppToast.error(context, 'Lỗi khi gửi lại mã OTP: $e');
      debugPrint(e.toString());
    }
  }

  void verifyOtp() {
    String otp = _otpControllers.map((controller) => controller.text).join();

    if (otp.length != 4) {
      AppToast.warning(context, 'Vui lòng nhập đủ 4 số OTP');
      return;
    }

    // TODO: Handle OTP verification
    AppToast.success(context, 'Xác thực OTP thành công');
    // Navigate to next screen
    // context.goNamed(RouteNames.nextScreenName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationBloc, VerificationState>(
      listener: (context, state) {
        state.maybeMap(
            codeSent: (value) {
              if (value.isSuccess) {
                AppToast.success(context, 'Code was successfully sent');
              } else {
                AppToast.error(
                    context, 'Failed to send code, please try again');
              }
            },
            error: (value) {
              AppToast.error(context, value.message);
            },
            sendingCode: (value) =>
                {AppToast.info(context, 'Code is sending...')},
            orElse: () {});
      },
      child: LoadingScaffold(
        isLoading: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(AppDimens.padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.storySetVerification,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                AppDimens.spaceLarge,
                Text(
                  'Nhập mã OTP',
                  style: context.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                AppDimens.space,
                Text(
                  'Chúng tôi đã gửi mã xác thực đến ${widget.user.email}',
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                AppDimens.spaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => OtpTextField(
                      controller: _otpControllers[index],
                      focusNode: _focusNodes[index],
                      style: context.textTheme.headlineMedium,
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          _focusNodes[index + 1].requestFocus();
                        }
                      },
                      onBackspacePressed: () {
                        if (index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),
                AppDimens.spaceLarge,
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: verifyOtp,
                    child: Text(
                      'Xác nhận',
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                AppDimens.space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _canResend
                          ? "Không nhận được mã?"
                          : "Gửi lại mã sau: ${_secondsRemaining}s",
                      style: context.textTheme.bodyMedium,
                    ),
                    if (_canResend) ...[
                      AppDimens.spaceSmall,
                      GestureDetector(
                        onTap: () {
                          if (!_canResend) {
                            AppToast.info(context,
                                'Vui lòng đợi trước khi gửi lại mã OTP');
                            return;
                          }
                          sendOtp(widget.user.id, context);
                        },
                        child: Text(
                          'Gửi lại',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
