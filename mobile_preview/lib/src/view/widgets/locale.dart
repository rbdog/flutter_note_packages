import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_preview/src/external/locales/default_locales.dart';
import 'package:mobile_preview/src/view/widgets/search_field.dart';
import 'package:flutter/material.dart';

import '../../external/locales/locales.dart';

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
    final filter = useState('');

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
              text: filter.value,
              onTextChanged: (value) {
                filter.value = value;
              },
            ),
            Expanded(
              child: ListView(
                children: availableLocales.where(
                  (locale) {
                    final optFilter = filter.value.trim().toLowerCase();
                    return optFilter.isEmpty ||
                        locale.name.toLowerCase().contains(optFilter) ||
                        locale.code.toLowerCase().contains(optFilter);
                  },
                ).map(
                  (locale) {
                    final isSelected = locale.code == locale.code;
                    return ListTile(
                      onTap: !isSelected
                          ? () {
                              onSelected(locale);
                              Navigator.pop(context);
                            }
                          : null,
                      title: Text(
                        locale.name,
                      ),
                      subtitle: Text(
                        locale.code,
                      ),
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
