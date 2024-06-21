import 'package:flutter/material.dart';

/// A search field for the tool menu.
class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.hintText,
    required this.onTextChanged,
    this.text = '',
  });

  /// The current field content.
  final String text;

  /// Indicates what is the awaited content.
  final String hintText;

  /// Invoked each time the [text] is changed by the user.
  final ValueChanged<String> onTextChanged;

  @override
  SearchFieldState createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.text,
  );

  @override
  void initState() {
    _controller.addListener(() {
      widget.onTextChanged(
        _controller.text.replaceAll(' ', '').toLowerCase(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(covariant SearchField oldWidget) {
    if (widget.text != _controller.text) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _controller.text = widget.text;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  void _clear() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _controller.clear(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
            suffix: InkWell(
              onTap: _clear,
              child: const Icon(Icons.close),
            ),
          ),
        ),
      ),
    );
  }
}
