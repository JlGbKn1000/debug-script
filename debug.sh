rm -rf server
mkdir server
echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
#Mon Mar 20 21:15:37 PDT 2017
eula=true" => "server/eula.txt"
echo "마인크래프트 버전: "
read VERSION
curl -X GET "https://papermc.io/api/v2/projects/paper/versions/$VERSION" -H  "accept: application/json"
echo "빌드 버전을 선택하세요: "
read LATEST_BUILD
wget -O "server/paper.jar" "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$LATEST_BUILD/downloads/paper-$VERSION-$LATEST_BUILD.jar"
wget -O "server/start.sh" "https://raw.githubusercontent.com/JlGbKn1000/debug-script/main/start.sh"
echo "램: 4G"
echo "버전: $VERSION"
echo "빌드: $LATEST_BUILD"
echo "서버를 시작합니다.."
cd server
./start.sh