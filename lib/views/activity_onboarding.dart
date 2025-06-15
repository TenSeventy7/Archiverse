import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class OnboardingActivity extends CommonActivity {
  static const String routeName = '/onboarding';

  const OnboardingActivity({super.key});

  @override
  State<OnboardingActivity> createState() => _OnboardingActivityState();
}

class _OnboardingActivityState extends State<OnboardingActivity> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primaryContainer.withOpacity(0.3),
              colorScheme.secondaryContainer.withOpacity(0.5),
              colorScheme.tertiaryContainer.withOpacity(0.3),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.commonPaddingDouble,
              vertical:
                  context.commonPaddingDouble +
                  context.screenPadding.top +
                  context.screenPadding.bottom,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: kToolbarHeight),
                const Spacer(flex: 2),

                // Logo and Title Section
                _buildHeader(colorScheme, theme),

                const Spacer(flex: 4),

                // Features Section
                _buildFeatureList(context),

                const Spacer(flex: 1),

                // Action Buttons
                const SizedBox(height: 24.0),
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
          // App Icon/Logo
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF77062), Color(0xFFFE5196)],
                stops: [0.2, 2.0],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              TablerIcons.brand_ao3,
              size: 72,
              color: colorScheme.onPrimary,
            ),
          ),

          const SizedBox(height: 16),

          // Tagline
          Text(
            'Your gateway to infinite stories',
            style: theme.textTheme.headlineLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
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
        children: [
          FilledButton.icon(
            onPressed: () {
              // Navigate to login/signup
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
              // Navigate to browse without account
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
