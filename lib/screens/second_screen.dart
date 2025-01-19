import 'package:flutter/material.dart';

import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String username;
  const SecondScreen({
    super.key,
    required this.username,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ThirdScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: theme.textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textViewWidget(
              username: widget.username,
              theme: theme,
            ),
            _userViewWidget(
              title: 'Select User Name',
              theme: theme,
            ),
            _buttonWidget(
              title: 'Choose a User',
              onPressed: _navigateToNextScreen,
              screenSize: screenSize,
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textViewWidget({
    required ThemeData theme,
    required String username,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          username,
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }

  Widget _userViewWidget({
    required String title,
    required ThemeData theme,
  }) {
    return Center(
      child: Text(
        title,
        style: theme.textTheme.headlineMedium,
      ),
    );
  }

  Widget _buttonWidget({
    required String title,
    required VoidCallback onPressed,
    required Size screenSize,
    required ThemeData theme,
  }) {
    return SizedBox(
      width: screenSize.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: theme.textTheme.bodyLarge
              ?.copyWith(color: theme.colorScheme.onPrimary),
        ),
      ),
    );
  }
}
