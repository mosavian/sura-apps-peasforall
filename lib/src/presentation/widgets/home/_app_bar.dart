part of '../../screens/home_screen.dart';

class _AppBar extends StatelessWidget {
  const _AppBar(this.scaffoldKey);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.paddingScreen,
        vertical: Constants.defaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StarButton(
            MingCute.menu_line,
            onTap: () {
              scaffoldKey.currentState?.openDrawer(); // <-- Opens the drawer
            },
          ),
        ],
      ),
    );
  }
}
