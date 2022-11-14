import 'package:appweb/app/modules/product_register/data/datasource/product_register_datasource.dart';
import 'package:appweb/app/modules/product_register/data/repository/product_register_repository_impl.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_delete.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_get.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_get_list.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_post.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_put.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_bloc.dart';
import 'package:appweb/app/modules/product_register/presentation/pages/product_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ProductRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<ProductRegisterDataSource>(
          (i) => ProductRegisterDataSourceImpl(),
        ),
        Bind.factory(
          (i) => ProductRegisterRepositoryImpl(
              datasource: i.get<ProductRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => ProductRegisterGetlist(
              repository: i.get<ProductRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => ProductRegisterPost(
              repository: i.get<ProductRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => ProductRegisterPut(
              repository: i.get<ProductRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => ProductRegisterDelete(
              repository: i.get<ProductRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => ProductRegisterGet(
              repository: i.get<ProductRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => ProductRegisterBloc(
              getlist: i.get<ProductRegisterGetlist>(),
              post: i.get<ProductRegisterPost>(),
              put: i.get<ProductRegisterPut>(),
              delete: i.get<ProductRegisterDelete>(),
              get: i.get<ProductRegisterGet>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProductRegister()),
  ];
}
