rm -r server
mkdir server
echo "Enter minecraft version: "
read VERSION
LATEST_BUILD=$(curl -X GET "https://papermc.io/api/v2/projects/paper/versions/$VERSION" -H  "accept: application/json" | jq '.builds[-1]')
wget -O "server/paper.jar" "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$LATEST_BUILD/downloads/paper-$VERSION-$LATEST_BUILD.jar"
wget -O "server/start.sh" "https://raw.githubusercontent.com/JlGbKn1000/debug-script/master/start.sh"
echo "RAM: 4G"
echo "Version: $VERSION"
echo "Start server"
cd server
./start.sh