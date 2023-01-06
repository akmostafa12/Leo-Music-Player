part of 'music_bloc.dart';

@immutable
abstract class MusicState {}

class MusicInitial extends MusicState {}

class Loading extends MusicState {}

class Success extends MusicState {}

class Error extends MusicState {}

class Playing extends MusicState {}

class Stoped extends MusicState {}
