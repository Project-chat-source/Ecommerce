import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning/app/global/enums/blocstatus.dart';
import 'package:learning/app/view/features/Home/domain/entities/product_response_entities.dart';
part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  final Blocstatus productStatus;
  final ProductResponseEntities products;
  final String errorMessage ;

  factory HomePageState.initial() =>
      HomePageState(productStatus: Blocstatus.initial, products : ProductResponseEntities.empty() , errorMessage: '');

  HomePageState({required this.productStatus, required this.products, required this.errorMessage});
}
