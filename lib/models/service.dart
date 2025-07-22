class Service {
  final String id;
  final String name;
  final String description;
  final String category;
  final List<String> features;
  final String icon;
  final String expectedOutcome;
  final String process;

  const Service({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.features,
    required this.icon,
    required this.expectedOutcome,
    required this.process,
  });
}

class ServiceData {
  static const List<Service> services = [
    // AI Content Profit Services
    Service(
      id: 'content_strategy',
      name: 'Content Strategy',
      description: 'AI-powered content planning that aligns with your business goals and audience needs',
      category: 'AI Content Profit',
      features: [
        '🎯 Audience Analysis & Segmentation',
        '📊 Content Performance Prediction',
        '🗓️ Automated Content Calendar',
        '💡 Trend-Based Topic Generation',
        '🔍 SEO-Optimized Content Planning'
      ],
      icon: '🎯',
      expectedOutcome: '300% increase in content engagement and 150% growth in organic reach within 90 days',
      process: 'Data analysis → Strategy development → Content calendar → Performance optimization',
    ),
    
    Service(
      id: 'content_production',
      name: 'Content Production',
      description: 'Automated content creation across all formats with human-quality output',
      category: 'AI Content Profit',
      features: [
        '✍️ Multi-format Content Creation',
        '🎨 Visual Content Generation',
        '📹 Video Script Development',
        '🎧 Podcast Content Planning',
        '📱 Social Media Adaptation'
      ],
      icon: '⚡',
      expectedOutcome: '10x faster content production with 95% quality retention',
      process: 'Brief analysis → Content generation → Quality review → Format optimization',
    ),
    
    Service(
      id: 'content_distribution',
      name: 'Content Distribution',
      description: 'Smart content distribution across channels for maximum impact',
      category: 'AI Content Profit',
      features: [
        '📈 Channel Optimization',
        '⏰ Timing Intelligence',
        '👥 Audience Targeting',
        '📊 Performance Tracking',
        '🔄 Auto-Repurposing'
      ],
      icon: '🚀',
      expectedOutcome: '5x increase in content reach with 70% improvement in engagement rates',
      process: 'Channel analysis → Distribution strategy → Automated posting → Performance optimization',
    ),
    
    // AI Marketing Services
    Service(
      id: 'marketing_strategy',
      name: 'Marketing Strategy',
      description: 'Data-driven marketing strategies powered by AI insights',
      category: 'AI Marketing Services',
      features: [
        '📊 Market Intelligence',
        '🎯 Customer Journey Mapping',
        '💰 Budget Optimization',
        '📈 Growth Forecasting',
        '🔍 Competitor Analysis'
      ],
      icon: '🧠',
      expectedOutcome: '250% ROI improvement with 40% reduction in customer acquisition cost',
      process: 'Market research → Strategy formulation → Implementation planning → Performance tracking',
    ),
    
    Service(
      id: 'marketing_design',
      name: 'Marketing Design',
      description: 'AI-generated marketing visuals that convert',
      category: 'AI Marketing Services',
      features: [
        '🎨 Brand-Consistent Visuals',
        '📱 Multi-Platform Adaptation',
        '🧪 A/B Testing Variations',
        '📊 Performance-Based Optimization',
        '🎯 Conversion-Focused Design'
      ],
      icon: '🎨',
      expectedOutcome: '180% increase in click-through rates with 60% faster design turnaround',
      process: 'Brand analysis → Design generation → Testing → Optimization → Deployment',
    ),
    
    Service(
      id: 'marketing_optimization',
      name: 'Marketing Optimization',
      description: 'Continuous campaign optimization using AI algorithms',
      category: 'AI Marketing Services',
      features: [
        '📈 Real-time Performance Monitoring',
        '🔄 Automated A/B Testing',
        '💡 Predictive Analytics',
        '🎯 Audience Refinement',
        '💰 Budget Reallocation'
      ],
      icon: '📈',
      expectedOutcome: '300% improvement in campaign performance with 50% cost reduction',
      process: 'Campaign setup → Performance monitoring → Optimization → Scaling → Reporting',
    ),
    
    // Standalone Services
    Service(
      id: 'lead_generation',
      name: 'AI Lead Generation',
      description: 'Automated lead generation system that identifies and converts prospects',
      category: 'Lead Generation',
      features: [
        '🎯 Prospect Identification',
        '📧 Automated Outreach',
        '💬 Conversation Management',
        '📊 Lead Scoring',
        '🔄 Follow-up Automation'
      ],
      icon: '🎯',
      expectedOutcome: '500% increase in qualified leads with 80% less manual effort',
      process: 'Target definition → Prospect research → Outreach automation → Conversion tracking',
    ),
    
    Service(
      id: 'procurement_optimization',
      name: 'AI Procurement Optimization',
      description: 'Optimize procurement processes and reduce costs through AI analysis',
      category: 'Procurement',
      features: [
        '💰 Cost Analysis & Reduction',
        '📊 Supplier Performance Tracking',
        '🔍 Market Intelligence',
        '⚡ Process Automation',
        '📈 ROI Optimization'
      ],
      icon: '💰',
      expectedOutcome: '30% cost reduction with 90% process efficiency improvement',
      process: 'Current state analysis → Optimization strategy → Implementation → Monitoring',
    ),
    
    Service(
      id: 'ai_sales',
      name: 'AI Sales Automation',
      description: 'End-to-end sales process automation for consistent results',
      category: 'Sales',
      features: [
        '🤖 Sales Process Automation',
        '📞 Intelligent Call Routing',
        '📊 Sales Forecasting',
        '💬 Chatbot Integration',
        '📈 Performance Analytics'
      ],
      icon: '💼',
      expectedOutcome: '400% increase in sales velocity with 95% accuracy in forecasting',
      process: 'Sales audit → Process design → Automation setup → Training → Optimization',
    ),
  ];
  
  static List<Service> getServicesByCategory(String category) {
    return services.where((service) => service.category == category).toList();
  }
  
  static Service? getServiceById(String id) {
    try {
      return services.firstWhere((service) => service.id == id);
    } catch (e) {
      return null;
    }
  }
  
  static List<String> getCategories() {
    return services.map((service) => service.category).toSet().toList();
  }
}