import 'dart:developer';
import 'dart:math' as math show pi;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/assets.dart';
import '../../../core/constants.dart';
import '../../../core/ming_cute_font.dart';
import '../../../core/widgets/custom_dialog.dart';

class DonateDialog extends StatelessWidget {
  const DonateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomDialog(
      closeTap: () => Navigator.pop(context),
      Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Constants.defaultPadding,
          children: [
            SizedBox(height: 40),
            Text(
              'حمایت شما، استمرار رسالت ما',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.primaryColor,
              ),
            ),
            Text(
              'با کمک شما می توانیم به تولید و توسعه نرم افزار های اسلامی ادامه دهیم و نور دانش و معنویت را در فضای دیجیتال گسترش دهیم. حتی کوچک ترین حمایت، گامی بزرگ در این مسیر است. با ما در این راه سهیم باشید.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(Assets.myInfoIMG),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  //close dialog
                  Navigator.pop(context, true);
                },
                child: Text(
                  'جهت حمایت کلیک کنید',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonateDialog2 extends StatefulWidget {
  const DonateDialog2({super.key, this.primaryColor});
  final Color? primaryColor;

  @override
  State<DonateDialog2> createState() => _DonateDialog2State();
}

class _DonateDialog2State extends State<DonateDialog2> {
  late List<_DonateItem> items;
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 1;
    items = [
      _DonateItem(
        price: 50000,
        link: 'https://zarinp.al/670909',
        description:
            'با این مبلغ، شما اولین گام در مسیر حمایت را برمی‌دارید. هر مشارکت ارزشمند است',
        emoji: 'assets/donate/1.json',
      ),
      _DonateItem(
        price: 100000,
        link: 'https://zarinp.al/739454',
        description: 'این کمک شما به استمرار و بهبود فعالیت‌های ما کمک می‌کند',
        emoji: 'assets/donate/2.json',
      ),
      _DonateItem(
        price: 200000,
        link: 'https://zarinp.al/739458',
        description:
            'این حمایت قابل توجه، ما را برای برداشتن قدم‌های بزرگ‌تر توانمند می‌سازد',
        emoji: 'assets/donate/3.json',
      ),
      _DonateItem(
        price: 300000,
        link: 'https://zarinp.al/739459',
        description:
            'حمایت شما تضمین‌کننده‌ی استمرار مسیر و موفقیت‌های آینده است',
        emoji: 'assets/donate/4.json',
      ),
      _DonateItem(
        price: 500000,
        link: 'https://zarinp.al/739456',
        description:
            'این کمک سخاوتمندانه، نقشی کلیدی در رشد و پیشرفت خواهد داشت',
        emoji: 'assets/donate/5.json',
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Directionality(
        textDirection: TextDirection.rtl,
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

                  child: Lottie.asset(
                    key: Key('rate_emoji_$selectedIndex'),
                    items[selectedIndex - 1].emoji,
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
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${intl.NumberFormat.decimalPattern().format(items[selectedIndex - 1].price)} تومان',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // TextSpan(
                            //   text: ' تومان',
                            //   style: theme.textTheme.bodyMedium,
                            // ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),

                      Text(
                        items[selectedIndex - 1].description,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 37,
                      unratedColor: theme.hintColor,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4),

                      // itemBuilder:
                      //     (context, value) => Icon(
                      //       value >= rateValue
                      //           ? MingCute.star_line
                      //           : MingCute.star_fill,
                      //       color: widget.primaryColor ?? Colors.teal.shade400,
                      //     ),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              index >= selectedIndex
                                  ? MingCute.heart_line
                                  : MingCute.heart_fill,
                              color:
                                  widget.primaryColor ?? Colors.teal.shade400,
                              size: 40,
                            ),
                            Text(
                              intl.NumberFormat.decimalPattern().format(
                                items[index].price,
                              ),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: index >= selectedIndex
                                    ? null
                                    : widget.primaryColor ??
                                          Colors.teal.shade400,
                              ),
                            ),
                          ],
                        );
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                          selectedIndex = rating.toInt();
                        });
                      },
                    ),
                    PositionedDirectional(
                      end: -5,
                      top: -12,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Image.asset(
                          'assets/rate/detail.png',
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'بهترین چیزی که میتونیم داشته باشیم :)',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color:
                                  widget.primaryColor ?? Colors.teal.shade400,
                            ),
                          ),
                        ),
                      ),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Image.asset(
                          'assets/rate/rate_arrow.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      final url = Uri.parse(items[selectedIndex - 1].link);
                      if (await launchUrl(url)) {
                      } else {
                        log('Could not launch $url');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          widget.primaryColor ?? Colors.teal.shade400,
                      disabledBackgroundColor:
                          (widget.primaryColor ?? Colors.teal.shade400)
                              .withAlpha(130),
                    ),
                    child: Text(
                      'پرداخت با درگاه امن زرین پال',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
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
      ),
    );
  }
}

class _DonateItem {
  const _DonateItem({
    required this.price,
    required this.link,
    required this.description,
    required this.emoji,
  });

  final int price;
  final String link;
  final String description;
  final String emoji;
}
