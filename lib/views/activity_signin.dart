import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/providers/provider_user.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:archiverse/views/activity_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInActivity extends CommonActivity {
  const SignInActivity({super.key, this.onboarding = false});
  static const String routeName = '/signin';

  final bool onboarding;

  @override
  State<SignInActivity> createState() => _SignInActivityState();
}

class _SignInActivityState extends State<SignInActivity> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ExpressiveScaffold(
      appBar: (controller) => ExpressiveAppBar(controller: controller),
      body: (controller) => SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 44 - context.screenPadding.bottom),

              // Header Section
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        TablerIcons.brand_ao3,
                        size: 48,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Sign in',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Access more features in Archiverse and see more content by signing in with your Archive of Our Own account.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // Email Field
              TextFormField(
                controller: _emailController,
                enabled: !_isLoading,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email address',
                  prefixIcon: const Icon(TablerIcons.mail),
                  filled: true,
                  fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withOpacity(0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Password Field
              TextFormField(
                controller: _passwordController,
                enabled: !_isLoading,
                obscureText: !_isPasswordVisible,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(TablerIcons.key),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? TablerIcons.eye_closed
                          : TablerIcons.eye,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withOpacity(0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: !_isLoading
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            _signIn();
                          }
                        }
                      : null,
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: !_isLoading
                      ? const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 8),

              TextButton(
                onPressed: !_isLoading
                    ? () {
                        // Handle forgot password
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Forgot password functionality'),
                          ),
                        );
                      }
                    : null,
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                ),
                child: const Text('Forgot Password?'),
              ),

              const SizedBox(height: 32),

              // Sign Up Section
              Center(
                child: Column(
                  spacing: 2,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: !_isLoading
                          ? () async {
                              Uri info = Uri.parse(
                                "https://archiveofourown.org/invite_requests",
                              );
                              if (!await launchUrl(
                                info,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw Exception('Could not launch $info');
                              }
                            }
                          : null,
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.tertiary,
                      ),
                      icon: const Icon(TablerIcons.mailbox),
                      label: const Text(
                        'Request an invitation to join',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Footer
              Center(
                child: Text(
                  'By signing in, you agree to AO3\'s Terms of Service',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() {
    setState(() {
      _isLoading = true;
    });

    // Attempt to sign in with the provided email and password
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    provider
        .signIn(username: email, password: password)
        .then((user) {
          if (user != null) {
            if (mounted) {
              // Sign in successful
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Welcome back, ${user.name}!'),
                  behavior: SnackBarBehavior.floating,
                ),
              );

              if (widget.onboarding) {
                context.navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeActivity()),
                  (route) => false,
                );
              } else {
                context.navigator.pop();
              }
            }
          } else {
            // Sign in failed
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sign in failed. Please check your credentials.'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        })
        .catchError((error) {
          // Handle any errors during sign in
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error signing in: $error'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        })
        .whenComplete(() {
          setState(() {
            _isLoading = false;
          });
        });
  }
}
