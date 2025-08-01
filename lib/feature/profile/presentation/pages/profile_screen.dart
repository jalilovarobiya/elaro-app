import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/feature/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:elaro_app/feature/profile/presentation/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(body: SafeArea(child: ProfileBody()));
  }
}
