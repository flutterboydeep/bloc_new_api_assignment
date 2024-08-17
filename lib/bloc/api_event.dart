part of 'api_bloc.dart';

sealed class ApiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FatchDataEvent extends ApiEvent {
  final bool isFavoriteItem;
  FatchDataEvent({required this.isFavoriteItem});
}

// class IsFavoriteEvent extends ApiEvent {
//   final bool isFavoriteItem;
//   IsFavoriteEvent({required this.isFavoriteItem});
// }
