// import 'package:flutter/material.dart';
// import 'package:skeletons/skeletons.dart';
// import '/const/import_const.dart';
//
// class SkeletonWidget extends StatelessWidget {
//   const SkeletonWidget({Key? key, this.child}) : super(key: key);
//   final Widget? child;
//
//   @override
//   Widget build(BuildContext context) {
//     return SkeletonTheme(
//       shimmerGradient: const LinearGradient(
//         colors: [
//           Styles.white9,
//           Styles.white11,
//           Styles.white11,
//           Styles.white11,
//           Styles.white9,
//         ],
//         stops: [0.0, 0.3, 0.5, 0.7, 1],
//         begin: Alignment(-2.4, -0.2),
//         end: Alignment(2.4, 0.2),
//         tileMode: TileMode.clamp,
//       ),
//       child: child ?? const ListSkeletonWidget(),
//     );
//   }
// }
//
// class ListSkeletonWidget extends StatelessWidget {
//   const ListSkeletonWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(8),
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 5,
//       itemBuilder: (context, index) => Container(
//         padding: const EdgeInsets.all(8),
//         decoration: Styles.boxDecoration1(),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 const SkeletonAvatar(
//                   style: SkeletonAvatarStyle(shape: BoxShape.circle),
//                 ),
//                 const SizedBox(width: 8),
//                 SkeletonParagraph(
//                   style: SkeletonParagraphStyle(
//                     lines: 2,
//                     spacing: 6,
//                     lineStyle: SkeletonLineStyle(
//                       height: 10,
//                       randomLength: true,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ).expand(),
//               ],
//             ),
//             const SizedBox(height: 5),
//             SkeletonParagraph(
//               style: SkeletonParagraphStyle(
//                 lines: 3,
//                 spacing: 8,
//                 lineStyle: SkeletonLineStyle(
//                   height: 8,
//                   randomLength: true,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             SkeletonLine(
//               style: SkeletonLineStyle(
//                 width: 64,
//                 height: 8,
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
