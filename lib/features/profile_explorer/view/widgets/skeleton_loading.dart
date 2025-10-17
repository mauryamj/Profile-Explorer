// import 'package:flutter/material.dart';

// class SkeletonLoading extends StatelessWidget {
//   const SkeletonLoading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16),
//       child: Material(
//         child: Stack(
//           fit: StackFit.expand,
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.transparent, Colors.black87],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   stops: [0.6, 1.0],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 15,
//               left: 10,
//               right: 1,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           userProfile.name,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           userProfile.city,
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w300,
//                             color: Colors.white,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       context.read<ProfileBloc>().add(
//                         ToggleLike(profileId: userProfile.userId),
//                       );
//                     },
//                     icon: Icon(
//                       userProfile.islinked
//                           ? Icons.favorite
//                           : Icons.favorite_border_outlined,
//                       color: userProfile.islinked
//                           ? Colors.redAccent
//                           : Colors.white,
//                       size: 20,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );;
//   }
// }