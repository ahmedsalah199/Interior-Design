import 'package:flutter/material.dart';

import '../../core/utils/strings_manager.dart';
import '../../domain/entities/different_services_entity.dart';

class BuildOffersAndPackages extends StatelessWidget {
  final List<DifferentServicesEntity> servicesEntity;

  const BuildOffersAndPackages(this.servicesEntity, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppStrings.offersAndPackages,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[700]),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Text(AppStrings.seeAll,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey[600])),
              ),
            ],
          ),
          ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    servicesEntity[index].image,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      servicesEntity[index].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          height: 2,
                          color: Colors.grey[700]),
                    ),
                    const Spacer(),
                    Text(
                      '${servicesEntity[index].price} ${AppStrings.eg}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.5,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
