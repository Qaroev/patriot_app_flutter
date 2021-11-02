part of 'status_bloc.dart';

abstract class StatusState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StatusLoadingState extends StatusState {}

class StatusInitialState extends StatusState {}

class StatusLoadedState extends StatusState {
  final List<Status> status;

  StatusLoadedState({required this.status});
}

class StatusListErrorstate extends StatusState {
  final error;

  StatusListErrorstate({this.error});
}
