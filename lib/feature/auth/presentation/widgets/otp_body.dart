import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/source/main_source.dart';
import 'package:elaro_app/core/widgets/custom_toast.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/pinput_widget.dart';
import 'package:elaro_app/feature/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/routes/app_routes.dart';
import '../bloc/auth_bloc.dart';

class OtpBody extends StatefulWidget {
  const OtpBody({super.key, required this.phone});

  final String? phone;

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> with CodeAutoFill {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String old = "";

  @override
  void initState() {
    _inputCode();
    listenForCode();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          goToOtp: (goToOtp) {
            context.read<ProfileBloc>().add(const ProfileEvent.fetchData());
          },
          register: (register) {},
          failure: (failure) {
            CustomToast.showToast(
              context,
              AppImages.error,
              failure.error,
              Colors.white,
              Colors.red,
            );
          },
          success: () {
            MainSources.currentPage.value = 0;
            context.pop();
            context.go(AppRouter.home);
          },
        );
      },

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            50.h,
            Translator(
              maxLen: 3,
              textAlign: TextAlign.center,
              style: AppStyle.w400s15h20DarkBlue500,
              uz: "Biz +998 ${widget.phone} raqamiga tasdiqlash kodini yubordik.",
              ru: "Мы отправили код подтверждения на номер +998 ${widget.phone}.",
              crl:
                  "Биз +998 ${widget.phone} рақамига тасдиқлаш кодини юбордик.",
            ),
            24.h,
            Form(key: _formKey, child: PinPutWidget(controller: controller)),
            24.h,
            Countdown(
              seconds: 300,
              build: (BuildContext context, double time) {
                final int minutes = time ~/ 60;
                final String seconds = "${(time % 60).round()}".padLeft(2, '0');
                return ZoomTapAnimation(
                  onTap: () => context.pop(),
                  child: Translator(
                    uz: "Kodni qayta yuborish $minutes:$seconds",
                    ru: "Отправить код повторно $minutes:$seconds",
                    crl: "Кодни қайта юбориш $minutes:$seconds",
                    maxLen: 3,
                    textAlign: TextAlign.center,
                    style: AppStyle.w500s15h20DarkBlue500.copyWith(
                      color: time == 0 ? AppColor.blue : AppColor.lightGray500,
                    ),
                  ),
                );
              },
              interval: const Duration(seconds: 1),
              onFinished: () {
                print('Timer is done!');
              },
            ),
            Spacer(),
            24.h,
            ZoomTapAnimation(
              onTap: () => context.pop(),
              child: Text(
                "resend".tr(),
                textAlign: TextAlign.center,
                style: AppStyle.w500s17h20DarkBlue500.copyWith(
                  color: AppColor.primary,
                ),
              ),
            ),
            12.h,
            ZoomTapAnimation(
              onTap: () => context.pop(),
              child: Text(
                "changePhone".tr(),
                textAlign: TextAlign.center,
                style: AppStyle.w500s17h20DarkBlue500.copyWith(
                  color: AppColor.primary,
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  void _inputCode() {
    controller.addListener(() {
      if (controller.text.length == 6 &&
          (_formKey.currentState?.validate() ?? false)) {
        if (controller.text != old) {
          context.read<AuthBloc>().add(
            AuthEvent.otpVerify(
              number: widget.phone ?? "",
              otpCode: controller.text,
            ),
          );

          old = controller.text;
        }
      }
    });
  }

  @override
  void codeUpdated() {
    controller.text = code!;
    setState(() {});
    _inputCode();
  }
}
