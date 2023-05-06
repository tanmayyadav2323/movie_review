
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// import '../../models/user_model.dart' as UserModel;

// class SplashScreen extends StatefulWidget {
//   static const routename = '/splashscreen';
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final AuthService authService = AuthService();

//   @override
//   void initState() {
//     checkUserData();
//     super.initState();
//   }

//   void checkUserData() async {
//     await authService.getUserData(context).then((value) async {
//       final UserModel.User user =
//           Provider.of<UserProvider>(context, listen: false).user;

//       if (user.token.isEmpty) {
//         Navigator.pushNamedAndRemoveUntil(
//           context,
//           LoginScreen.routename,
//           (route) => false,
//         );
//       } else if (user.imageUrl == '') {
//         Navigator.pushNamedAndRemoveUntil(
//           context,
//           ChooseAvatarScreen.routename,
//           (route) => false,
//         );
//       } else {
//         await StreamApi.initUser(
//           StreamChat.of(context).client,
//           name: '',
//           imageUrl: SessionHelper.imageUrl,
//           id: SessionHelper.id,
//           context: context,
//         ).then((value) {
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             DashBoardScreen.routename,
//             (route) => false,
//           );
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: BigLoadAnimations(),
//     );
//   }
// }
