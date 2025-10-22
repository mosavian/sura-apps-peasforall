part of '../../../screens/home_screen.dart';

class _Audio extends StatelessWidget {
  const _Audio();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuraCubit, SuraState>(
      buildWhen: (previous, current) =>
          previous.downloadAudio != current.downloadAudio,
      builder: (context, state) {
        final status = state.downloadAudio;

        return AnimatedSwitcher(
          duration: Constants.animationDuration,
          child: switch (status) {
            InitDownloadStatus() => _InitAudioStateWidget(),
            LoDownloadStatus() => _DownloadingAudioStateWidget(
              progress: status.progress,
            ),
            SuDownloadStatus() => _DownloadedAudioStateWidget(),
            ErDownloadStatus() => CustomErrorState(
              errorMsg: status.errorMsg,
              onTap: () => context.read<SuraCubit>().downloadAudio(),
            ),
          },
        );
      },
    );
  }
}

class _InitAudioStateWidget extends StatelessWidget {
  const _InitAudioStateWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StarButton(
          Icons.settings,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return PersonDialog();
              },
            );
          },
        ),
        StarButton(
          Icons.stop,
          onTap: () {
            context.read<SuraCubit>().stopAudio();
          },
        ),
        StarButton(
          Icons.download,
          size: 56,
          onTap: () {
            context.read<SuraCubit>().downloadAudio();
          },
        ),
        StarButton(
          Icons.add,
          onTap: () {
            context.read<SettingsCubit>()
              ..increaseTranslateFontSize()
              ..increaseSuraFontSize();
          },
        ),
        StarButton(
          Icons.remove,
          onTap: () {
            context.read<SettingsCubit>()
              ..decreaseSuraFontSize()
              ..decreaseTranslateFontSize();
          },
        ),
      ],
    );
  }
}

class _DownloadingAudioStateWidget extends StatelessWidget {
  const _DownloadingAudioStateWidget({this.progress});
  final double? progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 7,
      children: [
        LinearProgressIndicator(value: progress),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: theme.hoverColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${intl.NumberFormat().format(((progress ?? 0) * 100).toInt())}%',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Text(
              localization.downloadingAudio,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.primaryColor,
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: theme.hoverColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${intl.NumberFormat().format(100)}%',
                style: theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DownloadedAudioStateWidget extends StatelessWidget {
  const _DownloadedAudioStateWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StarButton(
          Icons.settings,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return PersonDialog();
              },
            );
          },
        ),
        StarButton(
          Icons.stop,
          onTap: () {
            context.read<SuraCubit>().stopAudio();
          },
        ),
        BlocConsumer<SuraCubit, SuraState>(
          buildWhen: (previous, current) =>
              previous.playAudio != current.playAudio,
          listenWhen: (previous, current) =>
              previous.playAudio != current.playAudio,
          listener: (context, state) {
            final status = state.playAudio;

            //error
            if (status is ErDataStatus<bool>) {
              CustomSnackBar.error(context, message: status.errorMsg);
            }
          },
          builder: (context, state) {
            final status = state.playAudio;
            final isLoading = state.playAudio is LoDataStatus<bool>;
            final isPlaying = status is SuDataStatus<bool> && status.data;

            return StarButton(
              isPlaying ? Icons.pause : Icons.play_arrow,
              isLoading: isLoading,
              size: 56,
              onTap: () {
                final cubit = context.read<SuraCubit>();

                if (isPlaying) {
                  cubit.pauseAudio();
                } else {
                  cubit.playAudio();
                }
              },
            );
          },
        ),
        StarButton(
          Icons.add,
          onTap: () {
            context.read<SettingsCubit>()
              ..increaseTranslateFontSize()
              ..increaseSuraFontSize();
          },
        ),
        StarButton(
          Icons.remove,
          onTap: () {
            context.read<SettingsCubit>()
              ..decreaseSuraFontSize()
              ..decreaseTranslateFontSize();
          },
        ),
      ],
    );
  }
}
