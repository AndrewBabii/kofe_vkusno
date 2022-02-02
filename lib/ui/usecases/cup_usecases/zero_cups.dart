import 'package:kofe_vkusno/core/usecases/local_storage_usecase.dart';
import 'package:kofe_vkusno/models/repositories/cups_repository.dart';

class ZeroCups extends LocalStorageUsecase<void> {
  final CupsRepository repository;

  ZeroCups({required this.repository});

  @override
  Future<void> call() async {
    await repository.zeroCups();
  }

}