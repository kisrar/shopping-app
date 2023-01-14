import 'network_enums.dart';

typedef NetworkCallBack<R>  = R Function(dynamic);

typedef NetworkOnFailureCallBackWithMessage<R> = R Function(Map<String,dynamic>,NetworkErrorResponseType,String);