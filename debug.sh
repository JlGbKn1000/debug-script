rm -r server
mkdir server
echo "마인크래프트 버전: "
read VERSION
LATEST_BUILD=$(curl -X GET "https://papermc.io/api/v2/projects/paper/versions/$VERSION" -H  "accept: application/json" | jq '.builds[-1]')
wget -O "server/paper.jar" "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$LATEST_BUILD/downloads/paper-$VERSION-$LATEST_BUILD.jar"
wget -O "server/start.sh" "https://raw.githubusercontent.com/JlGbKn1000/debug-script/main/start.sh"
echo "램: 4G"
echo "버전: $VERSION"
echo "서버를 시작합니다.."
cd server
./start.sh