import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/app_text_field_widget.dart';
import 'package:esu/features/auth/data/model/response/lookup/lookup_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_page/search_page.dart';

class CountryPickerFieldWidget extends StatefulWidget {
  const CountryPickerFieldWidget({
    Key? key,
    required this.countryNameCallBack,
    required this.list,
    this.initValue,
  }) : super(key: key);
  final void Function(LookupDataResponseModel country) countryNameCallBack;
  final List<LookupDataResponseModel> list;
  final int? initValue;

  @override
  State<CountryPickerFieldWidget> createState() => _CountryPickerFieldState();
}

class _CountryPickerFieldState extends State<CountryPickerFieldWidget> {
  final countryNameTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initValue != null && widget.list.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final country = widget.list.firstWhere((element) => element.id == widget.initValue);
        countryNameTEC.text = country.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFieldWidget(
      controller: countryNameTEC,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: true,
      hint: LocalizationKeys.select.tr,
      onTap: () => showSearch(
        context: context,
        delegate: SearchPage<LookupDataResponseModel>(
          onQueryUpdate: (s) {},
          items: widget.list,
          searchLabel: LocalizationKeys.search.tr,
          suggestion: Center(
            child: Text(LocalizationKeys.searchToFindCountry.tr),
          ),
          failure: Center(
            child: Text(LocalizationKeys.noCountryMatched.tr),
          ),
          filter: (country) => [country.name, country.nameAr],
          builder: (country) => ListTile(
            onTap: () {
              Get.back();
              countryNameTEC.text = Get.locale.toString() == 'ar' ? country.nameAr : country.name;
              widget.countryNameCallBack(country);
              setState(() {});
            },
            title: Text(
              Get.locale.toString() == 'ar' ? country.nameAr : country.name,
              style: const TextStyle(color: AppColors.primaryColor),
            ),
            subtitle: Text(
              Get.locale.toString() == 'ar' ? country.name : country.nameAr,
              style: const TextStyle(color: AppColors.primaryLightColor),
            ),
          ),
        ),
      ),
      validator: (value) {
        if (countryNameTEC.text.trim().isEmpty) {
          return LocalizationKeys.thisFieldIsRequired.tr;
        } else {
          return null;
        }
      },
    );
  }
}
