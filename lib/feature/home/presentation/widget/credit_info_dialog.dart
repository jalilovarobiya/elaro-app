// import 'package:elaro_app/core/widgets/translator.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/constants/app_colors.dart';
// import '../../../../core/constants/app_images.dart';
// import '../../../../core/constants/app_styles.dart';
// import '../../../auth/presentation/widgets/button_widget.dart';

// class CreditInfoDialog extends StatelessWidget {
//   const CreditInfoDialog({super.key});

//   static showDialog(BuildContext context) {
//     return showModalBottomSheet(
//       useSafeArea: true,
//       backgroundColor: Colors.white,
//       clipBehavior: Clip.hardEdge,
//       scrollControlDisabledMaxHeightRatio: 1,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
//       ),
//       context: context,
//       builder: (context) => const CreditInfoDialog(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       // controller: scrollController,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           AspectRatio(
//             aspectRatio: 16/9,
//             child: Stack(
//               fit: StackFit.expand,
//               alignment: Alignment.center,
//               children: [
//                 Image.asset(AppImages.diagramPNG, fit: BoxFit.cover),
//                 Positioned(
//                   top: 0,
//                   right: 0,
//                   child: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.cancel_outlined, color: AppColor.lightGray700),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Translator(
//                       uz: "Muddatli to'lovga", ru: "В рассрочку", crl: "Муддатли тўловга",
//                       style: AppStyle.w400s13h18DarkBlue300,
//                     ),
//                     const Spacer(),
//                     Text(
//                       "123 123 ${"sum".tr.toLowerCase()}",
//                       style: AppStyle.w400s13h18DarkBlue300,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Translator(
//                   uz: "Muddatli to'lov narxi 24 oyga Axiom nasiya tomonidan ko'rsatilgan",
//                   ru: "Стоимость рассрочки указана Axiom nasiya на 24 месяца",
//                   crl: "Муддатли тўлов нархи 24 ойга Ахиом насия томонидан кўрсатилган",
//                   style: AppStyle.w400s13h18DarkBlue300,
//                   maxLen: 4,
//                 ),
//                 const SizedBox(height: 12),
//                 ExpansionTile(
//                   tilePadding: EdgeInsets.zero,
//                   shape: const RoundedRectangleBorder(),
//                   title: Translator(
//                     uz: "Do'konda muddatli to'lov rasmiylashtirish tartibi",
//                     ru: "Порядок оформления рассрочки в магазине",
//                     crl: "Дўконда муддатли тўлов расмийлаштириш тартиби",
//                     style: AppStyle.w600s15h20DarkBluePrimary,
//                     maxLen: 2,
//                   ),
//                   childrenPadding: EdgeInsets.zero,
//                   children: [
//                     ListTile(
//                       leading: Text("1", style: AppStyle.w500s15h20Primary),
//                       title: Translator(
//                         uz: "O'zingizga qulay do'konga tashrif buyuring.\nPasportingizni olgan holatda",
//                         ru: "Посетите любой магазин, который вам удобно.\nПосле получения паспорта",
//                         crl: "Сизга қулай бўлган исталган дўконга ташриф буюринг.\nПаспорт олингандан кейин",
//                         maxLen: 3,
//                         style: AppStyle.w400s13h18DarkBlue300,
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text("2", style: AppStyle.w500s15h20Primary),
//                       title: Translator(
//                         uz: "Maxsulotni tanlang",
//                         ru: "Выберите товар",
//                         crl: "Маҳсулотни танланг",
//                         maxLen: 3,
//                         style: AppStyle.w400s13h18DarkBlue300,
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text("3", style: AppStyle.w500s15h20Primary),
//                       title: Translator(
//                         uz: "Do'kon xodimlariga murojaat qiling. Sizga muddatli to'lov shartlari haqida ma'lumot berishadi",
//                         ru: "Обращайтесь к сотрудникам магазина. Вас проинформируют об условиях рассрочки",
//                         crl: "Дўкон ходимларига мурожаат қилинг. Сизга муддатли тўлов шартлари ҳақида маълумот берилади",
//                         maxLen: 3,
//                         style: AppStyle.w400s13h18DarkBlue300,
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text("4", style: AppStyle.w500s15h20Primary),
//                       title: Translator(
//                         uz: "Agar sizni muddatli to'lov shartlari qanoatlantirsa, shartnomani rasmiylashtiring va xaridingizni uyingizga olib keting.",
//                         ru: "Если вы удовлетворены условиями рассрочки, оформите договор и возьмите покупку домой.",
//                         crl: "Агар сизни муддатли тўлов шартлари қаноатлантирса, шартномани расмийлаштиринг ва харидингизни уйингизга олиб кетинг.",
//                         maxLen: 3,
//                         style: AppStyle.w400s13h18DarkBlue300,
//                       ),
//                     ),
//                   ],
//                 ),
//                 ExpansionTile(
//                   tilePadding: EdgeInsets.zero,
//                   shape: const RoundedRectangleBorder(),
//                   title: Translator(
//                     uz: "Onlayn Muddati to‘lov rasmiylashtirish tartibi:",
//                     ru: "Порядок оформления рассрочки в магазине",
//                     crl: "Дўконда муддатли тўлов расмийлаштириш тартиби",
//                     style: AppStyle.w600s15h20DarkBluePrimary,
//                     maxLen: 2,
//                   ),
//                   childrenPadding: EdgeInsets.zero,
//                   children: [
//                     ListTile(
//                       leading: Text("1", style: AppStyle.w500s15h20Primary),
//                       title: Translator(
//                         uz: "Mahsulotni savatchaga qo‘shing",
//                         ru: "Добавить товар в корзину",
//                         crl: "Маҳсулотни саватга киритиш",
//                         maxLen: 3,
//                         style: AppStyle.w400s13h18DarkBlue300,
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text("2", style: AppStyle.w500s15h20Primary),
//                       title: Translator(
//                         uz: 'Buyurtma rasmiylashtirish bosqichida to‘lov usuli "Muddati to‘lov" tanlang.',
//                         ru: 'На этапе оформления заказа выберите способ оплаты "Срок оплаты."',
//                         crl: 'Буюртма расмийлаштириш босқичида тўлов усули "Муддати тўлов"ни танланг.',
//                         maxLen: 3,
//                         style: AppStyle.w400s13h18DarkBlue300,
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text("3", style: AppStyle.w500s15h20Primary),
//                       title: Translator(
//                         uz: "Kerakli ma’lumotlarni to‘ldiring va operator qo‘ng‘irog‘ini kuting.",
//                         ru: "Заполните необходимую информацию и дождитесь звонка оператора.",
//                         crl: "Керакли маълумотларни тўлдиринг ва оператор қўнғироғини кутинг.",
//                         maxLen: 3,
//                         style: AppStyle.w400s13h18DarkBlue300,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: ButtonWidget(
//               textColor: AppColor.white,
//               text: "got_it".tr,
//               onTap: () => context.pop(),
//             ),
//           ),
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
// }
