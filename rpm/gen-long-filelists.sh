#!/usr/bin/env bash
# coding=utf-8
#
# WARNING: Calling this script by hand is not recommended. It should instead be
# called by the pulp-fixtures make file. That's because this script doesn't
# perform the same human-friendly input validation as `./gen-fixtures.sh`, and
# it includes hard-coded relative paths.
#
# Usage:
#
#     gen-long-filelists.sh <output_dir>
#
# Behaviour:
#
# 1. Create a temporary directory.
# 2. Copy assets into this directory.
# 3. Call gen-fixtures.sh.
# 4. Overwrite assets_dir/filelists.xml.
# 5. Remove the temporary directory.
#
set -euo pipefail

# Read arguments.
output_dir="${1}"

# Define a procedure for graceful termination.
cleanup() {
    if [ -n "${assets_dir:-}" ]; then
        rm -rf "${assets_dir}"
    fi
    if [ -n "${working_dir:-}" ]; then
        rm -rf "${working_dir}"
    fi
}
trap cleanup EXIT  # bash pseudo signal
trap 'cleanup ; trap - SIGINT ; kill -s SIGINT $$' SIGINT
trap 'cleanup ; trap - SIGTERM ; kill -s SIGTERM $$' SIGTERM


# Generate patched assets.
assets_dir="$(mktemp --directory)"
working_dir="$(mktemp --directory)"
cp -rt "${assets_dir}" rpm/assets/*

./rpm/gen-fixtures.sh "${working_dir}" "${assets_dir}"
# Usage: $script_name [options] <output-dir> <assets-dir>

cat > "${working_dir}/filelists.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<filelists xmlns="http://linux.duke.edu/metadata/filelists" packages="20000">
EOF
for _ in {1..20}; do
cat >> "${working_dir}/filelists.xml" <<EOF
  <package pkgid="ceb0f0bb58be244393cc565e8ee5ef0ad36884d8ba8eec74542ff47d299a34c1" name="bear" arch="noarch">
    <version epoch="0" ver="4.1" rel="1"/>
    <file>/tmp/bear.txt</file>
  </package>
  <package pkgid="c5c34e1843847990d2c79b936309d6257279e26f907e20f9f58073a14525e1ef" name="camel" arch="noarch">
    <version epoch="0" ver="0.1" rel="1"/>
    <file>/tmp/camel.txt</file>
  </package>
  <package pkgid="b361886f33f1b6089626dc8bd80961356f9a2911091ecb2ffa33730beb83bbdb" name="cat" arch="noarch">
    <version epoch="0" ver="1.0" rel="1"/>
    <file>/tmp/cat.txt</file>
  </package>
  <package pkgid="cdf9b6da6068213279b807254ff83716ded44421c94fe9b4bc8ad73d02a7c616" name="cheetah" arch="noarch">
    <version epoch="0" ver="1.25.3" rel="5"/>
    <file>/tmp/cheetah.txt</file>
  </package>
  <package pkgid="a6a1eedc120bc3612712be345b144a7806d2be8a1c597bf98c740340c5748ea1" name="chimpanzee" arch="noarch">
    <version epoch="0" ver="0.21" rel="1"/>
    <file>/tmp/chimpanzee.txt</file>
  </package>
  <package pkgid="12015412a93a6c867c3f2cd793ea137e74d340a2d5dd76b38cf91804b29325ba" name="cockateel" arch="noarch">
    <version epoch="0" ver="3.1" rel="1"/>
    <file>/tmp/cockateel.txt</file>
  </package>
  <package pkgid="a4bb63892ccb294ec002423007eb0538a32f84f2613fa7f6b506b39d64beef2b" name="cow" arch="noarch">
    <version epoch="0" ver="2.2" rel="3"/>
    <file>/tmp/cow.txt</file>
  </package>
  <package pkgid="9c2273cf38d3c0fb5eb79eae550c7d9ee19d25974f350a29555b75699bdfc573" name="crow" arch="noarch">
    <version epoch="0" ver="0.8" rel="1"/>
    <file>/tmp/crow.txt</file>
  </package>
  <package pkgid="03716bcde4018ead819dc5cae70b3ffc99bd0b3995cb67903ad513a8a36336ee" name="dog" arch="noarch">
    <version epoch="0" ver="4.23" rel="1"/>
    <file>/tmp/dog.txt</file>
  </package>
  <package pkgid="965ce86624b463ba3134dcba2da5beda2970da40ff14ef7a7d071826dbac2519" name="dolphin" arch="noarch">
    <version epoch="0" ver="3.10.232" rel="1"/>
    <file>/tmp/dolphin.txt</file>
  </package>
  <package pkgid="96f37877518a1fe6ea2e17f4ce1fc81b40908043bcbed76744b3d7d38a774bc7" name="duck" arch="noarch">
    <version epoch="0" ver="0.6" rel="1"/>
    <file>/tmp/duck.txt</file>
  </package>
  <package pkgid="254d55cf35cd91085edf5f2c66cde7778167ca3cebd4a5fe6ba334a23e8499b3" name="elephant" arch="noarch">
    <version epoch="0" ver="8.3" rel="1"/>
    <file>/tmp/elephant.txt</file>
  </package>
  <package pkgid="467c73425dcc43ef64dccf50d70fdcdb7e3bba5706c37b534a0f4f043aa7b688" name="fox" arch="noarch">
    <version epoch="0" ver="1.1" rel="2"/>
    <file>/tmp/fox.txt</file>
  </package>
  <package pkgid="d489a5ea552e5ea595976e39f891fe249e95d8eb40cbd7f50a46c0126a7072ab" name="frog" arch="noarch">
    <version epoch="0" ver="0.1" rel="1"/>
    <file>/tmp/frog.txt</file>
  </package>
  <package pkgid="9c3f67ddd806d47c09d563ef94b622cd5a1736552b2f5bfb4c71f98cebb14729" name="giraffe" arch="noarch">
    <version epoch="0" ver="0.67" rel="2"/>
    <file>/tmp/giraffe.txt</file>
  </package>
  <package pkgid="fe434a32ea05616dadf9c1fe90b591cbe1fc055dd94824c2426fb95dea50bccd" name="gorilla" arch="noarch">
    <version epoch="0" ver="0.62" rel="1"/>
    <file>/tmp/gorilla.txt</file>
  </package>
  <package pkgid="8f910e5b495c8e90b140a5ed422615edf297ecb1f994204ac5366d29feef95e7" name="horse" arch="noarch">
    <version epoch="0" ver="0.22" rel="2"/>
    <file>/tmp/horse.txt</file>
  </package>
  <package pkgid="833af594bc0ba31256045ed1fb17d3df2d8341a89b0c5a9bf610dd6103ce4cc8" name="kangaroo" arch="noarch">
    <version epoch="0" ver="0.2" rel="1"/>
    <file>/tmp/kangaroo.txt</file>
  </package>
  <package pkgid="72dd5d133a14e7ca371839f069714a2a44c90c2001d605321fd9e6e7b99ca023" name="lion" arch="noarch">
    <version epoch="0" ver="0.4" rel="1"/>
    <file>/tmp/lion.txt</file>
  </package>
  <package pkgid="207edfa78f98e8eb034341630a7cdb2d6ba8cce510bcfa2952e3576bcf8aa49f" name="mouse" arch="noarch">
    <version epoch="0" ver="0.1.12" rel="1"/>
    <file>/tmp/mouse.txt</file>
  </package>
  <package pkgid="3e27115f687048a6a6f3538a37e87eddebbbb3a31a5874b97d14f1682da53a0f" name="penguin" arch="noarch">
    <version epoch="0" ver="0.9.1" rel="1"/>
    <file>/tmp/penguin.txt</file>
  </package>
  <package pkgid="35632daef8124ef8f20bc216f5ca029e048de36a243a62bb1de45c596389daf8" name="pike" arch="noarch">
    <version epoch="0" ver="2.2" rel="1"/>
    <file>/tmp/pike.txt</file>
  </package>
  <package pkgid="7eab7401fe209f0930b65a89c5bbdbe7058e1cc892cff71294877cb3f985a2ea" name="shark" arch="noarch">
    <version epoch="0" ver="0.1" rel="1"/>
    <file>/tmp/shark.txt</file>
  </package>
  <package pkgid="fb23d97b733a2cdf084c6cf1ea79ce8081d0c5332f3d08b5603b7f8b59d24a57" name="squirrel" arch="noarch">
    <version epoch="0" ver="0.1" rel="1"/>
    <file>/tmp/squirrel.txt</file>
  </package>
  <package pkgid="002634703c8a5e467603f208fa2ac7062715c03bbc46846776814857e546e225" name="stork" arch="noarch">
    <version epoch="0" ver="0.12" rel="2"/>
    <file>/tmp/stork.txt</file>
  </package>
  <package pkgid="61724e3ebd4ff93943d75b504ba78fe2854acdc753e7e7ce4e4a25f44a69c334" name="tiger" arch="noarch">
    <version epoch="0" ver="1.0" rel="4"/>
    <file>/tmp/tiger.txt</file>
  </package>
  <package pkgid="1024a6a1e466e1b57eaee3df88ed6e6c285c6393c74fb5c1ac7fa6a359d660ad" name="trout" arch="noarch">
    <version epoch="0" ver="0.12" rel="1"/>
    <file>/tmp/trout.txt</file>
  </package>
  <package pkgid="516a22ccc0cbe3ecb2cbee1c626a39b91767dbf0f815afda7b733aa56523142c" name="walrus" arch="noarch">
    <version epoch="0" ver="0.71" rel="1"/>
    <file>/tmp/walrus.txt</file>
  </package>
  <package pkgid="74533fbd4f9ada9e02a6361cbbf014b8ff88dff8d69785ec48b77e01898e7c31" name="walrus" arch="noarch">
    <version epoch="0" ver="5.21" rel="1"/>
    <file>/tmp/walrus.txt</file>
  </package>
  <package pkgid="0e8fa6f873dade016d7a0bb4df0f29701ad4ce29ed354e791e672d57358c4058" name="whale" arch="noarch">
    <version epoch="0" ver="0.2" rel="1"/>
    <file>/tmp/whale.txt</file>
  </package>
  <package pkgid="a42b42020d3f3eefc4421d89ce341a7b9f9293c1b4bdea33bb855a6fd7cce6f2" name="wolf" arch="noarch">
    <version epoch="0" ver="9.4" rel="2"/>
    <file>/tmp/wolf.txt</file>
  </package>
  <package pkgid="7aa66335d8ebc295d626abc0639135ff6dec6333d4e94e0da69ed720c5fdd5f0" name="zebra" arch="noarch">
    <version epoch="0" ver="0.1" rel="2"/>
    <file>/tmp/zebra.txt</file>
  </package>
EOF
done
cat >> "${working_dir}/filelists.xml" <<EOF
  </filelists>
EOF

cp -r --no-preserve=mode --reflink=auto "${working_dir}" "${output_dir}"
