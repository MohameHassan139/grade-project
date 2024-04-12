part of 'bottom_nav_bar_cubit_cubit.dart';

@immutable
sealed class BottomNavBarCubitState {}

final class BottomNavBarCubitInitial extends BottomNavBarCubitState {}

class BottomNavBarToggle extends BottomNavBarCubitState {}
