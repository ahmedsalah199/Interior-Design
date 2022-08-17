import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:interior_design/domain/entities/different_services_entity.dart';

import '../../core/utils/strings_manager.dart';

class BuildDifferentServices extends StatelessWidget {
  final List<DifferentServicesEntity> servicesEntity;
  const BuildDifferentServices(this.servicesEntity, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppStrings.differentServices,
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
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        servicesEntity[index].image,
                        height: 90,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 140,
                      height: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            servicesEntity[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                height: 2,
                                color: Colors.grey[700]),
                          ),
                          Text(AppStrings.appName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey[600])),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${servicesEntity[index].price} ${AppStrings.eg}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  height: 2,
                                  color: Colors.blue),
                            ),
                            rateBar(),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Text(AppStrings.book,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rateBar() {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 4,
      itemSize: 15,
      itemPadding: const EdgeInsets.symmetric(vertical: 3.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
