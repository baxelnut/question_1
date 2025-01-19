import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();
  String _palindromeHint = 'Palindrome';

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  bool isPalindrome(String text) {
    String cleanedText =
        text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');

    return cleanedText == reversedText;
  }

  void _checkPalindrome() {
    String text = _palindromeController.text.trim();

    if (text.isEmpty) {
      setState(() {
        _palindromeHint = 'Please enter text';
      });
      return;
    }

    bool palindrome = isPalindrome(text);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Result'),
        content: Text(
          palindrome ? 'isPalindrome' : 'not palindrome',
        ),
        actions: [
          TextButton(
            onPressed: () {
              _palindromeController.clear();
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _navigateToNextScreen() {
    String username = _nameController.text.trim();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(
          username: username,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            height: screenSize.height,
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: screenSize.width / 6,
                  backgroundColor: Colors.transparent,
                  backgroundImage: const AssetImage('assets/ic_photo.png'),
                ),
                const SizedBox(height: 60),
                _textFieldWidget(
                  hintText: 'Name',
                  controller: _nameController,
                  theme: theme,
                ),
                const SizedBox(height: 30),
                _textFieldWidget(
                  hintText: _palindromeHint,
                  controller: _palindromeController,
                  theme: theme,
                ),
                const SizedBox(height: 60),
                _buttonWidget(
                  title: 'CHECK',
                  onPressed: _checkPalindrome,
                  screenSize: screenSize,
                  theme: theme,
                ),
                const SizedBox(height: 30),
                _buttonWidget(
                  title: 'NEXT',
                  onPressed: _navigateToNextScreen,
                  screenSize: screenSize,
                  theme: theme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFieldWidget({
    required String hintText,
    required TextEditingController controller,
    required ThemeData theme,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          color: const Color(0x6867775C),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
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
