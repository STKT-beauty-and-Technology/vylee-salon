// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../../../common/common widgets/custom_appbar.dart';
// import '../../../../common/common widgets/custom_form_field.dart';
// import '../../../../core/load_image/image_loader.dart';
// import '../../../../core/path/image_path.dart';
// import '../../../../core/responsive/size_config.dart';
// import '../../../../themes/app_colors.dart';

// class UploadDocument extends StatefulWidget {
//   const UploadDocument({super.key});

//   @override
//   State<UploadDocument> createState() => _UploadDocumentState();
// }

// class _UploadDocumentState extends State<UploadDocument> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController descriptionController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: CustomAppBar(
//         leadingWidget: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: ImageLoader.asset(
//             ImagePath.vyleeTextLogo,
//             height: 10,
//             width: 50,
//             fit: BoxFit.contain,
//           ),
//         ),
//         height: 100,
//         backgroundColor: AppColors.appViolet,
//         leadingWidth: 100,
//       ),
//       body:
//       SizedBox(
//         width: SizeConfig.screenWidth,
//         height: SizeConfig.screenHeight! * 0.9,
//         child:  Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back_ios_rounded,
//                       size: 20,
//                       weight: 100,
//                       color: AppColors.appViolet,
//                     )),
//                 const Text(
//                   "UPLOAD BUSINESS DOCUMENTS",
//                   style: TextStyle(
//                       color: AppColors.appViolet,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16),
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: SizeConfig.screenWidth! * 0.7,
//               child: Form(
//                 onChanged: () => _formKey,
//                 key: _formKey,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 12,
//                     ),
//                     const Row(
//                        children: [
//                         Text(
//                           "Upload Identity Proof",
//                           style: TextStyle(
//                               color: AppColors.appViolet,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       height: SizeConfig.screenHeight! * 0.16,
//                       child: CustomFormField(
//                           isEnabled: true,
//                           height: 0,
//                           keyboardType: TextInputType.multiline,
//                           isMultiline: true,
//                           width: double.infinity,
//                           controller: descriptionController),
//                     ),
//                   ],
//                 ) ,
                
//               )
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
