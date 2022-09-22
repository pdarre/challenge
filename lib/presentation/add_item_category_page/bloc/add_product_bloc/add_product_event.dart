part of 'add_product_bloc.dart';

abstract class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}

class AddNewProductEvent extends AddProductEvent {
  final ProductUseCases productUseCases;
  final bool isSuccess;
  final String category;
  final String description;
  final File image;
  final String name;
  const AddNewProductEvent(
    this.productUseCases,
    this.isSuccess,
    this.category,
    this.description,
    this.image,
    this.name,
  );
  @override
  List<Object> get props => [isSuccess, category, description, image, name];
}
