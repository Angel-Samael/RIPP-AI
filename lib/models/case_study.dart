class CaseStudy {
  final String id;
  final String title;
  final String client;
  final String industry;
  final String challenge;
  final String solution;
  final Map<String, String> results;
  final List<String> tags;
  final String imageUrl;
  final Duration projectDuration;

  const CaseStudy({
    required this.id,
    required this.title,
    required this.client,
    required this.industry,
    required this.challenge,
    required this.solution,
    required this.results,
    required this.tags,
    required this.imageUrl,
    required this.projectDuration,
  });
}

class CaseStudyData {
  static const List<CaseStudy> caseStudies = [
    CaseStudy(
      id: 'techflow_content',
      title: 'TechFlow: 300% Content Engagement Boost',
      client: 'TechFlow Solutions',
      industry: 'B2B SaaS',
      challenge: 'TechFlow struggled with low content engagement and inconsistent publishing schedule. Their content wasn\'t resonating with their target audience of enterprise decision-makers.',
      solution: 'We implemented our AI Content Profit system, analyzing their audience data and competitor strategies. Our AI generated a personalized content calendar with topic suggestions, created optimized content across formats, and automated distribution timing.',
      results: {
        'Content Engagement': '+300%',
        'Organic Traffic': '+150%',
        'Lead Generation': '+220%',
        'Time Saved': '40 hours/week',
        'Content Production': '+500%'
      },
      tags: ['Content Strategy', 'B2B SaaS', 'Lead Generation'],
      imageUrl: 'https://pixabay.com/get/gcfd9b78eef648bc28f63252234a4a11f944b65c4b2f5ad7d846b8ae9f6efe40d237e8d8605a3d54b5e7c4d7ab9da9b74501e261df28a35cfd1a5c62e7cf74903_1280.jpg',
      projectDuration: Duration(days: 90),
    ),
    
    CaseStudy(
      id: 'growthlab_leads',
      title: 'GrowthLab: 500% Lead Generation Increase',
      client: 'GrowthLab Marketing',
      industry: 'Digital Marketing',
      challenge: 'GrowthLab needed to scale their lead generation efforts but lacked the resources for manual outreach. Their conversion rates were declining, and manual processes were limiting growth.',
      solution: 'We deployed our AI Lead Generation system with automated prospect identification, personalized outreach campaigns, and intelligent follow-up sequences. The system integrated with their existing CRM for seamless workflow.',
      results: {
        'Qualified Leads': '+500%',
        'Conversion Rate': '+180%',
        'Response Rate': '+250%',
        'Manual Effort': '-80%',
        'Cost per Lead': '-60%'
      },
      tags: ['Lead Generation', 'Marketing Agency', 'Automation'],
      imageUrl: 'https://pixabay.com/get/g9b693365274dbebaebf379665ede8deae4e5f141f9feb688d7f9acb6e6de1b4fd9f592a62478b13404a70ecbbecdca318bb35b6a034dbafb9bf452c758480fdb_1280.jpg',
      projectDuration: Duration(days: 60),
    ),
    
    CaseStudy(
      id: 'innovatecorp_sales',
      title: 'InnovateCorp: Sales Automation Success',
      client: 'InnovateCorp Technologies',
      industry: 'Enterprise Software',
      challenge: 'InnovateCorp had inconsistent sales processes and struggled with accurate forecasting. Their sales team spent too much time on administrative tasks instead of selling.',
      solution: 'We implemented comprehensive AI Sales Automation including intelligent lead scoring, automated follow-ups, and predictive forecasting. Custom chatbots handled initial inquiries while the sales team focused on qualified prospects.',
      results: {
        'Sales Velocity': '+400%',
        'Forecast Accuracy': '+95%',
        'Admin Time': '-70%',
        'Deal Closure Rate': '+160%',
        'Revenue Growth': '+280%'
      },
      tags: ['Sales Automation', 'Enterprise', 'Forecasting'],
      imageUrl: 'https://pixabay.com/get/g7428fd329cc353975a4a68bd7354ba7a4284cf171ffc89f983e0f435322894112138e5749aafe71bf605754961643828f4d9aff2f7dd42fd6dc4e176070d4833_1280.png',
      projectDuration: Duration(days: 120),
    ),
    
    CaseStudy(
      id: 'futurescale_marketing',
      title: 'FutureScale: Marketing ROI Transformation',
      client: 'FutureScale Ventures',
      industry: 'FinTech',
      challenge: 'FutureScale was burning through marketing budget with poor ROI. They couldn\'t identify which channels and campaigns were actually driving revenue.',
      solution: 'Our AI Marketing Services analyzed their entire funnel, optimized ad spend allocation, and created data-driven campaigns. Automated A/B testing and real-time optimization ensured maximum performance.',
      results: {
        'Marketing ROI': '+350%',
        'Cost per Acquisition': '-45%',
        'Campaign Performance': '+280%',
        'Attribution Accuracy': '+90%',
        'Budget Efficiency': '+200%'
      },
      tags: ['Marketing Strategy', 'FinTech', 'ROI Optimization'],
      imageUrl: 'https://pixabay.com/get/ga07f1459f6d0169b7562e5202ba5dd29bd3975633f8c88433d8ad82d52619d9a84889261817ba30ff60d30663602cce11d5e4287cb8b63983c823c79e5eab3db_1280.png',
      projectDuration: Duration(days: 75),
    ),
    
    CaseStudy(
      id: 'ai_dynamics_procurement',
      title: 'AI Dynamics: Procurement Cost Reduction',
      client: 'AI Dynamics Corp',
      industry: 'Manufacturing',
      challenge: 'AI Dynamics faced rising procurement costs and inefficient supplier management. Manual processes led to missed opportunities for cost savings and supplier optimization.',
      solution: 'We implemented AI Procurement Optimization with automated supplier analysis, cost prediction models, and smart contract negotiations. The system identified cost-saving opportunities and streamlined approval processes.',
      results: {
        'Cost Reduction': '-35%',
        'Process Efficiency': '+85%',
        'Supplier Performance': '+120%',
        'Contract Optimization': '+200%',
        'Approval Time': '-60%'
      },
      tags: ['Procurement', 'Manufacturing', 'Cost Optimization'],
      imageUrl: 'https://pixabay.com/get/gecc1003152487759102868a79f4036db6ecae59bf6cbbf02811a453ed1bf189844541f54f856c0f0d510d9523ce6c9f868b7278b9b00a2b3cbcadc25787f78a7_1280.png',
      projectDuration: Duration(days: 100),
    ),
    
    CaseStudy(
      id: 'nextgen_content',
      title: 'NextGen: Multi-Channel Content Mastery',
      client: 'NextGen Solutions',
      industry: 'Consulting',
      challenge: 'NextGen needed to establish thought leadership across multiple channels but lacked the resources for consistent, high-quality content creation across platforms.',
      solution: 'Our AI Content Profit system created a unified content strategy with automated repurposing across LinkedIn, blogs, podcasts, and video platforms. AI-generated insights ensured thought leadership positioning.',
      results: {
        'Brand Awareness': '+400%',
        'Thought Leadership': '+250%',
        'Cross-Channel Reach': '+300%',
        'Content Velocity': '+600%',
        'Engagement Quality': '+180%'
      },
      tags: ['Content Strategy', 'Thought Leadership', 'Multi-Channel'],
      imageUrl: 'https://pixabay.com/get/g71ac0435108ce4c09d97eac73a4da9687b6f66b34bf67f0db518294bcf4313668c823b4d1dd27e321ea70b8f6faba2035f6ba17f331d4564af3723704fee21d9_1280.png',
      projectDuration: Duration(days: 85),
    ),
  ];
  
  static List<CaseStudy> getCaseStudiesByTag(String tag) {
    return caseStudies.where((study) => study.tags.contains(tag)).toList();
  }
  
  static List<CaseStudy> getCaseStudiesByIndustry(String industry) {
    return caseStudies.where((study) => study.industry == industry).toList();
  }
  
  static CaseStudy? getCaseStudyById(String id) {
    try {
      return caseStudies.firstWhere((study) => study.id == id);
    } catch (e) {
      return null;
    }
  }
  
  static List<String> getAllTags() {
    final tags = <String>{};
    for (final study in caseStudies) {
      tags.addAll(study.tags);
    }
    return tags.toList()..sort();
  }
  
  static List<String> getAllIndustries() {
    return caseStudies.map((study) => study.industry).toSet().toList()..sort();
  }
}