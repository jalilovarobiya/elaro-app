import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageBody extends StatefulWidget {
  const LanguageBody({super.key});

  @override
  _LanguageBodyState createState() => _LanguageBodyState();
}

class _LanguageBodyState extends State<LanguageBody> {
  Locale? _selectedLocale;

  // @override
  // void initState() {
  //   _selectedLocale = context.locale;
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (mounted) {
  //     setState(() {
  //       _selectedLocale = context.locale;
  //     });
  //   }
  // }

  void _changeLanguage(Locale locale) async {
    try {
      await context.setLocale(locale);
      setState(() {
        _selectedLocale = locale;
      });
    } catch (e) {
      print('Til o‘zgartirish xatosi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = _selectedLocale ?? context.locale;
    return Column(
      children: [
        _buildRadioTile(const Locale('uz'), 'O\'zbekcha', currentLocale),
        _buildRadioTile(const Locale('en'), 'English', currentLocale),
        _buildRadioTile(const Locale('ru'), 'Русский', currentLocale),
      ],
    );
  }

  Widget _buildRadioTile(Locale locale, String title, Locale currentLocale) {
    return RadioListTile<Locale>(
      title: Text(title),
      value: locale,
      groupValue: currentLocale,
      onChanged: (Locale? value) {
        if (value != null) {
          _changeLanguage(value);
        }
      },
    );
  }
}
