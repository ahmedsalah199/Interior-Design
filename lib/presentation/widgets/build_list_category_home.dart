import 'package:flutter/material.dart';
import 'package:interior_design/core/utils/strings_manager.dart';

import '../cubit/app_cubit.dart';

class BuildListViewCategory extends StatelessWidget {
  final AppCubit cubit;
  const BuildListViewCategory(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            cubit.changeSelectedIndexListView(index);
            cubit.getDifferentServices();
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: index == cubit.selectedIndex
                    ? Colors.orangeAccent
                    : Colors.transparent),
            child: Text(AppStrings.designOfChildren,
                style: index == cubit.selectedIndex
                    ? const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)
                    : const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey)),
          ),
        ),
      ),
    );
  }
}
