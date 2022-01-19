import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meow_app/core/themes/colors.dart';
import 'package:meow_app/core/utils/sizer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HeaderSmartRefreshHeader extends StatelessWidget {
  const HeaderSmartRefreshHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      builder: (_, mode) {
        Widget body;

        if (mode == RefreshStatus.idle) {
          body = _Content(
            icon: Icons.arrow_downward,
            title: 'Tire para refrescar',
          );
        } else if (mode == RefreshStatus.refreshing) {
          body = Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        } else if (mode == RefreshStatus.failed) {
          body = _Content(icon: Icons.arrow_downward, title: 'Pull up load');
        } else if (mode == RefreshStatus.completed) {
          body = _Content(title: 'Datos refrescado');
        } else {
          body = _Content(
            icon: Icons.arrow_upward,
            title: 'Lanzamiento para refrescar',
          );
        }

        return SizedBox(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}

class FooterSmartRefreshHeader extends StatelessWidget {
  const FooterSmartRefreshHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (context, mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("Tire para cargar mas datos");
        } else if (mode == LoadStatus.loading) {
          body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("Error, intente de nuevo");
        } else if (mode == LoadStatus.canLoading) {
          body = Text("Suelte para cargar mas datos");
        } else {
          body = Text("No hay mas datos");
        }
        return SizedBox(
          height: 55,
          child: Center(child: body),
        );
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    this.icon,
    required this.title,
  }) : super(key: key);
  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, color: AppColors.greyText),
          SizedBox(width: 2.w),
        ],
        Text(title, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}
