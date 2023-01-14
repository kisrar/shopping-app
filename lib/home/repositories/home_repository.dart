import 'package:flutter/material.dart';
import '../../login/models/models.dart';
import '/services/network/network.dart';

abstract class HomeRepository {
  Future<ProductsResponseModel?> getProducts({required int page});
}

class HomeRepositoryImp implements HomeRepository {
  final NetworkService apiClient;
  HomeRepositoryImp({required this.apiClient});
  @override
  Future<ProductsResponseModel?> getProducts({required int page}) async {
    ProductsResponseModel? productsResponseModel =
        await apiClient.sendRequest<ProductsResponseModel?>(
            requestType: RequestType.get,
            url: EndPoints.getProducts,
            queryParameters: <String, dynamic>{
              'page_no': page,
              'url_key': 'makeup',
              'page_size': 10,
            },
            onSuccess: (response) {
              return ProductsResponseModel.fromJson(response);
            },
            onFailure: (response, errorType, msg) {
              debugPrint(
                  'Erro in getProducts(), type : $errorType, message : $msg');
            });
    return productsResponseModel;
  }
}
