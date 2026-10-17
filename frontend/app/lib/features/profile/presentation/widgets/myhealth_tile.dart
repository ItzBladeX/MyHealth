import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/view_dialog.dart';

class MyHealthCard extends StatefulWidget {
  const new({super.key});

  @override
  State<MyHealthCard> createState() => _MyHealthCardState();
}

class _MyHealthCardState extends State<MyHealthCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // MyHealth Card
      margin: EdgeInsets.only(left: 16, right: 16),
      constraints: BoxConstraints(minHeight: 76),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorConstants.darkBlue.withValues(alpha: 0.1),
            ColorConstants.basecolor.withValues(alpha: 0.05),
            ColorConstants.shadowColor3.withValues(alpha: 0.5),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // General Row

        children: [
          SizedBox(width: 16),
          Container(
            // badge icon
            constraints: BoxConstraints(minWidth: 50, minHeight: 50),
            decoration: BoxDecoration(
              color: ColorConstants.darkBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.badge_outlined, size: 32, color: Colors.white),
          ),

          SizedBox(width: 8),

          // Text and Button
          Column(
            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MyHealth ID",
                style: TextStyle(
                  color: ColorConstants.darkBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.call_outlined,
                    color: ColorConstants.darkBlue,
                    size: 16,
                  ),
                  Text(
                    "+251938659012",
                    style: TextStyle(color: ColorConstants.darkBlue),
                  ),
                ],
              ),
            ],
          ),

          const Spacer(),

          ElevatedButton(
            onPressed: () => {showEditMedicalIdDialog(context)},

            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: ColorConstants.cardBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            ),
            child: Row(
              children: [
                Text(
                  "View Card",
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorConstants.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.chevron_right_outlined),
              ],
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

// void showDigitalMedicalId(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: true, // Closes the popup if the user taps outside
//     builder: (BuildContext context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(
//             24,
//           ), // Large rounded edges matching the image
//         ),
//         backgroundColor:
//             ColorConstants.cardBackground, // Your white/light background
//         insetPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 24,
//         ), // Creates margins around the popup
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min, // Hugs content perfectly
//             children: [
//               // 1. HEADER ROW (Title + Close Button)
//               Row(
//                 children: [
//                   const Icon(Icons.shield_outlined, color: Colors.teal),
//                   const SizedBox(width: 8),
//                   const Text(
//                     "Digital Medical ID",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const Spacer(),
//                   // Circle Close Button
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.close, size: 20),
//                     style: IconButton.styleFrom(
//                       backgroundColor: Colors.grey[200],
//                       padding: const EdgeInsets.all(8),
//                       minimumSize: Size.zero,
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               // 2. THE BLUE CARD CONTAINER
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: const Color(
//                     0xFF006699,
//                   ), // Deep blue insurance card color
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Top Row inside Card (Plan Name + NFC Icon)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               "PRIMARY HEALTH PLAN",
//                               style: TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               "BlueCross Shield",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Icon(
//                           Icons.contactless_outlined,
//                           color: Colors.white,
//                           size: 28,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),

//                     // Member Name
//                     const Text(
//                       "Member Name",
//                       style: TextStyle(color: Colors.white70, fontSize: 11),
//                     ),
//                     const Text(
//                       "SARAH JENKINS",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // Card Footer Row (ID, Group, Copay)
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withValues(
//                           alpha: 0.1,
//                         ), // Translucent inner footer
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _buildCardDetailField("ID NUMBER", "BC-884920"),
//                           _buildCardDetailField("GROUP NO.", "TX-99014"),
//                           _buildCardDetailField("COPAY", "\$20 / \$35"),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // 3. BOTTOM ACTION BUTTONS
//               Row(
//                 children: [
//                   // Share Card Button
//                   Expanded(
//                     child: OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: const Icon(Icons.share_outlined, size: 18),
//                       label: const Text("Share Card"),
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: Colors.black87,
//                         backgroundColor: const Color(
//                           0xFFEAF0F9,
//                         ), // Very light gray-blue tint
//                         side: BorderSide.none,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),

//                   // Save to Apple Wallet Button
//                   Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () {},
//                       icon: const Icon(Icons.download_rounded, size: 18),
//                       label: const Text("Save to Apple Wallet"),
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         foregroundColor: Colors.white,
//                         backgroundColor: const Color(
//                           0xFF005A43,
//                         ), // Forest green theme tint
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Widget _buildCardDetailField(String label, String value) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: const TextStyle(
//           color: Colors.white60,
//           fontSize: 9,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(height: 2),
//       Text(
//         value,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 13,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ],
//   );
// }
