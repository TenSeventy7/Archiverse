import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:archiverse/views/activity_home.dart';
import 'package:archiverse/views/activity_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class OnboardingActivity extends CommonActivity {
  static const String routeName = '/onboarding';

  const OnboardingActivity({super.key});

  @override
  State<OnboardingActivity> createState() => _OnboardingActivityState();
}

class _OnboardingActivityState extends State<OnboardingActivity>
    with TickerProviderStateMixin {
  late AnimationController _gradientController;
  late Animation<double> _gradientAnimation;

  @override
  void initState() {
    super.initState();
    _gradientController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _gradientAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _gradientController, curve: Curves.easeInOut),
    );
    _gradientController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _gradientAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.lerp(
                  Alignment.topLeft,
                  Alignment.topRight,
                  _gradientAnimation.value,
                )!,
                end: Alignment.lerp(
                  Alignment.bottomRight,
                  Alignment.bottomLeft,
                  _gradientAnimation.value,
                )!,
                colors: [
                  colorScheme.primaryContainer.withOpacity(
                    0.3 + _gradientAnimation.value * 0.2,
                  ),
                  colorScheme.secondaryContainer.withOpacity(
                    0.5 + _gradientAnimation.value * 0.3,
                  ),
                  colorScheme.tertiaryContainer.withOpacity(
                    0.3 + _gradientAnimation.value * 0.2,
                  ),
                ],
                stops: [
                  0.0 + _gradientAnimation.value * 0.1,
                  0.5 + _gradientAnimation.value * 0.2,
                  1.0 - _gradientAnimation.value * 0.1,
                ],
              ),
            ),
            child: child,
          );
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.commonPaddingDouble,
              vertical: context.commonPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: context.screenPadding.top),
                const SizedBox(height: kToolbarHeight),

                // Logo and Title Section
                const SizedBox(height: 24.0),
                _buildHeader(colorScheme, theme),

                SizedBox(height: context.vh(0.05)),

                // Features Section
                Expanded(child: _buildFeatureList(context)),

                // Action Buttons
                const SizedBox(height: 24.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Get started reading your favorite stories',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildActions(theme, colorScheme),
                    const SizedBox(height: 8.0),
                    Text(
                      "This app is not affliated nor endorsed by Archive of Our Own (AO3). By using this app, you agree to tenseventyseven's terms of service and privacy policy.",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.screenPadding.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme, ThemeData theme) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          // Tagline
          Text(
            'Your gateway to infinite stories.',
            style: theme.textTheme.headlineLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildActions(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton.icon(
            onPressed: () {
              context.read<PreferencesProvider>().setBool(
                Preferences.onboardingShown,
                true,
              );
              context.navigator.pushNamed(SignInActivity.routeName);
            },
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            icon: Icon(TablerIcons.brand_ao3),
            label: Text(
              'Sign in with Archive of Our Own',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onPrimary,
              ),
            ),
          ),

          const SizedBox(height: 4),

          FilledButton.tonalIcon(
            onPressed: () {
              context.read<PreferencesProvider>().setBool(
                Preferences.onboardingShown,
                true,
              );
              context.navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeActivity()),
                (route) => false,
              );
            },
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: colorScheme.tertiaryContainer,
              foregroundColor: colorScheme.onTertiaryContainer,
            ),
            icon: const Icon(TablerIcons.book_2),
            label: Text(
              'Start Browsing',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureList(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildFeatureItem(
            context,
            TablerIcons.compass,
            'Discover',
            'Explore millions of stories across countless fandoms',
          ),
          _buildFeatureItem(
            context,
            TablerIcons.bookmark,
            'Save & Organize',
            'Bookmark your favorites and create custom collections',
          ),
          _buildFeatureItem(
            context,
            TablerIcons.users_group,
            'Connect',
            'Follow authors and join the community',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: colorScheme.onPrimaryContainer, size: 24),
      ),
      title: Text(
        title,
        style: theme.textTheme.titleMedium
            ?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            )
            .apply(fontSizeFactor: 1.2),
      ),
      subtitle: Text(
        description,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
