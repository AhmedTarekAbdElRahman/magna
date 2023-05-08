import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/errors/failures.dart';
import 'package:magna/Core/firebase/firestore_service.dart';
import 'package:magna/Features/Search/data/repos/search_repo.dart';

class SearchRepoImp extends SearchRepo {
  final FireStoreService fireStorageService;

  SearchRepoImp(this.fireStorageService);
  @override
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>> doctorSearch() async{
    try{
      final result = fireStorageService.getCollectionWithQuery();
      return right(result);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>> nurseSearch() async{
    try{
      final result = fireStorageService.getCollection();
      return right(result);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
}
