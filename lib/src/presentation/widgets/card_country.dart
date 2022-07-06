import 'package:flutter/material.dart';

class CardCountry extends StatelessWidget {
  const CardCountry({
    Key? key,
    required this.countryName,
    required this.shortName,
    required this.phoneCode,
    required this.onPressed,
  }) : super(key: key);

  final String countryName;
  final String shortName;
  final int phoneCode;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              MaterialButton(
                color: Colors.orange,
                onPressed: onPressed,
                child: Text(
                  "GO",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      countryName,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Short name: $shortName",
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      "Phone code: +$phoneCode",
                      style: theme.textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
