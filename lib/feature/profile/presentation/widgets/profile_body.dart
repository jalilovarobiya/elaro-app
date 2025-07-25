import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/secure_storage.dart/secure_storage.dart';
import 'package:elaro_app/core/widgets/custom_button.dart';
import 'package:elaro_app/feature/profile/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 15,
        children: [
          Text("required_login".tr(), textAlign: TextAlign.center),
          CustomButton(
            text: "Kirish",
            onPressed: () {},
            color: AppColor.primary,
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileWidget(
                  onTap: () {
                    context.push(AppRouter.favourite);
                  },
                  actionIcon: Icon(Icons.navigate_next_outlined),
                  icon: Icon(Icons.favorite_border),
                  title: "favorites",
                ),
                ProfileWidget(
                  onTap: () => context.push(AppRouter.language),
                  actionIcon: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 3,
                      ),
                      child: Text(
                        language(),
                        style: AppStyle.w700s18h28DarkBluePrimary.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  icon: Icon(Icons.public_outlined),
                  title: "language",
                ),
                ProfileWidget(
                  onTap: () => context.push(AppRouter.location),
                  actionIcon: Icon(Icons.navigate_next_outlined),
                  icon: Icon(Icons.location_on_outlined),
                  title: "location",
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileWidget(
                  actionIcon: Icon(Icons.navigate_next_outlined),
                  icon: Icon(Icons.question_answer_outlined),
                  title: "support",
                ),
                ProfileWidget(
                  actionIcon: Icon(Icons.navigate_next_outlined),
                  icon: Icon(Icons.error_outline),
                  title: "info",
                ),
                ProfileWidget(
                  onTap: () {
                    SecureStorage().deleteAll();
                    setState(() {});
                  },
                  actionIcon: Icon(Icons.navigate_next_outlined),
                  icon: Icon(Icons.logout),
                  title: "exit",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String language() {
    final lan = context.locale.languageCode;
    if (lan == "uz") {
      return "O'z";
    } else if (lan == "en") {
      return "Ўз";
    } else if (lan == "ru") {
      return "Ру";
    } else {
      return "O'z";
    }
  }
}
