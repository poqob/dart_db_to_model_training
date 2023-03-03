import 'package:database_model/api/authentication.dart';
import 'package:database_model/api/db.dart';
import 'package:database_model/api/queries.dart';
import 'package:database_model/models/museum/model_museum.dart';

void main() async {
  await Db().conn();
  await Authentication.instance.logIn("poqob", "abc123");
  print(Authentication.instance.getAuthState);
  //await Db().connKill();

  //await Db().conn();

  List<Museum> museums = <Museum>[];
  await Db().query(Que.allMuseums.getQue).then((value) {
    for (var element in value) {
      museums.add(Museum.fromList(element));
      print(element[0]);
    }
  });
  await Db().connKill();
}
