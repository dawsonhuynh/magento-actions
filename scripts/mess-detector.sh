#!/usr/bin/env bash

set -e

PROJECT_PATH="$(pwd)"


echo "currently in $PROJECT_PATH"

cd "$PROJECT_PATH/magento"


if [ ! -f $INPUT_RULESET ]
then
  echo -e "\e[32mThe ruleset file [$INPUT_RULESET] NOT FOUND\e[0m"
  echo "Using default magento ruleset dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml"
  cp /opt/config/defaults/ruleset.xml .
  INPUT_RULESET=ruleset.xml
fi


if [ -n $INPUT_MD_SRC_PATH ]
then
  echo -e "\e[32mMess detection initiated\e[0m"
  php vendor/phpmd/phpmd/src/bin/phpmd $INPUT_MD_SRC_PATH ansi $INPUT_RULESET
else
  echo -e "\e[31mPlease specify the $md_src_path\e[0m"
  exit 1;
fi