import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Chat extends Equatable {
  int? id;
  String? names;
  String? time;
  String? image;

  Chat({this.id, this.names, this.time, this.image});

  @override
  List<Object?> get props => [id, names, time, image];
}
