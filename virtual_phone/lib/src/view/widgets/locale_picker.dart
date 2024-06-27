import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';

import '../../external/locales/default_locales.dart';
import '../../external/locales/locales.dart';
import 'search_field.dart';

/// A page for picking a simulated locale.
class LocalePicker extends HookWidget {
  const LocalePicker({
    super.key,
    required this.locale,
    required this.onSelected,
  });

  final NamedLocale locale;
  final void Function(NamedLocale locale) onSelected;

  @override
  Widget build(BuildContext context) {
    final filterString = useState('');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Locale'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            SearchField(
              hintText: 'Search by locale name or code',
              text: filterString.value,
              onTextChanged: (value) {
                filterString.value = value;
              },
            ),
            Expanded(
              child: ListView(
                children: availableLocales.where(
                  (it) {
                    final filter = filterString.value.trim().toLowerCase();
                    final matchName = it.name.toLowerCase().contains(filter);
                    final matchCode = it.code.toLowerCase().contains(filter);
                    return filter.isEmpty || matchName || matchCode;
                  },
                ).map(
                  (it) {
                    final isSelected = it.code == locale.code;
                    final onTap = isSelected
                        ? null
                        : () {
                            onSelected(it);
                            Navigator.pop(context);
                          };
                    return ListTile(
                      onTap: onTap,
                      title: Text(it.name),
                      subtitle: Text(it.code),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
