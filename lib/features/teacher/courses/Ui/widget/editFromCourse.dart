// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/color.dart';
import '../../../../../core/theming/font_style.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text_from.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';

class EditeFormCourses extends StatefulWidget {
  const EditeFormCourses({super.key});

  @override
  State<EditeFormCourses> createState() => _FormCoursesState();
}

String values = 'jjjj';
int cc = 0;
List<String> vv = [
  'jjjj',
  'jjjj22',
  'jjjj33',
  'jjjj44',
];
final List<DropdownMenuItem<String>> hhh = vv
    .map((e) => DropdownMenuItem<String>(
          value: e,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              e,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ))
    .toList();

class _FormCoursesState extends State<EditeFormCourses> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<CourserCubitTeacher>().keye,
        child: Column(
          children: [
            FromFields(
                color: Color.fromARGB(48, 121, 98, 248),
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال الاسم';
                  }
                },
                paddingContentV: 18.h,
                // init_value:
                // BlocProvider.value(value:BlocProvider.of<CourserCubitTeacher>(context)).,
                // context.read<CourserCubitTeacher>().selectedcorse!.name,
                hint: 'الاسم',
                controller: context.read<CourserCubitTeacher>().controllername,
                icon: SizedBox.shrink(),
                keyboardType: TextInputType.name,
                context: context),
            verticalBox(10.h),
            FromFields(
                color: Color.fromARGB(48, 121, 98, 248),
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال رابط الصورة';
                  }
                },
                paddingContentV: 18.h,
                hint: 'رابط الصورة ',
                controller: context.read<CourserCubitTeacher>().controllerimage,
                icon: SizedBox.shrink(),
                // init_value:
                //     context.read<CourserCubitTeacher>().selectedcorse!.image,
                keyboardType: TextInputType.emailAddress,
                context: context),
            verticalBox(10.h),
            FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال مدة الكورس';
                  }
                },
                color: Color.fromARGB(48, 121, 98, 248),
                paddingContentV: 18.h,
                hint: ' مدة الكورس',
                controller: context.read<CourserCubitTeacher>().controllertime,
                keyboardType: TextInputType.number,
                // init_value: context
                //     .read<CourserCubitTeacher>()
                //     .selectedcorse!
                //     .time
                //     .toString(),
                context: context,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('بالدقائق'),
                )),
            verticalBox(10.h),
            Container(
              height: 65.h,
              width: 390.w,
              decoration: BoxDecoration(
                  color: Color.fromARGB(48, 121, 98, 248),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
              child: DropdownButton(
                items: hhh,
                value: values,
                underline: Container(),
                isExpanded: true,
                icon: Icon(
                  Icons.arrow_downward,
                  color: ColorManger.font,
                ),
                hint: Center(child: Text(values)),
                onChanged: (value) {
                  setState(() {
                    values = value!;
                  });
                },
              ),
            ),
            verticalBox(13.h),
            Container(
              height: 65.h,
              width: 390.w,
              decoration: BoxDecoration(
                  color: Color.fromARGB(48, 121, 98, 248),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Icon(Icons.add),
                    onTap: () {
                      setState(() {
                        cc++;
                      });
                    },
                  ),
                  Text(
                    '${cc}',
                    style: FontStyleAndText.fontsmall,
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Icon(Icons.minimize_outlined),
                    ),
                    onTap: () {
                      setState(() {
                        cc--;
                      });
                    },
                  ),
                ],
              ),
            ),
            verticalBox(13.h),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'الرجاء ادخال وصف الكورس';
                }
                return null;
              },
              controller:
                  context.read<CourserCubitTeacher>().controllerdescription,
              cursorColor: Colors.white,
              // initialValue:
              //     context.read<CourserCubitTeacher>().selectedcorse!.descrip,
              maxLines: 12,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w200,
                color: ColorManger.font,
              ),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(48, 121, 98, 248),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 150.h, horizontal: 50.w),
                  hintText: 'وصف الكورس',
                  hintStyle: FontStyleAndText.textfrom,
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: ColorManger.primary_ColorYello)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red))),
              keyboardType: TextInputType.name,
            ),
            verticalBox(20.h),
            button(
                text: ' تعديل كورس',
                paddingH: 135.w,
                paddingV: 20.h,
                function: () {
                  Vildatorcourse(context);
                })
          ],
        ));
  }
}

void Vildatorcourse(BuildContext context) {
  if (context.read<CourserCubitTeacher>().keye.currentState!.validate()) {
    // context.read<CourserCubitTeacher>().emitSingin();
  }
}
