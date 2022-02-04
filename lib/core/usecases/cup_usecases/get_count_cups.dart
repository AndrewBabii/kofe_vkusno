import 'package:kofe_vkusno/core/repositories/cups_repository.dart';
import 'package:kofe_vkusno/core/usecases/local_storage_usecase.dart';

class GetCountCups extends LocalStorageUsecase<int?> {
  final CupsRepository repository;

  GetCountCups({required this.repository});

  @override
  Future<int?> call() async {
    return await repository.getCountCups();
  }

}