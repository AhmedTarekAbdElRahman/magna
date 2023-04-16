import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/errors/failures.dart';

abstract class SearchRepo{
  Future<Either<Failure,Stream<QuerySnapshot<Object?>>>> search();
}