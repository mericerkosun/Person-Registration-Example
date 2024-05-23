import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_registration/repo/person_dao_repository.dart';

class PersonRegisterCubit extends Cubit<void> {

  PersonRegisterCubit() : super(0);
  
  var pRepo = PersonDAORepository();

  Future<void> register(String person_name, String person_phone) async {
    await pRepo.personRegister(person_name, person_phone);
  }
}