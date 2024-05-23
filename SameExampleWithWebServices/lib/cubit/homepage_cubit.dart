import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_registration/entity/person.dart';
import 'package:person_registration/repo/person_dao_repository.dart';

class HomepageCubit extends Cubit<List<Kisiler>> {
  HomepageCubit() : super(<Kisiler>[]);

  var pRepo = PersonDAORepository();

  Future<void> showAllPeople() async {
    var list = await pRepo.getAllPeople();
    emit(list);
  }

  Future<void> search(String searchWord) async {
    var list = await pRepo.searchPerson(searchWord);
    emit(list);
  }

  Future<void> delete(int person_id,) async {
    await pRepo.personDelete(person_id);
    await showAllPeople();
  }
}