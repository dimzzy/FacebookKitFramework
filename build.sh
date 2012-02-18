#!/bin/bash

function failed()
{
  echo "Failed $*: $@" >&2
  exit 1
}

export OUTPUT=$WORKSPACE/output
rm -rf $OUTPUT
mkdir -p $OUTPUT

xcodebuild -target FacebookKit -configuration Release build || failed build;

cd $WORKSPACE/build/Release-iphoneuniversal || failed output;
rm FacebookKit
zip -r -y -9 $OUTPUT/FacebookKit.framework.zip FacebookKit.framework
