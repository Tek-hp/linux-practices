#! /bin/sh
flutter build bundle
sshpass -p password ssh pi@$1 "sudo systemctl stop flutter.service"
echo ".... deleting old assets ...."
sshpass -p password ssh pi@$1 "rm -r ~/pod_workspace/pod-flutter-app/build/flutter_assets"
echo ".... deleted old assets ...."
echo ".... uploading new assets...."
sshpass -p password scp -r ./build/flutter_assets/ pi@$1:/home/pi/pod_workspace/pod-flutter-app/build/flutter_assets
echo ".... upload complete...."
echo ".... running new assets...."
sshpass -p password ssh pi@$1 "sudo systemctl start flutter.service"