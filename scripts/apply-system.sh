#!/bin/sh
pushd ~/nixdots
sudo nixos-rebuild switch -I nixos-config=../system/configuration.nix
popd
