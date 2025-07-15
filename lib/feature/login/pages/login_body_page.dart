// import 'package:clean_arxitekture/core/routes/app_routes.dart';
// import 'package:clean_arxitekture/feature/login/bloc/login_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
//
// class RegisterBody extends StatefulWidget {
//   const RegisterBody({super.key, this.phone});
//   final String? phone;
//
//   @override
//   State<RegisterBody> createState() => _RegisterBodyState();
// }
//
// class _RegisterBodyState extends State<RegisterBody> {
//   final TextEditingController phoneController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool isPhoneValid = false;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.phone != null) {
//       phoneController.text = widget.phone!;
//       _checkPhoneValidity(widget.phone!);
//     }
//
//     phoneController.addListener(() {
//       _checkPhoneValidity(phoneController.text);
//     });
//   }
//
//   void _checkPhoneValidity(String value) {
//     setState(() {
//       isPhoneValid = value.trim().length == 9;
//     });
//   }
//
//   @override
//   void dispose() {
//     phoneController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//       builder: (context, state) {
//         return state.when(
//           initial: () => Form(
//             key: _formKey,
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: phoneController,
//                     decoration: const InputDecoration(
//                       labelText: "Telefon raqami",
//                       prefixText: "+998 ",
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: isPhoneValid
//                         ? () {
//                       context.read<LoginBloc>().add(
//                         LoginEvent.registerSubmitted(
//                           phoneController.text,
//                         ),
//                       );
//                     }
//                         : null,
//                     child: const Text("Kirish"),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           loading: () => const Center(child: CircularProgressIndicator()),
//           success: (phone) => Center(child: Text("Success: $phone")),
//           failure: (error) => Center(child: Text("Xatolik: ${error.message}")),
//         );
//       },
//     );
//   }
// }
