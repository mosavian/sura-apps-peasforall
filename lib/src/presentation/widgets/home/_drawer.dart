part of '../../screens/home_screen.dart';

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 200,
            color: theme.hoverColor,
            padding: EdgeInsets.all(Constants.paddingScreen),
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Constants.defaultPadding,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/flavor/${F.name}/icon.png',
                  width: 80,
                  height: 80,
                ),
                // Text(F.title, style: theme.textTheme.bodyMedium),
                Text(
                  'v: ${locator<PackageInfoService>().version}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: Constants.defaultPadding),
              children: [
                //language
                ListTile(
                  onTap: () async {
                    //close drawer
                    Navigator.pop(context);

                    showDialog(
                      context: context,
                      builder: (context) {
                        return LanguagesDialog();
                      },
                    );
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Constants.paddingScreen,
                  ),
                  horizontalTitleGap: Constants.defaultPadding,
                  leading: Icon(
                    MingCute.world_2_fill,
                    color: theme.hintColor,
                    size: 20,
                  ),
                  title: Text(
                    localization.language,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),

                //rate us
                ListTile(
                  onTap: () async {
                    final showReportDialog = await showDialog<bool?>(
                      context: context,
                      builder: (context) {
                        return RateDialog();
                      },
                    );

                    await Future.delayed(Duration(milliseconds: 200));

                    if (!context.mounted || showReportDialog != true) return;

                    final sent = await showDialog<bool?>(
                      context: context,
                      builder: (context) {
                        return ReportDialog(
                          myEmail: Constants.myEmail,
                          appName: F.title,
                        );
                      },
                    );

                    if (sent == true && context.mounted) {
                      CustomSnackBar.success(context, message: 'thank you');
                    }
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Constants.paddingScreen,
                  ),
                  horizontalTitleGap: Constants.defaultPadding,
                  leading: Icon(
                    MingCute.star_fill,
                    color: theme.hintColor,
                    size: 20,
                  ),
                  title: Text(
                    localization.rateUs,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),

                //other apps
                ListTile(
                  onTap: () async {
                    //close drawer
                    Navigator.pop(context);

                    //open google play page
                    if (!await launchUrl(
                      Uri.parse(Constants.marketDeveloperLink),
                      mode: LaunchMode.externalApplication,
                    )) {
                      log('invalid url');
                    }
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Constants.paddingScreen,
                  ),
                  horizontalTitleGap: Constants.defaultPadding,
                  leading: Icon(
                    MingCute.grid_fill,
                    color: theme.hintColor,
                    size: 20,
                  ),
                  title: Text(
                    localization.otherApps,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),

                //donate
                if (locator<DeviceInfoService>().isIranianUser)
                  ListTile(
                    onTap: () async {
                      //close drawer
                      // Navigator.pop(context);

                      final result = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return DonateDialog();
                        },
                      );

                      //اگر دکمه پرداخت رو زد
                      if (result == true && context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DonateDialog2();
                          },
                        );
                      }
                    },
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Constants.paddingScreen,
                    ),
                    horizontalTitleGap: Constants.defaultPadding,
                    leading: Icon(
                      MingCute.heart_fill,
                      color: theme.hintColor,
                      size: 20,
                    ),
                    title: Text(
                      localization.donate,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
