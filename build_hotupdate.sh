echo "1.构建宿主信息"
git checkout "$1"
flutter clean
flutter build dynamic-host

echo "2.拷贝宿主信息"
git reset --hard
git checkout "$2"
cp build/dynamic/flutter_assets/diff.dill ./
cp build/dynamic/flutter_assets/host_manifest.json ./

echo "3.diff 出热更新包"
flutter clean
flutter build dynamic --hot-update --hot-update-host-dill=./diff.dill --hot-update-host-manifest=./host_manifest.json