abstract class LabNoteState{}

class LabNoteInitial extends LabNoteState{}

class LabNoteLoading extends LabNoteState{}
class LabNoteSuccess extends LabNoteState{}
class LabNoteFailure extends LabNoteState{
  final String errMessage;
  LabNoteFailure(this.errMessage);
}