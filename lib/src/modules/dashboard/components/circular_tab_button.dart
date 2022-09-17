// import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// class CircularTabButtonModel {
//   String label;
//   bool isSelected;

//   CircularTabButtonModel({
//     required this.label,
//     this.isSelected = false,
//   });
// }

// class CircleButtonModelNotifier extends ChangeNotifier {
//   int _selectedIndex = 0;

//   late CircularTabButtonModel _selectedButton;
//   CircularTabButtonModel get selectedButton => _selectedButton;

//   var buttons = [
//     CircularTabButtonModel(
//       isSelected: true,
//       label: 'All',
//     ),
//     CircularTabButtonModel(
//       label: 'Food',
//     ),
//     CircularTabButtonModel(
//       label: 'Drink',
//     ),
//   ];

//   void onSelected({required int index}) {
//     _unSelect();
//     _selectedIndex = index;
//     var selectedButton = buttons[index];
//     selectedButton.isSelected = true;
//     notifyListeners();
//   }

//   void _unSelect() {
//     var button = buttons[_selectedIndex];
//     button.isSelected = false;
//     notifyListeners();
//   }
// }

// class HorizontalListViewCircleTabButtons extends StatelessWidget {
//   const HorizontalListViewCircleTabButtons({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var buttons = context.watch<CircleButtonModelNotifier>().buttons;

//     return Row(
//       children: List.generate(
//         buttons.length,
//         (index) {
//           return _CircleTabButton(index: index);
//         },
//       ),
//     );
//   }
// }

// class _CircleTabButton extends StatelessWidget {
//   const _CircleTabButton({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     var buttonModel = context.watch<CircleButtonModelNotifier>();
//     var buttons = buttonModel.buttons[index];

//     return GestureDetector(
//       onTap: () => buttonModel.onSelected(index: index),
//       child: Container(
//         height: 48.h,
//         margin: EdgeInsets.only(right: 16.w),
//         padding: EdgeInsets.symmetric(horizontal: 24.w),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: buttons.isSelected ? AppColors.primary : AppColors.form,
//           borderRadius: BorderRadius.circular(32.r),
//         ),
//         child: Text(
//           buttons.label,
//           style: Theme.of(context).textTheme.bodyText1!.copyWith(
//               color: buttons.isSelected ? Colors.white : AppColors.secondaryText,
//               fontWeight: FontWeight.w700),
//         ),
//       ),
//     );
//   }
// }
