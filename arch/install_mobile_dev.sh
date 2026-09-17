#!/bin/bash

set -euo pipefail

echo "Starting mobile development environment installation..."

PACMAN_PACKAGES=(
    "jdk-openjdk"
    "git"
    "android-tools"
    "android-udev"
    "clang"
    "cmake"
    "ninja"
    "pkgconf"
    "gtk3"
)

AUR_PACKAGES=(
    "android-studio"
    "visual-studio-code-bin"
)

migrate_to_official_vscode() {
    if pacman -Qi visual-studio-code-bin >/dev/null 2>&1; then
        echo "Official Microsoft VS Code is already installed."
        return
    fi

    if pacman -Qi code >/dev/null 2>&1; then
        echo "Removing conflicting community VS Code package before installing visual-studio-code-bin..."
        sudo pacman -R --noconfirm code
    fi
}

if ! command -v yay >/dev/null 2>&1; then
    echo "Error: yay is required before installing mobile development AUR packages."
    echo "arch/install.sh installs yay before running this module; run the orchestrator or install yay first."
    exit 1
fi

echo "Installing Android and Flutter baseline packages..."
sudo pacman -S --needed --noconfirm "${PACMAN_PACKAGES[@]}"

migrate_to_official_vscode

echo "Installing Android Studio and official Microsoft VS Code..."
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo "Installing Flutter stable SDK under /opt/flutter..."
if command -v flutter >/dev/null 2>&1; then
    echo "Skipping Flutter SDK installation because flutter is already available in PATH."
elif [[ -x /opt/flutter/bin/flutter ]]; then
    echo "Skipping Flutter SDK installation because /opt/flutter/bin/flutter already exists."
else
    sudo git clone --depth=1 --branch stable https://github.com/flutter/flutter.git /opt/flutter
fi

INVOKING_USER="${SUDO_USER:-$USER}"

if [[ -d /opt/flutter ]]; then
    echo "Configuring Flutter SDK permissions for user: $INVOKING_USER"
    sudo groupadd -f flutter
    sudo usermod -aG flutter "$INVOKING_USER"
    sudo chgrp -R flutter /opt/flutter
    sudo chmod -R g+rwX /opt/flutter
    sudo find /opt/flutter -type d -exec chmod g+s {} +

    if command -v git >/dev/null 2>&1; then
        sudo -u "$INVOKING_USER" git config --global --add safe.directory /opt/flutter || true
    fi

    echo "Configuring Flutter profile path..."
    sudo tee /etc/profile.d/flutter.sh >/dev/null <<'EOF'
# Add Flutter SDK to PATH.
case ":$PATH:" in
    *":/opt/flutter/bin:"*) ;;
    *) export PATH="/opt/flutter/bin:$PATH" ;;
esac
EOF
else
    echo "Skipping /opt/flutter permissions and profile setup because Flutter is managed outside /opt/flutter."
fi

echo "Configuring Android SDK profile paths..."
sudo tee /etc/profile.d/android.sh >/dev/null <<'EOF'
# Android SDK environment for each interactive user.
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

case ":$PATH:" in
    *":$ANDROID_HOME/emulator:"*) ;;
    *) export PATH="$ANDROID_HOME/emulator:$PATH" ;;
esac

case ":$PATH:" in
    *":$ANDROID_HOME/platform-tools:"*) ;;
    *) export PATH="$ANDROID_HOME/platform-tools:$PATH" ;;
esac

case ":$PATH:" in
    *":$ANDROID_HOME/cmdline-tools/latest/bin:"*) ;;
    *) export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH" ;;
esac
EOF

install_code_extension_if_missing() {
    local extension="$1"

    if code --list-extensions | grep -Fxq "$extension"; then
        echo "Skipping already installed VS Code extension: $extension"
    else
        echo "Installing VS Code extension: $extension"
        code --install-extension "$extension"
    fi
}

if command -v code >/dev/null 2>&1; then
    echo "Installing VS Code Dart and Flutter extensions..."
    install_code_extension_if_missing Dart-Code.dart-code
    install_code_extension_if_missing Dart-Code.flutter
else
    echo "VS Code CLI is not available in the current shell. Install Dart-Code.dart-code and Dart-Code.flutter after restarting your shell/session."
fi

echo "Mobile development environment installation completed."
echo "Next steps:"
echo "- Log out and log back in so group membership and profile.d PATH changes apply."
echo "- Run: flutter doctor"
echo "- Open Android Studio and install SDK components through the SDK Manager."
echo "- After SDK installation, run: flutter doctor --android-licenses"
