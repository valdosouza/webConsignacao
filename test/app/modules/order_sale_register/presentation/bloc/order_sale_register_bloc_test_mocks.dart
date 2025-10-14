import 'package:mocktail/mocktail.dart';

import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_get_items.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_post.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/get_order_sale_card.dart';

class MockNewOrderSaleCard extends Mock implements GetNewOrderSaleCard {}
class MockOrderSaleRegisterPost extends Mock implements OrderSaleRegisterPost {}
class MockOrderSaleGetList extends Mock implements OrderSaleGetlist {}
class MockGetOrderSaleCard extends Mock implements GetOrderSaleCard {}

//package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_get_items.dart
//final GetNewOrderSaleCard getNewOrderSaleCard;
//package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_post.dart
//final OrderSaleRegisterPost postOrderSale;
//package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart
//final OrderSaleGetlist orderSaleGetlist;
//package:appweb/app/modules/order_sale_register/domain/usecase/get_order_sale_card.dart
//final GetOrderSaleCard getOrderSaleCard;

