import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContractLinksWidget extends StatelessWidget {
  const ContractLinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async => await HelperMethod.launchToBrowser(
            'https://esu.ac.ae/wp-content/uploads/2021/10/pro_con.pdf',
          ),
          child: Text(
            LocalizationKeys.bachelorMasterContractDownloadLink.tr,
            style: const TextStyle(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async => await HelperMethod.launchToBrowser(
            'https://esu.ac.ae/wp-content/uploads/2021/11/phd_co_04.pdf',
          ),
          child: Text(
            LocalizationKeys.phdContractDownloadLink.tr,
            style: const TextStyle(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          LocalizationKeys.theContractMustBeSignedHandwrittenAndOnAllPages.tr,
          style: const TextStyle(color: Colors.red, fontSize: 13),
        ),
      ],
    );
  }
}
