part of '../../screens/home_screen.dart';

class _Body extends StatelessWidget {
  const _Body(this.scaffoldKey);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<SettingsCubit, SettingsState>(
          listenWhen: (previous, current) =>
              previous.changeQari != current.changeQari,
          listener: (context, state) {
            final status = state.changeQari;
            //success
            if (status is SuIndexedStatus) {
              context.read<SuraCubit>()
                ..pauseAudio()
                ..checkIsDownloadedAudio();
            }
          },
        ),
        BlocListener<SettingsCubit, SettingsState>(
          listenWhen: (previous, current) =>
              previous.changeTranslator != current.changeTranslator,
          listener: (context, state) {
            final status = state.changeTranslator;
            if (status is SuDataIndexedStatus<int?>) {
              final cubit = context.read<SuraCubit>();
              if (status.data == null) {
                cubit.removeTranslates();
              } else {
                cubit.getNewTranslates();
              }
            }
          },
        ),
      ],
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 130),
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    F.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<SuraCubit, SuraState>(
                      buildWhen: (previous, current) =>
                          previous.getVerses != current.getVerses,
                      builder: (context, state) {
                        final status = state.getVerses;

                        return AnimatedSwitcher(
                          duration: Constants.animationDuration,
                          child: switch (status) {
                            LoGetLimitStatus<VerseEntity>() =>
                              const CustomLoadingState(),
                            SuGetLimitStatus<VerseEntity>() => _LoadedVerses(
                              status.items,
                              status.isComplated,
                            ),
                            ErGetLimitStatus<VerseEntity>() => CustomErrorState(
                              errorMsg: status.errorMsg,
                              onTap: () =>
                                  context.read<SuraCubit>().getVerses(),
                            ),
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(alignment: Alignment.topCenter, child: _AppBar(scaffoldKey)),
          ],
        ),
      ),
    );
  }
}
