import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/app_textfiled.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/button_widget.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/loading_widget.dart';
import 'package:elaro_app/feature/profile/presentation/bloc/bloc/region_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegionPage extends StatefulWidget {
  const RegionPage({super.key});

  @override
  State<RegionPage> createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> {
  final ValueNotifier<int?> selectRegionId = ValueNotifier(null);
  String regionText = "";
  String districtText = "";
  final ValueNotifier<int?> selectDistrictId = ValueNotifier(null);
  TextEditingController region = TextEditingController();
  TextEditingController district = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegionBloc>()..add(const RegionEvent.started()),
      child: Scaffold(
        appBar: CustomAppBar(
          titleUz: "Yetkazish manzili",
          titleRu: "Адрес доставки",
          titleCrl: "Етказиб бериш манзили",
        ),
        body: Form(
          key: _formKey,
          child: BlocBuilder<RegionBloc, RegionState>(
            builder: (context, state) {
              return state.when(
                loading: () => LoadingWidget(),
                success: (success) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: selectRegionId,
                            builder: (context, value, _) {
                              return DropdownButton(
                                hint: Translator(
                                  uz: "Viloyatni tanlang",
                                  ru: "Выберите регион",
                                  crl: "Минтақани танланг",
                                ),
                                isExpanded: true,
                                value: selectRegionId.value,
                                items: List.generate(success.regions.length,
                                    (index) {
                                  return DropdownMenuItem(
                                    value: success.regions[index].id,
                                    child: Text(success.regions[index].name),
                                  );
                                }),
                                onChanged: (value) {
                                  selectRegionId.value = value;
                                  selectDistrictId.value = null;
                                },
                              );
                            }),
                        const SizedBox(height: 20),
                        ValueListenableBuilder(
                            valueListenable: selectRegionId,
                            builder: (context, value, _) {
                              return ValueListenableBuilder(
                                  valueListenable: selectDistrictId,
                                  builder: (context, dValue, _) {
                                    if (value == null) {
                                      return const SizedBox();
                                    }
                                    return DropdownButton(
                                      hint: Translator(
                                        uz: "Tumanni tanlang",
                                        ru: "Выберите район",
                                        crl: "Туманни танланг",
                                      ),
                                      isExpanded: true,
                                      value: selectDistrictId.value,
                                      items: List.generate(
                                          success.districts
                                              .where((e) =>
                                                  e.regionId ==
                                                  selectRegionId.value)
                                              .length, (index) {
                                        final data = success.districts
                                            .where((e) =>
                                                e.regionId ==
                                                selectRegionId.value)
                                            .toList();
                                        return DropdownMenuItem(
                                          value: data[index].id,
                                          child: Text(
                                            data[index].name,
                                          ),
                                        );
                                      }),
                                      onChanged: (value) {
                                        selectDistrictId.value = value;
                                      },
                                    );
                                  });
                            }),
                        const SizedBox(height: 20),
                        AppTextfiled(
                          controller: region,
                          hintText: "mahalla".tr(),
                          validator: (text) => Utils.validator(text, 4),
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                        AppTextfiled(
                          controller: district,
                          hintText: "home_number".tr(),
                          validator: (text) => Utils.validator(text, 4),
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                        ButtonWidget(
                          text: "save".tr(),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (selectDistrictId.value == null ||
                                  selectRegionId.value == null) return;
                              context.pop(
                                  "${success.regions.firstWhere((e) => e.id == selectRegionId.value).name} ${success.districts.firstWhere((e) => e.id == selectDistrictId.value).name} ${region.text} ${district.text}");
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
                failure: (f) {
                  return ErrorWidget(f);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
