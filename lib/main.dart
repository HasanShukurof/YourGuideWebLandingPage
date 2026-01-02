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
      title: 'YourGuide - Your Travel Guide in Azerbaijan',
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
  String _currentLanguage = 'az'; // 'az' or 'en'

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  void _toggleLanguage() {
    setState(() {
      _currentLanguage = _currentLanguage == 'az' ? 'en' : 'az';
    });
  }

  String _getText(String azText, String enText) {
    return _currentLanguage == 'az' ? azText : enText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
          // Language Toggle Button
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _toggleLanguage,
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _currentLanguage == 'az' ? '🇦🇿 AZ' : '🇬🇧 EN',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.language, color: Colors.white, size: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
          _getText(
            'Azərbaycanda Şəxsi Turistik Rehbəriniz',
            'Your Personal Travel Guide in Azerbaijan',
          ),
          style: TextStyle(
            fontSize: isMobile ? 20 : 28,
            color: Colors.white.withOpacity(0.95),
            fontWeight: FontWeight.w400,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 16),
        Text(
          _getText(
            'Bakı və Azərbaycanın gizli incilərini kəşf edin. Xarici turistlər üçün hazırlanmış peşəkar rehber tətbiqi.',
            'Discover Baku and Azerbaijan\'s hidden gems. Professional guide app designed for foreign tourists.',
          ),
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
      height: isMobile ? 450 : 650,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Realistic iPhone 14 Pro mockup
          Container(
            width: isMobile ? 210 : 310,
            height: isMobile ? 430 : 630,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isMobile ? 35 : 50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 80,
                  spreadRadius: 15,
                  offset: const Offset(0, 25),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Phone body
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1c1c1e),
                    borderRadius: BorderRadius.circular(isMobile ? 35 : 50),
                    border: Border.all(
                      color: const Color(0xFF2c2c2e),
                      width: isMobile ? 10 : 14,
                    ),
                  ),
                ),
                // Screen content - recreating YourGuide app UI
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 14 : 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(isMobile ? 25 : 36),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(isMobile ? 25 : 36),
                        child: Column(
                          children: [
                            // Status bar
                            Container(
                              height: isMobile ? 40 : 55,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '01:07',
                                      style: TextStyle(
                                        fontSize: isMobile ? 11 : 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.signal_cellular_alt,
                                          size: isMobile ? 12 : 16,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.wifi,
                                          size: isMobile ? 12 : 16,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.battery_full,
                                          size: isMobile ? 12 : 16,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // App content
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.all(isMobile ? 12 : 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Welcome section
                                      Text(
                                        'Welcome',
                                        style: TextStyle(
                                          fontSize: isMobile ? 18 : 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: isMobile ? 2 : 4),
                                      Text(
                                        'Let\'s Discover the best places',
                                        style: TextStyle(
                                          fontSize: isMobile ? 10 : 13,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                      SizedBox(height: isMobile ? 12 : 16),
                                      // Search bar
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: isMobile ? 10 : 14,
                                          vertical: isMobile ? 8 : 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(
                                            isMobile ? 8 : 12,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.search,
                                              size: isMobile ? 14 : 18,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: isMobile ? 6 : 8),
                                            Text(
                                              'Search tours...',
                                              style: TextStyle(
                                                fontSize: isMobile ? 10 : 13,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: isMobile ? 12 : 16),
                                      // Popular Packages
                                      Text(
                                        'Popular Packages',
                                        style: TextStyle(
                                          fontSize: isMobile ? 13 : 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: isMobile ? 8 : 12),
                                      // Tour cards
                                      _buildTourCard(
                                        'Baku city Tour',
                                        '1-3 pax',
                                        '135.0 AZN',
                                        const Color(0xFF0099CC),
                                        isMobile,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Dynamic Island
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: isMobile ? 100 : 145,
                      height: isMobile ? 28 : 38,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(isMobile ? 18 : 25),
                          bottomRight: Radius.circular(isMobile ? 18 : 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTourCard(
    String title,
    String pax,
    String price,
    Color color,
    bool isMobile,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 8 : 12),
      padding: EdgeInsets.all(isMobile ? 8 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 10 : 14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Tour image placeholder
          Container(
            width: isMobile ? 50 : 70,
            height: isMobile ? 50 : 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
              ),
              borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
            ),
            child: Icon(
              Icons.location_city,
              color: Colors.white,
              size: isMobile ? 20 : 28,
            ),
          ),
          SizedBox(width: isMobile ? 8 : 12),
          // Tour details
          Expanded(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  pax,
                  style: TextStyle(
                    fontSize: isMobile ? 9 : 11,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Price: $price',
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 13,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          // Favorite icon
          Icon(
            Icons.favorite_border,
            size: isMobile ? 16 : 20,
            color: Colors.grey,
          ),
        ],
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
            _getText('Xüsusiyyətlər', 'Features'),
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _getText(
              'Səyahətinizi asanlaşdıran güclü funksiyalar',
              'Powerful features to make your journey easier',
            ),
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
                      _getText('İnteraktiv Xəritə', 'Interactive Map'),
                      _getText(
                        'Azərbaycanın bütün turistik yerlərini kəşf edin',
                        'Discover all tourist attractions in Azerbaijan',
                      ),
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.language,
                      _getText('Çoxdilli Dəstək', 'Multilingual Support'),
                      _getText(
                        'İngilis, rus və digər dillərdə tərcümə',
                        'Translation in English, Russian and other languages',
                      ),
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.museum,
                      _getText('Tarixi Yerlər', 'Historical Places'),
                      _getText(
                        'Qədim abidələr və muzeylərin ətraflı məlumatı',
                        'Detailed information about ancient monuments and museums',
                      ),
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.restaurant,
                      _getText('Restoran Tövsiyələri', 'Restaurant Recommendations'),
                      _getText(
                        'Ən yaxşı milli mətbəx restoranları',
                        'The best national cuisine restaurants',
                      ),
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.hotel,
                      _getText('Yaşayış Yerləri', 'Accommodations'),
                      _getText(
                        'Otellər və qonaq evləri haqqında məlumat',
                        'Information about hotels and guest houses',
                      ),
                      true,
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.offline_pin,
                      _getText('Offline Rejim', 'Offline Mode'),
                      _getText(
                        'İnternet olmadan da istifadə edin',
                        'Use without internet connection',
                      ),
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
                      _getText('İnteraktiv Xəritə', 'Interactive Map'),
                      _getText(
                        'Azərbaycanın bütün turistik yerlərini kəşf edin',
                        'Discover all tourist attractions in Azerbaijan',
                      ),
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.language,
                      _getText('Çoxdilli Dəstək', 'Multilingual Support'),
                      _getText(
                        'İngilis, rus və digər dillərdə tərcümə',
                        'Translation in English, Russian and other languages',
                      ),
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.museum,
                      _getText('Tarixi Yerlər', 'Historical Places'),
                      _getText(
                        'Qədim abidələr və muzeylərin ətraflı məlumatı',
                        'Detailed information about ancient monuments and museums',
                      ),
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.restaurant,
                      _getText('Restoran Tövsiyələri', 'Restaurant Recommendations'),
                      _getText(
                        'Ən yaxşı milli mətbəx restoranları',
                        'The best national cuisine restaurants',
                      ),
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.hotel,
                      _getText('Yaşayış Yerləri', 'Accommodations'),
                      _getText(
                        'Otellər və qonaq evləri haqqında məlumat',
                        'Information about hotels and guest houses',
                      ),
                      false,
                    ),
                    _buildFeatureCard(
                      Icons.offline_pin,
                      _getText('Offline Rejim', 'Offline Mode'),
                      _getText(
                        'İnternet olmadan da istifadə edin',
                        'Use without internet connection',
                      ),
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
            _getText('Niyə YourGuide?', 'Why YourGuide?'),
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _getText(
              'Azərbaycanda ən yaxşı səyahət təcrübəsi üçün',
              'For the best travel experience in Azerbaijan',
            ),
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
                    _buildShowcaseItem(
                      '🗺️',
                      '500+',
                      _getText('Turistik Yer', 'Tourist Places'),
                      true,
                    ),
                    const SizedBox(height: 32),
                    _buildShowcaseItem(
                      '🌍',
                      '50K+',
                      _getText('Xarici Turist', 'Foreign Tourists'),
                      true,
                    ),
                    const SizedBox(height: 32),
                    _buildShowcaseItem(
                      '⭐',
                      '4.8',
                      _getText('App Store Reytinqi', 'App Store Rating'),
                      true,
                    ),
                    const SizedBox(height: 32),
                    _buildShowcaseItem(
                      '🏛️',
                      '100+',
                      _getText('Tarixi Abidə', 'Historical Monuments'),
                      true,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildShowcaseItem(
                      '🗺️',
                      '500+',
                      _getText('Turistik Yer', 'Tourist Places'),
                      false,
                    ),
                    _buildShowcaseItem(
                      '🌍',
                      '50K+',
                      _getText('Xarici Turist', 'Foreign Tourists'),
                      false,
                    ),
                    _buildShowcaseItem(
                      '⭐',
                      '4.8',
                      _getText('App Store Reytinqi', 'App Store Rating'),
                      false,
                    ),
                    _buildShowcaseItem(
                      '🏛️',
                      '100+',
                      _getText('Tarixi Abidə', 'Historical Monuments'),
                      false,
                    ),
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
            _getText('Səyahətə Başlayın', 'Start Your Journey'),
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            _getText(
              'YourGuide-ı indi yükləyin və Azərbaycanı kəşf edin',
              'Download YourGuide now and discover Azerbaijan',
            ),
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
            _getText(
              'Azərbaycanda Şəxsi Turistik Rehbəriniz',
              'Your Personal Travel Guide in Azerbaijan',
            ),
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 32),
          Divider(color: Colors.white.withOpacity(0.2)),
          const SizedBox(height: 32),
          Text(
            _getText(
              '© 2024 YourGuide. Bütün hüquqlar qorunur.',
              '© 2024 YourGuide. All rights reserved.',
            ),
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
