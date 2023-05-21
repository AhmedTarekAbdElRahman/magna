abstract class HomeServiceState{}

class HomeServiceInitial extends HomeServiceState{}

class HomeServiceLoading extends HomeServiceState{}
class HomeServiceSuccess extends HomeServiceState{}
class HomeServiceFailure extends HomeServiceState{
  final String errMessage;
  HomeServiceFailure(this.errMessage);
}