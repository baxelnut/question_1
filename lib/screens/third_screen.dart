import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

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
          'Third Screen',
          style: theme.textTheme.headlineSmall,
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
