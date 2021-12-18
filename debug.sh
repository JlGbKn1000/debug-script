rm -rf server
mkdir server
echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
#Mon Mar 20 21:15:37 PDT 2017
eula=true" > "server/eula.txt"
echo "enter minecraft version: "
read VERSION
curl -X GET "https://papermc.io/api/v2/projects/paper/versions/$VERSION" -H  "accept: application/json"
echo "\nselect build version: "
read LATEST_BUILD
echo "select build folder (./build/$pluginName):"
read BUILD_FILE
wget -O "server/paper.jar" "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$LATEST_BUILD/downloads/paper-$VERSION-$LATEST_BUILD.jar"
wget -O "server/start.sh" "https://raw.githubusercontent.com/JlGbKn1000/debug-script/main/start.sh"
mkdir server/plugins
mv "$BUILD_FILE" "server/plugins/"
echo "ram: 4G"
echo "version: $VERSION"
echo "build: $LATEST_BUILD"
echo "starting server.."
cd server
./start.sh
