import 'package:app/core/constants.dart';
import 'package:flutter/material.dart';

class LanguageTile extends StatefulWidget {

  const LanguageTile({
    super.key,

  });

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  final String currentLanguage = "English (United States )";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>(),
      borderRadius: BorderRadius.circular(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: ColorConstants.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.translate, color: ColorConstants.darkBlue),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'English (United States)',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'English',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right)
            ],
          ),
        ],
      ),
    );
  }
}
