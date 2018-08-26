#!/bin/sh

MODULE=shadowsocks
VERSION=`cat ./shadowsocks/ss/version|sed -n 1p`
TITLE=科学上网
DESCRIPTION=科学上网
HOME_URL=Main_Ss_Content.asp


do_build_result() {
if [ "$VERSION" = "" ]; then
	echo "version not found"
	exit 3
fi

rm -f ${MODULE}.tar.gz
#清理mac os 下文件
rm -f $MODULE/.DS_Store
rm -f $MODULE/*/.DS_Store

rm -f ${MODULE}.tar.gz
tar -zcvf ${MODULE}.tar.gz $MODULE
md5value=`md5sum ${MODULE}.tar.gz|tr " " "\n"|sed -n 1p`
cat > ./version <<EOF
$VERSION
$md5value
EOF
cat version

DATE=`date +%Y-%m-%d_%H:%M:%S`
cat > ./config.json.js <<EOF
{
"version":"$VERSION",
"md5":"$md5value",
"home_url":"$HOME_URL",
"title":"$TITLE",
"description":"$DESCRIPTION",
"build_date":"$DATE"
}
EOF

#update md5
# python ../softcenter/gen_install.py stage2
}


# Check and include base
DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"
if [ "$MODULE" == "" ]; then
	echo "module not found"
	exit 1
fi

if [ -f "$DIR/$MODULE/$MODULE/install.sh" ]; then
	echo "install script not found"
	exit 2
fi

# now include build_base.sh
# . $DIR/../softcenter/build_base.sh

# change to module directory
cd $DIR

# do something here
do_build_result

# backup latested package after pack
backup_version=`cat version | sed -n 1p`
backup_tar_md5=`cat version | sed -n 2p`
echo backup VERSION $backup_version
cp ${MODULE}.tar.gz ./history/${MODULE}_$backup_version.tar.gz
sed -i "/$backup_version/d" ./history/version
echo $backup_tar_md5  ${MODULE}_$backup_version.tar.gz >> ./history/version
