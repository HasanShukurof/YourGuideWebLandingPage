import 'package:flutter/material.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourGuide - Azərbaycanda Səyahət Rehbərin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0099CC),
          primary: const Color(0xFF0099CC),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildFeaturesSection(context),
            _buildShowcaseSection(context),
            _buildDownloadSection(context),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF0099CC), const Color(0xFF00C4FF)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80,
          vertical: isMobile ? 60 : 120,
        ),
        child: isMobile
            ? Column(
                children: [
                  _buildHeroContent(context, isMobile),
                  const SizedBox(height: 60),
                  _buildHeroImage(context, isMobile),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildHeroContent(context, isMobile)),
                  const SizedBox(width: 80),
                  Expanded(child: _buildHeroImage(context, isMobile)),
                ],
              ),
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'YourGuide',
          style: TextStyle(
            fontSize: isMobile ? 48 : 72,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.1,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 24),
        Text(
          'Azərbaycanda Şəxsi Turistik Rehbəriniz',
          style: TextStyle(
            fontSize: isMobile ? 20 : 28,
            color: Colors.white.withOpacity(0.95),
            fontWeight: FontWeight.w400,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 16),
        Text(
          'Bakı və Azərbaycanın gizli incilərini kəşf edin. Xarici turistlər üçün hazırlanmış peşəkar rehber tətbiqi.',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white.withOpacity(0.9),
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: [
                  _buildAppStoreButton(true),
                  const SizedBox(height: 16),
                  _buildPlayStoreButton(true),
                ],
              )
            : Row(
                children: [
                  _buildAppStoreButton(false),
                  const SizedBox(width: 16),
                  _buildPlayStoreButton(false),
                ],
              ),
      ],
    );
  }

  Widget _buildHeroImage(BuildContext context, bool isMobile) {
    return Container(
      height: isMobile ? 300 : 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Icon(
        Icons.phone_iphone,
        size: isMobile ? 200 : 400,
        color: Colors.white.withOpacity(0.9),
      ),
    );
  }

  Widget _buildAppStoreButton(bool isMobile) {
    return InkWell(
      onTap: () =>
          _launchURL('https://apps.apple.com/us/app/yourguide/id6743021474'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.apple, color: Colors.white, size: 32),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Download on the',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 10,
                  ),
                ),
                const Text(
                  'App Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayStoreButton(bool isMobile) {
    return InkWell(
      onTap: () => _launchURL(
        'https://play.google.com/store/apps/details?id=com.hasanshukurov.llctripaz.tripaz_app',
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.play_arrow, color: Colors.white, size: 32),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GET IT ON',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 10,
                  ),
                ),
                const Text(
                  'Google Play',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Xüsusiyyətlər',
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Səyahətinizi asanlaşdıran güclü funksiyalar',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),
          isMobile
              ? Column(
                  children: [
                    _buildFeatureCard(
                      Icons.location_on,
                      'İnteraktiv Xəritə',
                      'Azərbaycanın bütün turistik yerlərini kəşf edin',
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.language,
                      'Çoxdilli Dəstək',
                      'İngilis, rus və digər dillərdə tərcümə',
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.museum,
                      'Tarixi Yerlər',
                      'Qədim abidələr və muzeylərin ətraflı məlumatı',
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.restaurant,
                      'Restoran Tövsiyələri',
                      'Ən yaxşı milli mətbəx restoranları',
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.hotel,
                      'Yaşayış Yerləri',
                      'Otellər və qonaq evləri haqqında məlumat',
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.offline_pin,
                      'Offline Rejim',
                      'İnternet olmadan da istifadə edin',
                      true,
                    ),
                  ],
                )
              : Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: [
                    _buildFeatureCard(
                      Icons.location_on,
                      'İnteraktiv Xəritə',
                      'Azərbaycanın bütün turistik yerlərini kəşf edin',
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.language,
                      'Çoxdilli Dəstək',
                      'İngilis, rus və digər dillərdə tərcümə',
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.museum,
                      'Tarixi Yerlər',
                      'Qədim abidələr və muzeylərin ətraflı məlumatı',
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.restaurant,
                      'Restoran Tövsiyələri',
                      'Ən yaxşı milli mətbəx restoranları',
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.hotel,
                      'Yaşayış Yerləri',
                      'Otellər və qonaq evləri haqqında məlumat',
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.offline_pin,
                      'Offline Rejim',
                      'İnternet olmadan da istifadə edin',
                      false,
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    IconData icon,
    String title,
    String description,
    bool isMobile,
  ) {
    return Container(
      width: isMobile ? double.infinity : 350,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF0099CC).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 48, color: const Color(0xFF0099CC)),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildShowcaseSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Niyə YourGuide?',
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Azərbaycanda ən yaxşı səyahət təcrübəsi üçün',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 40 : 60),
          isMobile
              ? Column(
                  children: [
                    _buildShowcaseItem('🗺️', '500+', 'Turistik Yer', true),
                    const SizedBox(height: 32),
                    _buildShowcaseItem('🌍', '50K+', 'Xarici Turist', true),
                    const SizedBox(height: 32),
                    _buildShowcaseItem('⭐', '4.8', 'App Store Reytinqi', true),
                    const SizedBox(height: 32),
                    _buildShowcaseItem('🏛️', '100+', 'Tarixi Abidə', true),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildShowcaseItem('🗺️', '500+', 'Turistik Yer', false),
                    _buildShowcaseItem('🌍', '50K+', 'Xarici Turist', false),
                    _buildShowcaseItem('⭐', '4.8', 'App Store Reytinqi', false),
                    _buildShowcaseItem('🏛️', '100+', 'Tarixi Abidə', false),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildShowcaseItem(
    String emoji,
    String number,
    String label,
    bool isMobile,
  ) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 64)),
        const SizedBox(height: 16),
        Text(
          number,
          style: TextStyle(
            fontSize: isMobile ? 40 : 48,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0099CC),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDownloadSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF0099CC), const Color(0xFF00C4FF)],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Səyahətə Başlayın',
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'YourGuide-ı indi yükləyin və Azərbaycanı kəşf edin',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.white.withOpacity(0.95),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [
                    _buildAppStoreButton(true),
                    const SizedBox(height: 16),
                    _buildPlayStoreButton(true),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAppStoreButton(false),
                    const SizedBox(width: 16),
                    _buildPlayStoreButton(false),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.grey[900],
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        children: [
          Text(
            'YourGuide',
            style: TextStyle(
              fontSize: isMobile ? 28 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Azərbaycanda Şəxsi Turistik Rehbəriniz',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 32),
          Divider(color: Colors.white.withOpacity(0.2)),
          const SizedBox(height: 32),
          Text(
            '© 2024 YourGuide. Bütün hüquqlar qorunur.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
