import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/teacher/addCourse/Ui/widget/add_test_bloc_listener.dart';
import 'package:learn_programtion/features/teacher/courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import 'package:learn_programtion/features/teacher/courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

import '../../../../core/DI/dependency_injection.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/color.dart';
import '../../../widget/button.dart';
import 'widget/from_test.dart';

class AddTests extends StatelessWidget {
  const AddTests({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: ColorManger.primary_ColorBlue,
              builder: ((context) {
                return BlocProvider(
                    create: (context) => CourserCubitTeacher(
                        getIt(),
                        getIt(),
                        getIt(),
                        getIt(),
                        getIt(),
                        getIt(),
                        getIt(),
                        getIt(),
                        getIt(),
                        getIt()),
                    child: FromTest(context));
              }));
        },
        backgroundColor: ColorManger.primary_ColorBlue,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text('إضافة اختبار'),
        ),
      ),
      body: BlocConsumer<CourserCubitTeacher, CourserCubitTeacherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var bb = context.read<CourserCubitTeacher>();
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 700.h,
                    child: ListView.builder(
                      itemCount: bb.quations.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 65.h,
                          width: 370.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(48, 121, 98, 248),
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 15.w),
                          child: Text(
                            bb.quations[index].question!,
                            style: FontStyleAndText.fontmedia,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    )),
                verticalBox(20.h),
                AddTestBlocListener(),
                button(
                    text: 'حفظ',
                    paddingH: 135.w,
                    paddingV: 20.h,
                    function: () {
                      bb.emitAddQuationsTeacher();
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
