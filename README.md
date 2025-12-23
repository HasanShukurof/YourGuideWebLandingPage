# YourGuide - Landing Page

YourGuide mobil tətbiqi üçün peşəkar landing page. Azərbaycanda xarici turistlər üçün hazırlanmış turistik rehber tətbiqi.

## 🌟 Xüsusiyyətlər

- **Modern və Responsive Dizayn**: Bütün cihazlarda mükəmməl görünüş
- **İnteraktiv İnterfeýs**: Animasiyalı və istifadəçi dostu
- **App Store Linləri**: Birbaşa yükləmə düymələri
- **SEO Optimizasiyalı**: Axtarış motorları üçün optimallaşdırılmış
- **Çoxdilli**: Azərbaycan və ingilis dilində dəstək

## 📱 Tətbiqi yükləyin

- [App Store](https://apps.apple.com/)
- [Google Play Store](https://play.google.com/store)

## 🚀 Quraşdırma və İşə Salma

### Tələblər

- Flutter SDK (3.9.0 və ya yuxarı)
- Dart SDK
- Web brauzer

### Lokal olaraq işə salmaq

1. Layihəni klonlayın və ya yükləyin
2. Asılılıqları yükləyin:
```bash
flutter pub get
```

3. Web versiyasını işə salın:
```bash
flutter run -d chrome
```

### Production üçün build

Web üçün build etmək:
```bash
flutter build web --release
```

Build faylları `build/web/` qovluğunda olacaq.

## 📂 Struktur

```
lib/
  └── main.dart          # Əsas tətbiq faylı və landing page
web/
  ├── index.html         # HTML template
  ├── manifest.json      # PWA manifest
  └── icons/             # Tətbiq ikonları
```

## 🎨 Dizayn

Landing page aşağıdakı bölmələrdən ibarətdir:

1. **Hero Section**: Əsas başlıq və app yükləmə düymələri
2. **Features Section**: Tətbiqin əsas xüsusiyyətləri
3. **Showcase Section**: Statistika və uğurlar
4. **Download Section**: Təkrar çağırış (CTA)
5. **Footer**: Əlaqə məlumatları

## 🌐 Hosting

Bu layihəni aşağıdakı platformalarda host edə bilərsiniz:

- Firebase Hosting
- Netlify
- Vercel
- GitHub Pages
- AWS S3 + CloudFront

### Firebase Hosting nümunəsi:

```bash
# Firebase CLI quraşdırın
npm install -g firebase-tools

# Firebase-ə daxil olun
firebase login

# Layihəni inisializə edin
firebase init hosting

# Deploy edin
firebase deploy
```

## 📝 Fərdiləşdirmə

`lib/main.dart` faylında aşağıdakıları dəyişdirə bilərsiniz:

- App Store və Play Store linklərini
- Rəngləri və temalar
- Mətn məzmununu
- Xüsusiyyətlər və statistika
- Emoji və ikonlar

## 🔗 Faydalı Linklər

- [Flutter Web Documentation](https://docs.flutter.dev/platform-integration/web)
- [Material Design](https://m3.material.io/)
- [Flutter Best Practices](https://docs.flutter.dev/perf/best-practices)

## 📄 Lisenziya

© 2024 YourGuide. Bütün hüquqlar qorunur.

## 🤝 Dəstək

Suallarınız və ya probleminiz varsa, bizimlə əlaqə saxlayın.

---

**Yaradıcı**: YourGuide Komandası  
**Tarix**: 2024  
**Status**: ✅ Hazır və İşlək
