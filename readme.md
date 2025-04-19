# Comparing Tests
This project is dedicated to comparing the performance of the following cross-platform frameworks:
- Native
- - Android
- Flutter
- React Native

## Running & Building
### Native - Android

```sh
./gradlew clean && ./gradlew installDebug # build
```

### Flutter
```sh
flutter run --release                       # build and run
flutter build apk                           # build
```
### React Native
build: (without `--local` param it will be build on expo.dev server)
```sh
npx react-native run-android --mode=release # build and run
```

## Collecting performance data
### Android
```sh
$ app="ru.alex.bayir.kitsune"
$ adb shell su -c 'date +"%Y-%m-%d\ %H:%M:%S" && package="'$app'" && file="/storage/emulated/0/$package.csv" && echo "  PID USER         PR  NI VIRT  RES  SHR S[%CPU] %MEM     TIME+ ARGS" > $file && top -bqd .0 | grep -E "[0-9]+ +u0_a.+$package" >> $file'
$ adb pull /storage/emulated/0/$app.csv Downloads
```


```sh
app="ru.alex.bayir.nativea"
app="ru.alex.bayir.flutter"
app="ru.alex.bayir.react"

adb shell am start-activity -W -n $app/.MainActivity && adb shell am force-stop $app

adb shell dumpsys meminfo $app

adb shell 'echo "PID   USER         PR  NI VIRT  RES  SHR S  [%CPU] %MEM     TIME+ ARGS      REALTIME" && top -bqd .0 | grep -E "[0-9]+ +u0_.+'$app'" | while IFS= read -r line; do echo $line $(date +''%S.%N''); done' | tee $app.tsv
```

"-v","/tmp/.X11-unix:/tmp/.X11-unix","-e","DISPLAY=$DISPLAY","--device","/dev/dri"