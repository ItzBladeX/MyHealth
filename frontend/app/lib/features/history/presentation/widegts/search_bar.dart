import 'package:app/core/constants.dart';
import 'package:flutter/material.dart';

class HistorySearchBar extends StatefulWidget {
  const new({super.key});

  @override
  State<HistorySearchBar> createState() => _HistorySearchBarState();
}

class _HistorySearchBarState extends State<HistorySearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search hospitals, Diagnostics ...',
      hintStyle: const WidgetStatePropertyAll(
        TextStyle(
          color: Color(0xFF757575),
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      elevation: const WidgetStatePropertyAll(0.0), // Flat, clean look
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      ),
      leading: const Icon(
        Icons.search_rounded,
        color: Color(0xFF616161),
        size: 24.0,
      ),
    );
  }
}
