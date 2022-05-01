import 'package:boilerplate/features/home/presentation/widgets/finance_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Finance')),
      body: ListView.separated(
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        separatorBuilder: (context, index) => SizedBox(height: 14.h),
        itemBuilder: (context, index) => const FinanceItemWidget(),
      ),
    );
  }
}
