set -e
mkdir -p www
cp index.html sw.js manifest.json icon-192.png icon-512.png apple-touch-icon.png www/
npm install
npx cap add android
unzip -o androidres.zip -d android/app/src/main/
sed -i 's#</manifest>#<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/></manifest>#' android/app/src/main/AndroidManifest.xml
npx cap sync android
cd android
chmod +x gradlew
./gradlew assembleDebug