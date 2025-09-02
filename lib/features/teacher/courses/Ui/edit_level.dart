// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:learn_programtion/core/helper/extention.dart';
// import 'package:learn_programtion/core/helper/spacing.dart';
// import 'package:learn_programtion/core/routing/router.dart';
// import 'package:learn_programtion/core/theming/color.dart';
// import 'package:learn_programtion/core/theming/font_style.dart';
// import 'package:learn_programtion/features/widget/button.dart';
// import 'package:learn_programtion/features/widget/text_from.dart';

// import '../../addCourse/Ui/widget/lession_item.dart';
// import '../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';

// class EditeLevelCourseTeacher extends StatelessWidget {
//   const EditeLevelCourseTeacher({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           final cubit = context.read<CourserCubitTeacher>();
//           showDialog(
//             context: context,
//             builder: (dialogContext) {
//               return AlertDialog(
//                 content: Container(
//                   padding: EdgeInsets.symmetric(vertical: 20.h),
//                   height: 270.h,
//                   width: 400.w,
//                   child: Column(
//                     children: [
//                       FromFields(
//                         vaildet: (value) {
//                           if (value?.isEmpty ?? true) {
//                             return 'الرجاء ادخال الاسم';
//                           }
//                           return null;
//                         },
//                         hint: 'ادخل الاسم',
//                         controller: cubit.controller3,
//                         // init_value: cubit.selectedlevel!.name,
//                         icon: const Icon(Icons.question_answer_rounded),
//                         keyboardType: TextInputType.name,
//                         context: dialogContext,
//                       ),
//                       verticalBox(10.h),
//                       FromFields(
//                         vaildet: (value) {
//                           if (value?.isEmpty ?? true) {
//                             return 'الرجاء ادخال عدد الدروس';
//                           }
//                           return null;
//                         },
//                         hint: 'ادخل عدد الدروس',
//                         controller: cubit.controller4,
//                         icon: const Icon(Icons.question_answer_rounded),
//                         keyboardType: TextInputType.name,
//                         // init_value:
//                         //     cubit.selectedlevel!.num_of_lesson.toString(),
//                         context: dialogContext,
//                       ),
//                       verticalBox(10.h),
//                       button(
//                         text: 'تعديل',
//                         paddingH: 90.w,
//                         paddingV: 16.h,
//                         function: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//         backgroundColor: ColorManger.primary_ColorBlue,
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         title: const Align(
//           alignment: Alignment.centerRight,
//           child: Text(' كورس'),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20.0),
//               child: SizedBox(
//                 height: 730.h,
//                 child: ListView.builder(
//                   itemCount: 3,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 13.0,
//                         horizontal: 10.w,
//                       ),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(48, 121, 98, 248),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: ExpansionTile(
//                           title: Text(
//                             'aaa',
//                             style: FontStyleAndText.fontmedia,
//                           ),
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(10.0),
//                               child: InkWell(child: LessionItem('cccc')),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(10.0),
//                               child: InkWell(child: LessionItem('cccc')),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(10.0),
//                               child: InkWell(child: LessionItem('cccc')),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             button(
//               text: 'إضافة',
//               paddingH: 135.w,
//               paddingV: 20.h,
//               function: () {
//                 context.pushNamed(Routers.add_lession);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
