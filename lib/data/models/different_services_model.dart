import 'package:interior_design/domain/entities/different_services_entity.dart';

class DifferentServicesModel extends DifferentServicesEntity {
  const DifferentServicesModel(super.image, super.id, super.title, super.price);

  factory DifferentServicesModel.fromJson(Map<String, dynamic> json) {
    return DifferentServicesModel(
      json['image'],
      json['id'],
      json['title'],
      json['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "title": title,
        "price": price,
      };
}
