import 'package:equatable/equatable.dart';

class DifferentServicesEntity extends Equatable {
  final String id;
  final String title;
  final String image;
  final String price;
  const DifferentServicesEntity(this.image, this.id, this.title, this.price);
  @override
  List<Object?> get props => [title, id, price, image];
}
