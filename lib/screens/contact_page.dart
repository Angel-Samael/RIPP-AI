import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ripplai/theme.dart';
import 'package:ripplai/widgets/gradient_container.dart';
import 'package:ripplai/widgets/neon_button.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _revenueController = TextEditingController();
  final _challengeController = TextEditingController();
  final _messageController = TextEditingController();
  
  String _selectedService = 'AI Content Profit';
  String _selectedRevenue = '\$1M - \$5M';
  bool _isLoading = false;

  final List<String> _services = [
    'AI Content Profit',
    'AI Marketing Services',
    'AI Lead Generation',
    'AI Procurement Optimization',
    'AI Sales Automation',
    'Custom AI Solution',
  ];

  final List<String> _revenueRanges = [
    'Under \$1M',
    '\$1M - \$5M',
    '\$5M - \$10M',
    '\$10M - \$25M',
    '\$25M - \$50M',
    'Over \$50M',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _revenueController.dispose();
    _challengeController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RippAIColors.primaryGradient,
        ),
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: RippAIColors.electricCyan,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().slideY(begin: -0.3, duration: 600.ms).fadeIn(),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: RippAIColors.primaryGradient,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          '🚀',
                          style: const TextStyle(fontSize: 48),
                        ).animate().scale(begin: const Offset(0.5, 0.5), duration: 800.ms, curve: Curves.elasticOut),
                        
                        const SizedBox(height: 16),
                        
                        Text(
                          'Start Your AI Transformation',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                          ),
                          textAlign: TextAlign.center,
                        ).animate(delay: 200.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
                      ],
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: RippAIColors.electricCyan),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            
            SliverList(
              delegate: SliverChildListDelegate([
                // Contact Options
                Container(
                  margin: const EdgeInsets.all(20),
                  child: GradientContainer(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          'Ready to Transform Your Business?',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: RippAIColors.electricCyan,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Choose how you\'d like to get started with RIPP AI',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        
                        Row(
                          children: [
                            Expanded(
                              child: _ContactOption(
                                icon: Icons.phone,
                                title: 'Book a Call',
                                subtitle: 'Free 30-min consultation',
                                onTap: () => _showBookCallModal(),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _ContactOption(
                                icon: Icons.message,
                                title: 'Send Message',
                                subtitle: 'Get detailed proposal',
                                onTap: () => _scrollToForm(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).animate().slideY(begin: 0.3, duration: 600.ms).fadeIn(),
                
                // Quick Stats
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: _QuickStat(
                          number: '24hrs',
                          label: 'Response Time',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _QuickStat(
                          number: '500+',
                          label: 'Success Stories',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _QuickStat(
                          number: '2.5x',
                          label: 'Avg ROI Increase',
                        ),
                      ),
                    ],
                  ),
                ).animate(delay: 200.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
                
                const SizedBox(height: 40),
                
                // Contact Form
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: GradientContainer(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tell Us About Your Business',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: RippAIColors.electricCyan,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Help us understand your needs so we can provide the best AI solution',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: RippAIColors.pureWhite.withValues(alpha: 0.8),
                            ),
                          ),
                          const SizedBox(height: 24),
                          
                          // Name and Email Row
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  controller: _nameController,
                                  label: 'Full Name',
                                  icon: Icons.person,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Name is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildTextField(
                                  controller: _emailController,
                                  label: 'Email',
                                  icon: Icons.email,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Email is required';
                                    }
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                                      return 'Enter valid email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Company
                          _buildTextField(
                            controller: _companyController,
                            label: 'Company Name',
                            icon: Icons.business,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Company name is required';
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Service Interest
                          Text(
                            'Service of Interest',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: RippAIColors.pureWhite,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: RippAIColors.deepNavy.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: RippAIColors.electricCyan.withValues(alpha: 0.3),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedService,
                                isExpanded: true,
                                dropdownColor: RippAIColors.deepNavy,
                                style: const TextStyle(color: RippAIColors.pureWhite),
                                items: _services.map((service) => DropdownMenuItem(
                                  value: service,
                                  child: Text(service),
                                )).toList(),
                                onChanged: (value) => setState(() => _selectedService = value!),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Annual Revenue
                          Text(
                            'Annual Revenue',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: RippAIColors.pureWhite,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: RippAIColors.deepNavy.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: RippAIColors.electricCyan.withValues(alpha: 0.3),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedRevenue,
                                isExpanded: true,
                                dropdownColor: RippAIColors.deepNavy,
                                style: const TextStyle(color: RippAIColors.pureWhite),
                                items: _revenueRanges.map((range) => DropdownMenuItem(
                                  value: range,
                                  child: Text(range),
                                )).toList(),
                                onChanged: (value) => setState(() => _selectedRevenue = value!),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Current Challenge
                          _buildTextField(
                            controller: _challengeController,
                            label: 'Biggest Business Challenge',
                            icon: Icons.help_outline,
                            maxLines: 3,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please describe your challenge';
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Additional Message
                          _buildTextField(
                            controller: _messageController,
                            label: 'Additional Message (Optional)',
                            icon: Icons.message,
                            maxLines: 4,
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Submit Button
                          SizedBox(
                            width: double.infinity,
                            child: _isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: RippAIColors.electricCyan,
                                    ),
                                  )
                                : NeonButton(
                                    text: 'Send Message',
                                    icon: Icons.send,
                                    onPressed: _submitForm,
                                  ),
                          ),
                          
                          const SizedBox(height: 16),
                          
                          Text(
                            '🔒 Your information is secure and will never be shared',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: RippAIColors.pureWhite.withValues(alpha: 0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animate(delay: 400.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
                
                const SizedBox(height: 40),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: RippAIColors.pureWhite,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(color: RippAIColors.pureWhite),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: RippAIColors.electricCyan),
            filled: true,
            fillColor: RippAIColors.deepNavy.withValues(alpha: 0.8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: RippAIColors.electricCyan.withValues(alpha: 0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: RippAIColors.electricCyan.withValues(alpha: 0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: RippAIColors.electricCyan, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  void _scrollToForm() {
    // In a real app, you'd use a scroll controller to scroll to the form
    // For now, we'll just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill out the form below'),
        backgroundColor: RippAIColors.electricCyan,
      ),
    );
  }

  void _showBookCallModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          gradient: RippAIColors.primaryGradient,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: RippAIColors.electricCyan,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            
            const Icon(Icons.phone, color: RippAIColors.electricCyan, size: 48),
            const SizedBox(height: 16),
            
            Text(
              'Book a Free Consultation',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: RippAIColors.electricCyan,
              ),
            ),
            const SizedBox(height: 8),
            
            Text(
              'Schedule a 30-minute call with our AI experts to discuss your specific needs and get a custom solution proposal.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: RippAIColors.pureWhite.withValues(alpha: 0.9),
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 24),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _showSuccess('Call booking feature coming soon!');
                },
                icon: const Icon(Icons.calendar_today),
                label: const Text('Select Time Slot'),
              ),
            ),
            
            const SizedBox(height: 12),
            
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Maybe Later', style: TextStyle(color: RippAIColors.pureWhite)),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    _showSuccess('Message sent successfully! We\'ll get back to you within 24 hours.');
    
    // Clear form
    _nameController.clear();
    _emailController.clear();
    _companyController.clear();
    _challengeController.clear();
    _messageController.clear();
  }

  void _showSuccess(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: RippAIColors.deepNavy,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: RippAIColors.electricCyan),
            SizedBox(width: 12),
            Text('Success!', style: TextStyle(color: RippAIColors.electricCyan)),
          ],
        ),
        content: Text(
          message,
          style: const TextStyle(color: RippAIColors.pureWhite),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to home
            },
            child: const Text('Great!', style: TextStyle(color: RippAIColors.electricCyan)),
          ),
        ],
      ),
    );
  }
}

class _ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: RippAIColors.deepNavy.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: RippAIColors.electricCyan.withValues(alpha: 0.3),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: RippAIColors.electricCyan, size: 32),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: RippAIColors.pureWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: RippAIColors.pureWhite.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickStat extends StatelessWidget {
  final String number;
  final String label;

  const _QuickStat({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            RippAIColors.deepNavy.withValues(alpha: 0.8),
            RippAIColors.darkIndigo.withValues(alpha: 0.9),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: RippAIColors.matteGold.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              color: RippAIColors.matteGold,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: RippAIColors.pureWhite,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}