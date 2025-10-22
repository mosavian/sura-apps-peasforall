import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config_locator.dart';
import '../../../core/constants.dart';
import '../../../core/ming_cute_font.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../l10n/app_localizations.dart';
import '../../data/source/local/shared_prefs_service.dart';

class RateDialog extends StatefulWidget {
  const RateDialog({super.key, this.primaryColor});
  final Color? primaryColor;

  @override
  State<RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<RateDialog> {
  late int rateValue;

  @override
  void initState() {
    rateValue = 0;
    super.initState();
  }

  // Future<void> _bazaarReview(String packageName) async {
  //   try {
  //     final intent = AndroidIntent(
  //       action: 'android.intent.action.EDIT',
  //       data: 'bazaar://details?id=$packageName',
  //       package: 'com.farsitel.bazaar',
  //     );

  //     await intent.launch();
  //   } catch (err) {
  //     if (!await launchUrl(
  //       Uri.parse("https://cafebazaar.ir/app/$packageName"),
  //       mode: LaunchMode.externalApplication,
  //     )) {
  //       if (context.mounted) {
  //         CustomSnackBar.error(
  //           context,
  //           message: "اپلیکیشن در کافه بازار وجود ندارد",
  //         );
  //       }
  //     }
  //   }
  // }

  // Future<void> _myketReview(String packageName) async {
  //   try {
  //     final intent = AndroidIntent(
  //       action: 'android.intent.action.VIEW',
  //       data: 'myket://comment?id=$packageName',
  //     );

  //     await intent.launch();
  //   } catch (err) {
  //     if (!await launchUrl(
  //       Uri.parse("myket://details?id=$packageName"),
  //       mode: LaunchMode.externalApplication,
  //     )) {
  //       if (context.mounted) {
  //         CustomSnackBar.error(
  //           context,
  //           message: "اپلیکیشن در مایکت وجود ندارد",
  //         );
  //       }
  //     }
  //   }
  // }

  Future<void> _googlePlayReview() async {
    final inAppReview = InAppReview.instance;
    await inAppReview.openStoreListing();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    final localization = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        width: 280,
        // height: 430,
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 40),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(Constants.borderRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 400),

                child: Image.asset(
                  key: Key('rate_emoji_$rateValue'),
                  'assets/rate/$rateValue.png',
                  width: 65,
                  height: 65,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 135,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (rateValue > 0)
                      Text(
                        rateValue < 4
                            ? localization.ohNo
                            : localization.likeYouTo,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium,
                      ),
                    Text(
                      rateValue == 0
                          ? localization.rateDescription
                          : rateValue < 4
                          ? localization.leaveFeedback
                          : localization.thanksForFeedback,

                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  RatingBar.builder(
                    initialRating: 0,
                    // minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 37,
                    unratedColor: theme.hintColor,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),

                    itemBuilder: (context, value) => Icon(
                      value >= rateValue
                          ? MingCute.star_line
                          : MingCute.star_fill,
                      color: widget.primaryColor ?? Colors.teal.shade400,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rateValue = rating.toInt();
                      });
                    },
                  ),
                  PositionedDirectional(
                    end: -13,
                    top: -7,
                    child: RotatedBox(
                      quarterTurns: isRTL ? 3 : 0,
                      child: Image.asset(
                        'assets/rate/detail.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          localization.bestWeCan,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: widget.primaryColor ?? Colors.teal.shade400,
                          ),
                        ),
                      ),
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(isRTL ? math.pi : 0),
                      child: Image.asset(
                        'assets/rate/rate_arrow.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: rateValue == 0
                      ? null
                      : () async {
                          Navigator.pop(
                            context,
                            rateValue < 5 && rateValue > 0,
                          );

                          locator<SharedPrefsService>().ratedUser();

                          if (rateValue == 5) {
                            _googlePlayReview();
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        widget.primaryColor ?? Colors.teal.shade400,
                    disabledBackgroundColor:
                        (widget.primaryColor ?? Colors.teal.shade400).withAlpha(
                          130,
                        ),
                  ),
                  child: Text(
                    rateValue == 5
                        ? localization.googlePlayRate
                        : localization.rate,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportDialog extends StatefulWidget {
  const ReportDialog({
    required this.myEmail,
    required this.appName,
    super.key,
    this.primaryColor,
  });
  final String myEmail;
  final String appName;
  final Color? primaryColor;

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  late String text;
  late bool isLoading;
  TextDirection? textDirection;

  @override
  void initState() {
    text = '';
    isLoading = false;
    super.initState();
  }

  bool isRTL(String text) {
    final rtlChars = RegExp(
      r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\u0590-\u05FF]',
    );
    return rtlChars.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 280,
        // height: 430,
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 40),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/rate/4.png', width: 65, height: 65),
                SizedBox(height: 10),
                Text(
                  localization.tellUsProblem,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  constraints: BoxConstraints(minHeight: 140, maxHeight: 250),
                  decoration: BoxDecoration(
                    color: theme.shadowColor.withAlpha(20),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: null,
                    cursorOpacityAnimates: true,
                    textDirection: textDirection,
                    onChanged: (value) {
                      setState(() {
                        text = value.trim();
                        textDirection = isRTL(text)
                            ? TextDirection.rtl
                            : TextDirection.ltr;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      hintText: localization.writeSomething,
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: text.isEmpty || isLoading
                        ? null
                        : () async {
                            isLoading = true;

                            final String subject = Uri.encodeComponent(
                              'App feedback ${widget.appName}',
                            );
                            final String body = Uri.encodeComponent(text);

                            final Uri emailLaunchUri = Uri.parse(
                              'mailto:${widget.myEmail}?subject=$subject&body=$body',
                            );

                            if (!await launchUrl(
                              emailLaunchUri,
                              mode: LaunchMode.externalApplication,
                            )) {
                              if (context.mounted) {
                                CustomSnackBar.error(context, message: "error");
                              }
                            }

                            isLoading = false;
                            if (context.mounted) Navigator.pop(context, true);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          widget.primaryColor ?? Colors.teal.shade400,
                      disabledBackgroundColor:
                          (widget.primaryColor ?? Colors.teal.shade400)
                              .withAlpha(130),
                    ),
                    child: isLoading
                        ? SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            localization.send,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: theme.shadowColor.withAlpha(30),
                    ),
                    child: Text(
                      localization.later,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
