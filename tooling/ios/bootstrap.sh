#!/usr/bin/env bash
set -euo pipefail
[[ "$(uname -s)" == Darwin ]] || { echo "requires macOS and Xcode" >&2; exit 2; }
command -v flutter >/dev/null
command -v xcodebuild >/dev/null
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT/app"
if [[ ! -d ios/Runner.xcodeproj ]]; then
  flutter create --platforms=ios --project-name dsh_app --org io.github.ccch1mneyyy .
fi
flutter pub get
