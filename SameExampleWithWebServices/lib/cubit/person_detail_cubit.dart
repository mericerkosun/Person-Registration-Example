import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_registration/repo/person_dao_repository.dart';

class PersonDetailCubit extends Cubit<void> {

  PersonDetailCubit() : super(0);

  var pRepo = PersonDAORepository();

  Future<void> update(int person_id, String person_name, String person_phone) async {
    await pRepo.personUpdate(person_id, person_name, person_phone);
  }
}