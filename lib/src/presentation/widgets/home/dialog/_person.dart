part of '../../../screens/home_screen.dart';

class PersonDialog extends StatelessWidget {
  const PersonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return CustomDialog(
      SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Constants.paddingScreen,
          children: [
            Text(
              localization.settings,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.primaryColor,
              ),
            ),
            _Translators(),
            _Qaries(),
          ],
        ),
      ),
    );
  }
}

class _Qaries extends StatelessWidget {
  const _Qaries();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: Constants.defaultPadding,
      children: [
        Text(localization.qari, style: theme.textTheme.bodyMedium),
        BlocBuilder<SettingsCubit, SettingsState>(
          buildWhen: (previous, current) => previous.getQari != current.getQari,
          builder: (context, state) {
            final status = state.getQari;

            return AnimatedSwitcher(
              duration: Constants.animationDuration,
              child: switch (status) {
                LoGetStatus<QariEntity>() => SizedBox(
                  height: 120,
                  child: const CustomLoadingState(),
                ),
                SuGetStatus<QariEntity>() => _LoadedQaries(status.items),
                ErGetStatus<QariEntity>() => SizedBox(
                  height: 120,
                  child: CustomErrorState(
                    errorMsg: status.errorMsg,
                    onTap: () => context.read<SettingsCubit>().getAllQari(),
                  ),
                ),
              },
            );
          },
        ),
      ],
    );
  }
}

class _LoadedQaries extends StatelessWidget {
  const _LoadedQaries(this.qaries);
  final List<QariEntity> qaries;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (qaries.isEmpty) {
      return Center(child: Text('not found', style: theme.textTheme.bodySmall));
    }

    return Wrap(
      spacing: 0, // فاصله افقی بین آیتم‌ها
      runSpacing: 0, // فاصله عمودی بین خطوط
      children: List.generate(qaries.length, (index) {
        return _QariItem(qaries[index], index);
      }),
    );
  }
}

class _Translators extends StatelessWidget {
  const _Translators();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: Constants.defaultPadding,
      children: [
        Text(localization.translate, style: theme.textTheme.bodyMedium),
        BlocBuilder<SettingsCubit, SettingsState>(
          buildWhen: (previous, current) =>
              previous.getTranslators != current.getTranslators,
          builder: (context, state) {
            final status = state.getTranslators;

            return AnimatedSwitcher(
              duration: Constants.animationDuration,
              child: switch (status) {
                LoGetStatus<TranslatorEntity>() => SizedBox(
                  height: 120,
                  child: const CustomLoadingState(),
                ),
                SuGetStatus<TranslatorEntity>() => _LoadedTranslators(
                  status.items,
                ),
                ErGetStatus<TranslatorEntity>() => SizedBox(
                  height: 120,
                  child: CustomErrorState(
                    errorMsg: status.errorMsg,
                    onTap: () => context.read<SettingsCubit>().getTranslators(),
                  ),
                ),
              },
            );
          },
        ),
      ],
    );
  }
}

class _LoadedTranslators extends StatelessWidget {
  const _LoadedTranslators(this.translators);
  final List<TranslatorEntity> translators;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (translators.isEmpty) {
      return Center(child: Text('not found', style: theme.textTheme.bodySmall));
    }

    return Wrap(
      spacing: 5, // فاصله افقی بین آیتم‌ها
      runSpacing: 5, // فاصله عمودی بین خطوط
      children: List.generate(translators.length + 1, (index) {
        if (index == 0) {
          return _RemoveItem(
            onTap: () {
              context.read<SettingsCubit>().changeTranslator(null, index);
            },
          );
        }

        return _TranslatorItem(translators[index - 1], index);
      }),
    );
  }
}

