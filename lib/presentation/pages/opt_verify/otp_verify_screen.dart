import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/presentation/pages/opt_verify/bloc/verification_bloc.dart';
import 'package:money_mate/presentation/pages/opt_verify/widgets/otp_textfield.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_assets.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

enum OtpTypes { register, resetPass }

class OtpVerificationScreen extends StatefulWidget {
  final User user;
  final String? type;
  const OtpVerificationScreen(
      {super.key, required this.user, required this.type});

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

    // Focus first textfield
    _focusNodes[0].requestFocus();

    try {
      BlocProvider.of<VerificationBloc>(context)
          .add(VerificationEvent.sendCode(userId));

      // Restart timer
      startTimer();
    } catch (e) {
      AppToast.error(context, S.of(context).sendOTPError);
      debugPrint(e.toString());
    }
  }

  void verifyOtp() {
    String otp = _otpControllers.map((controller) => controller.text).join();

    if (otp.length != 4) {
      AppToast.warning(context, S.of(context).lackOfOTP);
      return;
    }

    BlocProvider.of<VerificationBloc>(context)
        .add(VerificationEvent.verify(widget.user.id, otp));
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocConsumer<VerificationBloc, VerificationState>(
      listener: (context, state) {
        state.maybeMap(
            codeSent: (value) {
              if (value.isSuccess) {
                AppToast.success(context, s.otpAlreadySent);
              } else {
                AppToast.error(context, s.otpAlreadySent);
              }
            },
            error: (value) {
              AppToast.error(context, value.message);
            },
            verifying: (value) {},
            verified: (value) {
              if (widget.type == OtpTypes.resetPass.name) {
              AppToast.success(
                  context, s.verified);
                context.goNamed(RouteNames.resetPasswordName,
                    extra: value.user);
                return;
              }
              if (widget.type == OtpTypes.register.name) {
                AppToast.success(context, s.verified);
                context.goNamed(RouteNames.loginName);
                return;
              }
            },
            sendingCode: (value) =>
                {AppToast.info(context, s.verifyingOtp)},
            orElse: () {});
      },
      builder: (context, state) {
        return LoadingScaffold(
          isLoading:
              state.maybeMap(verifying: (value) => true, orElse: () => false),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.only(
                  top: AppDimens.paddingSm,
                  right: AppDimens.paddingMd,
                  left: AppDimens.paddingMd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.storySetVerification,
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  AppDimens.spaceMd,
                  Text(
                    s.enterOtp,
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  AppDimens.spaceSm,
                  Text(
                    s.otpAlreadySentTo(widget.user.email),
                    textAlign: TextAlign.center,
                  ),
                  AppDimens.spaceMd,
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
                  AppDimens.spaceLg,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: verifyOtp,
                      child: Text(
                        s.confirm,
                        style: context.textTheme.bodyLarge
                      ),
                    ),
                  ),
                  AppDimens.spaceMd,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _canResend
                            ? s.notReceivedOtp
                            : s.resendAfter(_secondsRemaining),
                        style: context.textTheme.bodyMedium,
                      ),
                      if (_canResend) ...[
                        AppDimens.spaceXs,
                        GestureDetector(
                          onTap: () {
                            if (!_canResend) {
                              AppToast.info(context,
                                  s.waitingForResending);
                              return;
                            }
                            sendOtp(widget.user.id, context);
                          },
                          child: Text(
                            s.resend,
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
        );
      },
    );
  }
}
