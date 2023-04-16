import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/errors/failures.dart';
import 'package:magna/Core/firebase/firestorage_service.dart';
import 'package:magna/Features/Search/data/repos/search_repo.dart';

class SearchRepoImp extends SearchRepo {
  final FireStorageService fireStorageService;

  SearchRepoImp(this.fireStorageService);

  @override
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>> search() async{
    try{
      final result = fireStorageService.getPatients();
      return right(result);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
}
