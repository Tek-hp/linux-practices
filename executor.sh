#! /bin/sh
flutter build bundle
sshpass -p password ssh pi@$1 "sudo systemctl stop flutter.service"
sshpass -p password ssh pi@$1 "pkill flutter-pi"
echo ".... deleting old assets ...."
sshpass -p password ssh pi@$1 "rm -r ~/flutter_assets"
echo ".... deleted old assets ...."
echo ".... uploading new assets...."
sshpass -p password scp -r ./build/flutter_assets/ pi@$1:/home/pi/
echo ".... upload complete...."
echo ".... running new assets...."
sshpass -p password ssh pi@$1 "flutter-pi -o portrait_up flutter_assets"