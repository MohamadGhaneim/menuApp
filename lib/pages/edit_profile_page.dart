// // ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, sort_child_properties_last

// import 'package:flutter/material.dart';
// import 'package:music/components/app_text_field.dart';
// import 'package:music/components/toolbar.dart';
// import 'package:music/components/user_avatar.dart';
// import 'package:music/config/app_strings.dart';
// import 'package:music/styles/app_colors.dart';
// import 'package:music/styles/app_text.dart';

// enum Gender { male, female, none }

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({super.key});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   var _gender = Gender.none;
//   @override
//   Widget build(BuildContext context) {
//     //double _height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: Toolbar(titel: AppStrings.profile),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(4),
//                     child: UserAvatar(height: 130, width: 130),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.all(Radius.circular(8)),
//                       ),
//                       child: Icon(
//                         color: Colors.black,
//                         Icons.camera_alt,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 60),

//               AppTextField(hint: AppStrings.firstName),
//               SizedBox(height: 16),

//               AppTextField(hint: AppStrings.lastName),
//               SizedBox(height: 16),

//               AppTextField(hint: AppStrings.phoneNumber),
//               SizedBox(height: 16),

//               AppTextField(hint: AppStrings.location),
//               SizedBox(height: 16),

//               AppTextField(hint: AppStrings.birthday),
//               SizedBox(height: 16),

//               Container(
//                 padding: const EdgeInsets.only(top: 6, left: 12, right: 12),
//                 decoration: BoxDecoration(
//                   color: AppColors.fieldColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       AppStrings.gender,
//                       style: AppText.body1.copyWith(
//                         fontSize: 16,
//                       ), // copyWith is inherits with some changes
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: RadioListTile(
//                             title: Text(AppStrings.male),
//                             value: Gender.male,
//                             visualDensity: VisualDensity(
//                               horizontal: VisualDensity.maximumDensity,
//                               vertical: VisualDensity.minimumDensity,
//                             ),
//                             contentPadding: EdgeInsets.zero,
//                             groupValue: _gender,
//                             onChanged: (value) {
//                               setState(() {
//                                 _gender = Gender.male;
//                               });
//                             },
//                           ),
//                         ),

//                         Expanded(
//                           child: RadioListTile(
//                             title: Text(AppStrings.female),
//                             value: Gender.female,
//                             visualDensity: VisualDensity(
//                               horizontal: VisualDensity.maximumDensity,
//                               vertical: VisualDensity.minimumDensity,
//                             ),
//                             contentPadding: EdgeInsets.zero,
//                             groupValue: _gender,
//                             onChanged: (value) {
//                               setState(() {
//                                 _gender = Gender.female;
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
