import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/src/domain/models/country.dart';

import '../widgets/card_country.dart';
import 'countries_controller.dart';

class CountriesPage extends GetWidget<CountriesController> {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Buscar País",
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: controller.search,
              ),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "Listado de paises",
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: controller.getCountries,
                    icon: const Icon(Icons.refresh),
                  )
                ],
              ),
              const SizedBox(height: 12),
              GetX<CountriesController>(
                init: controller,
                builder: (ctrl) {
                  if (ctrl.hasError) {
                    return Text(ctrl.errorMessage);
                  }
                  if (ctrl.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return Flexible(
                    child: ListView.separated(
                      itemCount: controller.filteredCountries.length,
                      itemBuilder: (context, i) {
                        Country country = controller.filteredCountries[i];
                        return CardCountry(
                            countryName: country.name,
                            shortName: country.shortName,
                            phoneCode: country.phoneCode,
                            onPressed: () => controller.openMaps(country.name));
                      },
                      separatorBuilder: (_, __) {
                        return const SizedBox(height: 4);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
