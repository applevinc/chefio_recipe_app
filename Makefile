watch:
	dart run build_runner build --delete-conflicting-outputs
deep-clean:
	flutter clean
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	flutter pub get
	cd ios && pod deintegrate && pod setup && pod install
clean:
	flutter clean
	flutter pub get
android-qa-build-apk:
	flutter clean
	flutter pub get
	flutter build apk --flavor qa -t lib/main/main_qa.dart
android-qa-build-appbundle:
	flutter clean
	flutter pub get
	flutter build appbundle --flavor qa -t lib/main/main_qa.dart
android-prod-build-appbundle:
	flutter clean
	flutter pub get
	flutter build appbundle --flavor prod -t lib/main/main_prod.dart
apk:
	flutter clean
	flutter pub get
	flutter build apk --flavor prod -t lib/main/main_prod.dart
ios-qa-build:
	flutter clean
	flutter pub get
	flutter build ios --flavor qa -t lib/main/main_qa.dart
ios-prod-build:
	flutter clean
	flutter pub get
	flutter build ios --flavor prod -t lib/main/main_prod.dart
fix:
	dart fix --apply