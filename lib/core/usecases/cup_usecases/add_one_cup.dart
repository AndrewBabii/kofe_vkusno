import 'package:kofe_vkusno/core/repositories/cups_repository.dart';
import 'package:kofe_vkusno/core/usecases/local_storage_usecase.dart';

class AddOneCup extends LocalStorageUsecase<void> {
  final CupsRepository repository;

  AddOneCup({required this.repository});

  @override
  Future<void> call() async {
    await repository.addOneCup();
  }

}