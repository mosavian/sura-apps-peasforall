part of '../../../screens/home_screen.dart';

class _LoadedVerses extends StatelessWidget {
  const _LoadedVerses(this.verses, this.isComplated);
  final List<VerseEntity> verses;
  final bool isComplated;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<SuraCubit>();

    //is empty
    if (verses.isEmpty) {
      return Center(
        child: Text('not found', style: theme.textTheme.bodyMedium),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (!isComplated &&
            notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
          cubit.getVerses();
        }
        return false;
      },
      child: ScrollablePositionedList.builder(
        itemScrollController: context.read<SuraCubit>().scrollController,
        itemCount: isComplated ? verses.length + 1 : verses.length + 2,
        itemBuilder: (context, index) {
          if ((index - 1) >= verses.length) {
            return SizedBox(height: 60, child: CustomLoadingState());
          }

          if (index == 0) {
            final item0 = VerseEntity(
              id: -1,
              arabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
              chapter: verses[0].chapter,
              translate: verses[0].translate == null
                  ? null
                  : 'به نام خداوند بخشنده مهربان',
              page: verses[0].page,
            );

            return _VerseItem(item0, -1);
          }

          return _VerseItem(verses[index - 1], index - 1);
        },
      ),
    );
  }
}

class _VerseItem extends StatelessWidget {
  const _VerseItem(this.verse, this.index);
  final VerseEntity verse;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SuraCubit, SuraState>(
      buildWhen: (previous, current) {
        if (previous.playingAyaId == current.playingAyaId) {
          return false;
        }
        if (current.playingAyaId == index + 1) {
          return true;
        }
        if (previous.playingAyaId == index + 1) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final status = state.playingAyaId;
        final isPlaying = status == index + 1;

        return InkWell(
          onTap: isPlaying || verse.id == -1
              ? null
              : () {
                  context.read<SuraCubit>().playAudio(id: index + 1);
                },
          child: AnimatedContainer(
            duration: Constants.animationDuration,
            padding: EdgeInsets.symmetric(
              horizontal: Constants.paddingScreen,
              vertical: Constants.defaultPadding,
            ),
            color: isPlaying ? Colors.black.withAlpha(13) : Colors.transparent,
            child: Column(
              spacing: Constants.defaultPadding,
              children: [
                BlocBuilder<SettingsCubit, SettingsState>(
                  buildWhen: (previous, current) =>
                      previous.suraFontSize != current.suraFontSize,
                  builder: (context, state) {
                    final fontSize = state.suraFontSize;

                    return AnimatedDefaultTextStyle(
                      style:
                          theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: Assets.uthmanTahaFont,
                            fontSize: fontSize,
                          ) ??
                          TextStyle(
                            fontFamily: Assets.uthmanTahaFont,
                            fontSize: fontSize,
                          ),
                      duration: Duration(milliseconds: 200),
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(text: verse.arabic),
                            if (verse.verse != null)
                              TextSpan(
                                text:
                                    ' {${intl.NumberFormat.decimalPattern('fa').format(verse.verse)}}',
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (verse.translate != null)
                  BlocBuilder<SettingsCubit, SettingsState>(
                    buildWhen: (previous, current) =>
                        previous.translateFontSize != current.translateFontSize,
                    builder: (context, state) {
                      final fontSize = state.translateFontSize;

                      return AnimatedDefaultTextStyle(
                        style:
                            theme.textTheme.bodySmall?.copyWith(
                              fontSize: fontSize,
                            ) ??
                            TextStyle(fontSize: fontSize, color: Colors.black),
                        duration: Duration(milliseconds: 200),
                        child: Text(
                          verse.translate!,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
