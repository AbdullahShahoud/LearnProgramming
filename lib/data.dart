// import 'package:learn_programtion/features/courses/logic/m'assets/image/images.pngodel/courses_response.dart';
// import 'package:learn_programtion/features/notification/logic/model/notification_response.dart';

// import 'features/courses/logic/model/courses_me_response.dart';

// final List<CoursesResponse> courses = [
//   CoursesResponse(
//     id: '101',
//     name: 'أساسيات البرمجة بلغة Dart',
//     image: ',
//     nameTeacher: 'د. خالد فهد',
//     type: 'برمجة',
//     time: '10 ساعات',
//     descrip: 'دورة شاملة لتعلم البرمجة باستخدام لغة Dart من البداية.',
//     check: true,
//     finalTest: Test(
//       question: List.generate(
//           6,
//           (index) => Question(
//                 question: 'ما نوع اللغة Dart؟',
//                 responseOne: 'لغة برمجة كائنية',
//                 responseTwo: 'لغة تجميعية',
//                 responseThree: 'لغة منخفضة المستوى',
//               )),
//       responseCorrect: ['لغة برمجة كائنية'],
//     ),
//     level: List.generate(
//         3,
//         (levelIndex) => Level(
//               name: 'المستوى ${levelIndex + 1}',
//               check: levelIndex == 0,
//               test: Test(
//                 question: List.generate(
//                     6,
//                     (index) => Question(
//                           question: 'ما هي الجملة المستخدمة لطباعة نص؟',
//                           responseOne: 'print()',
//                           responseTwo: 'show()',
//                           responseThree: 'output()',
//                         )),
//                 responseCorrect: ['print()'],
//               ),
//               lessons: List.generate(
//                   4,
//                   (lessonIndex) => Lesson(
//                         id: 'd_${levelIndex}_$lessonIndex',
//                         name: 'الدرس ${lessonIndex + 1}',
//                         video:
//                             'https://example.com/videos/lesson_${lessonIndex + 1}.mp4',
//                         descrption: 'شرح الدرس ${lessonIndex + 1}',
//                         check: lessonIndex % 2 == 0,
//                       )),
//             )),
//   ),
//   CoursesResponse(
//     id: '102',
//     name: 'تطوير واجهات Flutter',
//     image: 'assets/image/images.png',
//     nameTeacher: 'أ. منال السيد',
//     type: 'تطوير واجهات',
//     time: '12 ساعة',
//     descrip: 'تعلم إنشاء تطبيقات Flutter بواجهات احترافية.',
//     check: false,
//     finalTest: Test(
//       question: [
//         Question(
//           question: 'ما هي الـ Widget الأساسية في Flutter؟',
//           responseOne: 'MaterialApp',
//           responseTwo: 'HtmlApp',
//           responseThree: 'UiKitApp',
//         )
//       ],
//       responseCorrect: ['MaterialApp'],
//     ),
//     level: List.generate(
//         4,
//         (levelIndex) => Level(
//               name: 'مرحلة ${levelIndex + 1}',
//               check: false,
//               test: Test(
//                 question: [
//                   Question(
//                     question: 'ما الفرق بين Column و Row؟',
//                     responseOne: 'Column عمودي، Row أفقي',
//                     responseTwo: 'كلاهما أفقي',
//                     responseThree: 'كلاهما عمودي',
//                   )
//                 ],
//                 responseCorrect: ['Column عمودي، Row أفقي'],
//               ),
//               lessons: List.generate(
//                   5,
//                   (lessonIndex) => Lesson(
//                         id: 'f_${levelIndex}_$lessonIndex',
//                         name: 'واجهة ${lessonIndex + 1}',
//                         video:
//                             'https://example.com/videos/ui_${lessonIndex + 1}.mp4',
//                         descrption:
//                             'بناء واجهة ${lessonIndex + 1} باستخدام Flutter',
//                         check: true,
//                       )),
//             )),
//   ),
//   CoursesResponse(
//     id: '103',
//     name: 'احتراف إدارة الحالة باستخدام Bloc',
//     image: 'assets/image/images.png',
//     nameTeacher: 'م. سامي بشير',
//     type: 'إدارة الحالة',
//     time: '8 ساعات',
//     descrip: 'تعلم إدارة حالة التطبيق بكفاءة باستخدام Bloc و Cubit.',
//     check: true,
//     finalTest: Test(
//       question: [
//         Question(
//           question: 'ما هو Bloc؟',
//           responseOne: 'نمط لإدارة الحالة',
//           responseTwo: 'مكون من الواجهة',
//           responseThree: 'مكتبة صوتيات',
//         )
//       ],
//       responseCorrect: ['نمط لإدارة الحالة'],
//     ),
//     level: [
//       Level(
//         name: 'التهيئة',
//         check: true,
//         test: Test(
//           question: [
//             Question(
//               question: 'ما الفرق بين Bloc و Cubit؟',
//               responseOne: 'Cubit أسهل وأخف',
//               responseTwo: 'Bloc أسرع دائمًا',
//               responseThree: 'لا فرق كبير',
//             )
//           ],
//           responseCorrect: ['Cubit أسهل وأخف'],
//         ),
//         lessons: [
//           Lesson(
//               id: 'b1',
//               name: 'مقدمة Bloc',
//               video: '',
//               descrption: '',
//               check: true),
//           Lesson(
//               id: 'b2',
//               name: 'Cubit vs Bloc',
//               video: '',
//               descrption: '',
//               check: false),
//           Lesson(
//               id: 'b3',
//               name: 'BlocBuilder',
//               video: '',
//               descrption: '',
//               check: true),
//         ],
//       ),
//       Level(
//         name: 'المستوى المتقدم',
//         check: false,
//         test: Test(
//           question: [
//             Question(
//               question: 'متى تستخدم BlocConsumer؟',
//               responseOne: 'عند الحاجة لتفاعل وحالة',
//               responseTwo: 'للبحث فقط',
//               responseThree: 'للأزرار فقط',
//             )
//           ],
//           responseCorrect: ['عند الحاجة لتفاعل وحالة'],
//         ),
//         lessons: List.generate(
//             5,
//             (i) => Lesson(
//                   id: 'adv_$i',
//                   name: 'درس متقدم $i',
//                   video: '',
//                   descrption: 'مفهوم متقدم',
//                   check: false,
//                 )),
//       )
//     ],
//   ),
//   CoursesResponse(
//     id: '104',
//     name: 'تصميم تجربة المستخدم UI/UX',
//     image: 'assets/image/images.png',
//     nameTeacher: 'د. رانيا فؤاد',
//     type: 'تصميم',
//     time: '6 ساعات',
//     descrip: 'فهم مبادئ التصميم وتجربة المستخدم لتطبيقات الموبايل.',
//     check: false,
//     finalTest: Test(
//       question: [
//         Question(
//           question: 'ما هو UI؟',
//           responseOne: 'واجهة المستخدم',
//           responseTwo: 'نظام التشغيل',
//           responseThree: 'ملف الصور',
//         )
//       ],
//       responseCorrect: ['واجهة المستخدم'],
//     ),
//     level: [
//       Level(
//         name: 'الأساسيات',
//         check: true,
//         test: Test(
//           question: [
//             Question(
//               question: 'ما الفرق بين UI و UX؟',
//               responseOne: 'UI الشكل، UX التجربة',
//               responseTwo: 'UI صوت، UX حركة',
//               responseThree: 'لا فرق',
//             )
//           ],
//           responseCorrect: ['UI الشكل، UX التجربة'],
//         ),
//         lessons: [
//           Lesson(
//               id: 'ux1',
//               name: 'مقدمة التصميم',
//               video: '',
//               descrption: '',
//               check: true),
//           Lesson(
//               id: 'ux2',
//               name: 'ألوان وتنسيق',
//               video: '',
//               descrption: '',
//               check: false),
//           Lesson(
//               id: 'ux3',
//               name: 'تجربة المستخدم',
//               video: '',
//               descrption: '',
//               check: true),
//           Lesson(
//               id: 'ux4',
//               name: 'اختبارات UX',
//               video: '',
//               descrption: '',
//               check: false),
//         ],
//       )
//     ],
//   ),
// ];
