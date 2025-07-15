// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import '../bloc/login_bloc.dart';
// import 'login_body_page.dart';
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key, required this.phone});
//   final String? phone;
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }
// class _RegisterPageState extends State<RegisterPage> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginBloc(),
//       child: BlocListener<LoginBloc, LoginState>(
//         listener: (context, state) {
//           state.maybeWhen(
//             success: (phone) {
//               context.go("/otp");
//             },
//             failure: (error) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("Xatolik: ${error.message}")),
//               );
//             },
//             orElse: () {},
//           );
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               "Xush kelibsiz!",
//               style: TextStyle(color: Colors.black),
//             ),
//             centerTitle: true,
//             backgroundColor: Colors.white,
//             iconTheme: const IconThemeData(color: Colors.white),
//           ),
//           body: RegisterBody(phone: widget.phone),
//         ),
//       ),
//     );
//   }
// }