class _RemoveItem extends StatelessWidget {
  const _RemoveItem({required this.onTap});
  final VoidCallback onTap;
  final bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: isActive ? null : onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: theme.hoverColor,
                border: Border.all(color: theme.secondaryHeaderColor, width: 2),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class _TranslatorItem extends StatelessWidget {
  const _TranslatorItem(this.translator, this.index);
  final TranslatorEntity translator;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) {
        if (previous.changeTranslator == current.changeTranslator) {
          return false;
        }
        if (current.changeTranslator.index != index) {
          return false;
        }
        return true;
      },
      listenWhen: (previous, current) {
        if (previous.changeTranslator == current.changeTranslator) {
          return false;
        }
        if (current.changeTranslator.index != index) {
          return false;
        }
        return true;
      },
      listener: (context, state) {
        final status = state.changeTranslator;

        //error
        if (status is ErDataIndexedStatus<int?>) {
          CustomSnackBar.error(context, message: status.errorMsg);
        }
      },
      builder: (context, state) {
        final status = state.changeTranslator;
        final isLoading = status is LoIndexedStatus && status.index == index;

        return InkWell(
          onTap: isLoading || translator.isActive
              ? null
              : () => context.read<SettingsCubit>().changeTranslator(
                  translator.id,
                  index,
                ),
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: Constants.animationDuration,
            padding: EdgeInsets.all(5),
            constraints: BoxConstraints(maxWidth: 90),
            decoration: BoxDecoration(
              color: translator.isActive ? theme.hoverColor : null,
              borderRadius: BorderRadius.circular(8),
              border: translator.isActive
                  ? Border.all(color: theme.secondaryHeaderColor, width: 1)
                  : null,
            ),
            child: Column(
              spacing: 4,
              children: [
                AnimatedSwitcher(
                  duration: Constants.animationDuration,
                  child: isLoading
                      ? SizedBox(
                          width: 65,
                          height: 65,
                          child: CustomLoadingState(strokeWidth: 2.5),
                        )
                      : FutureBuilder(
                          future: Assets.assetExists(
                            'assets/images/translator/${translator.id}.png',
                          ),
                          initialData: false,
                          builder: (context, snapshot) {
                            if (snapshot.data == true) {
                              return Container(
                                width: 65,
                                height: 65,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: theme.secondaryHeaderColor,
                                  border: Border.all(
                                    color: theme.scaffoldBackgroundColor,
                                  ),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/translator/${translator.id}.png',
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Container(
                              width: 65,
                              height: 65,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: theme.secondaryHeaderColor,
                                border: Border.all(
                                  color: theme.scaffoldBackgroundColor,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.person, size: 30),
                            );
                          },
                        ),
                ),
                Text(
                  translator.faName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: translator.isActive
                        ? theme.colorScheme.primary
                        : theme.hintColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _QariItem extends StatelessWidget {
  const _QariItem(this.qari, this.index);
  final QariEntity qari;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return BlocConsumer<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) {
        if (previous.changeQari == current.changeQari) {
          return false;
        }
        if (current.changeQari.index != index) {
          return false;
        }
        return true;
      },
      listenWhen: (previous, current) {
        if (previous.changeQari == current.changeQari) {
          return false;
        }
        if (current.changeQari.index != index) {
          return false;
        }
        return true;
      },
      listener: (context, state) {
        final status = state.changeQari;

        //error
        if (status is ErIndexedStatus) {
          CustomSnackBar.error(context, message: status.errorMsg);
        }
      },
      builder: (context, state) {
        final status = state.changeQari;
        final isLoading = status is LoIndexedStatus && status.index == index;

        return InkWell(
          onTap: isLoading || qari.isActive
              ? null
              : () => context.read<SettingsCubit>().changeQari(qari.id, index),
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: Constants.animationDuration,
            padding: EdgeInsets.all(5),
            // constraints: BoxConstraints(maxWidth: 90),
            width: 80,
            decoration: BoxDecoration(
              color: qari.isActive ? theme.hoverColor : null,
              borderRadius: BorderRadius.circular(8),
              border: qari.isActive
                  ? Border.all(color: theme.secondaryHeaderColor, width: 1)
                  : null,
            ),
            child: Column(
              spacing: 4,
              children: [
                AnimatedSwitcher(
                  duration: Constants.animationDuration,
                  child: isLoading
                      ? SizedBox(
                          width: 65,
                          height: 65,
                          child: CustomLoadingState(strokeWidth: 2.5),
                        )
                      : FutureBuilder(
                          future: Assets.assetExists(
                            'assets/images/qari/${qari.id}.png',
                          ),
                          initialData: false,
                          builder: (context, snapshot) {
                            if (snapshot.data == true) {
                              return Container(
                                width: 65,
                                height: 65,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: theme.secondaryHeaderColor,
                                  border: Border.all(
                                    color: theme.scaffoldBackgroundColor,
                                  ),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/qari/${qari.id}.png',
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Container(
                              width: 65,
                              height: 65,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: theme.secondaryHeaderColor,
                                border: Border.all(
                                  color: theme.scaffoldBackgroundColor,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.person, size: 30),
                            );
                          },
                        ),
                ),
                Text(
                  qari.faName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: qari.isActive
                        ? theme.colorScheme.primary
                        : theme.hintColor,
                  ),
                ),
                if (qari.isAudioTranslation)
                  Text(
                    localization.translate,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
