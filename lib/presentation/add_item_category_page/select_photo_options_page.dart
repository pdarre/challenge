import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../common_widgets/re_usable_select_photo_button.dart';

class SelectPhotoOptionsScreen extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const SelectPhotoOptionsScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            SelectPhoto(
              onTap: () => onTap(ImageSource.gallery),
              icon: Icons.image,
              textLabel: 'Browse Gallery',
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'OR',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectPhoto(
              onTap: () => onTap(ImageSource.camera),
              icon: Icons.camera_alt_outlined,
              textLabel: 'Use a Camera',
            ),
          ])
        ],
      ),
    );
  }
}

// class SelectPhotoOptionsScreen extends StatelessWidget {
//   final Function(ImageSource source) onTap;
//   const SelectPhotoOptionsScreen({
//     Key? key,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Stack(
//         alignment: AlignmentDirectional.topCenter,
//         clipBehavior: Clip.none,
//         children: [
//           Positioned(
//             top: -35,
//             child: Container(
//               width: 50,
//               height: 6,
//               margin: const EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(2.5),
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Column(children: [
//             SelectPhoto(
//               onTap: () => onTap(ImageSource.gallery),
//               icon: Icons.image,
//               textLabel: 'Browse Gallery',
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Center(
//               child: Text(
//                 'OR',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SelectPhoto(
//               onTap: () => onTap(ImageSource.camera),
//               icon: Icons.camera_alt_outlined,
//               textLabel: 'Use a Camera',
//             ),
//           ])
//         ],
//       ),
//     );
//   }
// }

// class SelectPhoto extends StatelessWidget {
//   final Function onTap;
//   final IconData icon;
//   final String textLabel;
//   const SelectPhoto({
//     super.key,
//     required this.onTap,
//     required this.icon,
//     required this.textLabel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => onTap,
//       child: Text(textLabel),
//     );
//   }
// }
