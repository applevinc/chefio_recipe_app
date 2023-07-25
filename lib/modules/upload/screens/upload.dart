import 'package:chefio_recipe_app/shared/styles/colors.dart';
import 'package:chefio_recipe_app/modules/shared/dashboard/dashboard_view.dart';
import 'package:chefio_recipe_app/modules/upload/screens/steps/step_one_view.dart';
import 'package:chefio_recipe_app/modules/upload/screens/steps/step_two_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashBoardView(),
          ),
        );

        return Future.value(false);
      },
      child: ChangeNotifierProvider(
        create: (context) => UploadPageViewController(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leadingWidth: 85.w,
            toolbarHeight: 40.h,
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const DashBoardView(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(top: 12.h, left: 24.w),
                child: Text(
                  'Cancel',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.secondary),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 12.h, right: 24.w),
                child: Consumer<UploadPageViewController>(
                  builder: (BuildContext context, pageViewModel, Widget? child) {
                    return RichText(
                      text: TextSpan(
                        text: '1',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: pageViewModel.pageNo == 0
                                ? AppColors.headlineText
                                : AppColors.secondaryText),
                        children: <TextSpan>[
                          TextSpan(
                              text: '/', style: Theme.of(context).textTheme.bodyMedium!),
                          TextSpan(
                            text: '2',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: pageViewModel.pageNo == 1
                                    ? AppColors.headlineText
                                    : AppColors.secondaryText),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        StepOneView(pageController: controller),
        StepTwoView(pageController: controller),
      ],
    );
  }
}

class UploadPageViewController extends ChangeNotifier {
  int _pageNo = 0;
  int get pageNo => _pageNo;

  setPageNo(int page) {
    _pageNo = page;
    notifyListeners();
  }
}
