import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:patriotapp/models/status.dart';
import 'package:patriotapp/services/service_api.dart';

part 'status_event.dart';

part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvents, StatusState> {
  final ServiceApi statusrepository;
  late List<Status> listStatus;

  StatusBloc({required this.statusrepository}) : super(StatusInitialState());

  @override
  Stream<StatusState> mapEventToState(StatusEvents event) async* {
    switch (event) {
      case StatusEvents.fetchStatus:
        yield StatusLoadingState();
        try {
          var objects = await statusrepository.getObjects();
          if (objects.isNotEmpty) {
            if (objects[0].id.contains('/')) {
              objects[0].id.replaceAll('/', '-');
            }
            listStatus = await statusrepository.getStatus(objects[0].id);
            yield StatusLoadedState(status: listStatus);
          }
        } on SocketException {
          yield StatusListErrorstate(
            error: ('No Internet'),
          );
        } on HttpException {
          yield StatusListErrorstate(
            error: ('No Service'),
          );
        } on FormatException {
          yield StatusListErrorstate(
            error: ('No Format Exception'),
          );
        } catch (e) {
          yield StatusListErrorstate(
            error: ('Un Known Error ${e.toString()}'),
          );
        }
        break;
    }
  }
}
