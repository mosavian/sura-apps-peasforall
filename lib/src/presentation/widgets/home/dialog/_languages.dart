part of '../../../screens/home_screen.dart';

class LanguagesDialog extends StatelessWidget {
  const LanguagesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;
    final List<String> languages = ['en', 'fa', 'ar'];

    return CustomDialog(
      Column(
        mainAxisSize: MainAxisSize.min,
        spacing: Constants.paddingScreen,
        children: [
          Text(
            localization.language,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.primaryColor,
            ),
          ),
          BlocBuilder<SettingsCubit, SettingsState>(
            buildWhen: (previous, current) =>
                previous.appLanguage != current.appLanguage,
            builder: (context, state) {
              return Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(languages.length, (index) {
                  final isActive = languages[index] == state.appLanguage;

                  return InkWell(
                    onTap: isActive
                        ? null
                        : () {
                            context.read<SettingsCubit>().setAppLanguage(
                              languages[index],
                            );
                          },
                    borderRadius: BorderRadius.circular(8),
                    child: AnimatedContainer(
                      duration: Constants.animationDuration,
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isActive ? theme.primaryColor : theme.hoverColor,
                        border: isActive
                            ? Border.all(
                                color: theme.secondaryHeaderColor,
                                width: 2,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        languages[index],
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: isActive ? Colors.white : null,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
