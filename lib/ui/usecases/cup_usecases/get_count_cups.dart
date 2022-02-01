import 'package:kofe_vkusno/core/usecases/local_storage_usecase.dart';
import 'package:kofe_vkusno/models/repositories/cups_repository.dart';

class GetCountCups extends LocalStorageUsecase<int?> {
  final CupsRepository repository;

  GetCountCups({required this.repository});

  @override
  Future<int?> call() async {
    return await repository.getCountCups();
  }

}